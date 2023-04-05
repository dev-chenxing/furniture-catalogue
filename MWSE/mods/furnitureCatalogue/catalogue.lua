local ashfall = include("mer.ashfall.interop")

local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")
local log = common.createLogger("catalogue")
local this = {}

---@class furnitureCatalogue.MenuActivator.RegisteredEvent
---@field activator tes3reference

local buttonList = {
	{
		text = "Purchase Furniture",
		---@param activator tes3reference
		callback = function(activator)
			---@type furnitureCatalogue.MenuActivator.RegisteredEvent
			local eventData = { activator = activator }
			timer.delayOneFrame(function()
				event.trigger("FurnitureCatalogue", eventData)
			end)
		end,
	},
}

---@param e activateEventData
local function activateCatalogue(e)
	if e.activator ~= tes3.player then
		return
	end
	if not common.isCatalogue(e.target) then
		return
	end
	local catalogue = e.target
	if tes3ui.menuMode() then
		return false
	end
	local buttons = {}
	for _, buttonData in pairs(buttonList) do
		table.insert(buttons, {
			text = buttonData.text,
			enableRequirements = function()
				return (buttonData.enableRequirements == nil or buttonData.enableRequirements(catalogue))
			end,
			tooltipDisabled = buttonData.tooltipDisabled,
			showRequirements = function()
				return (buttonData.showRequirements == nil or buttonData.showRequirements(catalogue))
			end,
			callback = function()
				buttonData.callback(catalogue)
			end,
		})
	end
	tes3ui.showMessageMenu({ message = "Furniture Catalogue", buttons = buttons, cancels = true, cancelText = "Cancel" })
	return false
end
event.register("activate", activateCatalogue, { priority = 581 })

local spendMoneySound = {
	"jsmk_fc_spendMoney01",
	"jsmk_fc_spendMoney02",
	"jsmk_fc_spendMoney03",
	"jsmk_fc_spendMoney04",
	"jsmk_fc_spendMoney05",
}

---@param e addSoundEventData
local function moreSpendMoneySound(e)
	if e.sound.id == "jsmk_fc_spendMoney01" then
		local soundId = table.choice(spendMoneySound) ---@type string
		e.sound = tes3.getSound(soundId)
	end
end
event.register("addSound", moreSpendMoneySound)

local function getNewStock()
	tes3.player.data.furnitureCatalogue.todayStock = {}
	local picked = {}
	for i = 1, furnConfig.stockAmount do
		picked[math.random(1, #furnConfig.furniture)] = true
	end
	for j, furniture in ipairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			tes3.player.data.furnitureCatalogue.todayStock[furniture.id] = true
		end
	end
end

this.customRequirements = {
	inStock = function(furniture)
		return {
			getLabel = function()
				return "In-Stock"
			end,
			check = function()
				local today = tes3.findGlobal("DaysPassed").value
				if tes3.player.data.furnitureCatalogue.today ~= today then
					getNewStock()
					tes3.player.data.furnitureCatalogue.today = today
				end
				if tes3.player.data.furnitureCatalogue.todayStock[furniture.id] then
					return true
				else
					return false, string.format("Unfortunately, this product is out of stock.")
				end
			end,
		}
	end,
}

---@class furnitureCatalogue.order
---@field shop string
---@field dayPassed number
---@field date string
---@field status furnitureCatalogue.order.status
---@field product furnitureCatalogue.order.product
---@field discount number

---@alias furnitureCatalogue.order.status
---| '"Processing"'
---| '"On hold"'
---| '"Completed"'
---| '"Cancelled"'
---| '"Refunded"'

---@class furnitureCatalogue.order.product
---@field id string
---@field quantity number?
---@field price number

local currentActivator ---@type tes3reference
local localPickup ---@type boolean?
local discountPerc = 0.1
local freeShipping = false
local flatRate = 60

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getCurrentActivator(e)
	currentActivator = e.activator
	localPickup = not common.isCatalogue(e.activator)
end
event.register("FurnitureCatalogue", getCurrentActivator)

---@param furnId string
local function placeOrder(furnId, price)
	if not furnId then
		return
	end
	tes3.messageBox("Thank you. Your order has been received.")
	tes3.player.data.furnitureCatalogue.order = tes3.player.data.furnitureCatalogue.order or {}
	local number = #tes3.player.data.furnitureCatalogue.order + 1
	local day = tes3.findGlobal("Day").value
	local month = tes3.findGMST(table.find(tes3.gmst, tes3.findGlobal("Month").value)).value
	local dayPassed = tes3.findGlobal("DaysPassed").value
	local date = string.format("%s %s (Day %s)", day, month, dayPassed)
	local quantity = 1
	local discount = discountPerc * price * quantity
	local shippingCost = freeShipping and 0 or flatRate
	local total = price - discount + shippingCost
	local cell = nil
	if tes3.player.cell.isInterior then
		cell = tes3.player.cell.id
	end
	local position = tes3.player.position
	local orientation = tes3.player.orientation
	local shippingAddress = {
		name = tes3.player.cell.editorName,
		cell = cell,
		position = { x = position.x, y = position.y, z = position.z },
		orientation = { x = orientation.x, y = orientation.y, z = orientation.z },
	}
	---@type furnitureCatalogue.order
	tes3.player.data.furnitureCatalogue.order[number] = {
		activator = currentActivator.id,
		dayPassed = dayPassed,
		date = date,
		status = "Processing",
		products = { id = furnId, quantity = quantity, price = price },
		discount = discount,
		shippingCost = shippingCost,
		total = total,
		localPickup = localPickup,
		shippingAddress = shippingAddress,
	}
	log:debug(
	"order[%s] = { activator = %s, dayPassed = %s, date = %s, status = Processing, product = { id = %s, quantity = 1, price = %s }, discount = %s, shipping cost = %s, total = %s, local pickup = %s, shipping address = %s }",
	number, currentActivator.id, dayPassed, date, furnId, price, discount, shippingCost, total, localPickup, shippingAddress.name)
end

local function addRecipe(recipes, furniture)
	local furnitureObj = tes3.getObject(furniture.id)
	if not furnitureObj then
		return
	end
	local bedrollButtons = nil
	-- Only register beds if Ashfall is installed
	if furniture.category == "Beds" then
		if ashfall then
			bedrollButtons = { include("mer.ashfall.items.bedroll").buttons.sleep }
		else
			return
		end
	end
	---@type CraftingFramework.Recipe
	local recipe = {
		id = "FurnitureCatalogue:" .. furniture.id,
		craftableId = furniture.id,
		description = furniture.description,
		noResult = not config.devInstantDelivery,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = { this.customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundId = "jsmk_fc_spendMoney01",
		---@param self CraftingFramework.Craftable
		---@param e CraftingFramework.Craftable.craftCallback.params
		craftCallback = function(self, e)
			log:debug("craftCallback(%s)", furniture.id)
			placeOrder(furniture.id, furniture.cost)
		end,
		previewMesh = furnitureObj.mesh,
	}
	table.insert(recipes, recipe)
end

do
	local recipes = {}
	for _, furniture in ipairs(furnConfig.furniture) do
		addRecipe(recipes, furniture)
	end
	MenuActivator:new({
		name = "Furniture Catalogue",
		id = "FurnitureCatalogue",
		type = "event",
		recipes = recipes,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Place Order",
		materialsHeaderText = "Cost",
	})
end

return this
