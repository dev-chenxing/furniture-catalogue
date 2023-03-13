local ashfall = include("mer.ashfall.interop")
local common = require("retail.common")
local config = require("retail.config")
local furnConfig = require("retail.staticConfig.furniture")
local this = {}

local function getNewStock()
	tes3.player.data.retail.todayStock = {}
	local picked = {}
	for i = 1, furnConfig.stockAmount do
		picked[math.random(1, #furnConfig.furniture)] = true
	end
	for j, furniture in ipairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			tes3.player.data.retail.todayStock[furniture.id] = true
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
				if tes3.player.data.retail.today ~= today then
					getNewStock()
					tes3.player.data.retail.today = today
				end
				if tes3.player.data.retail.todayStock[furniture.id] then
					return true
				else
					return false, string.format("Unfortunately, this product is out of stock.")
				end
			end,
		}
	end,
	moreFurniture = function(tier)
		local numberMap = { [1] = "I", [2] = "II", [3] = "III" }
		local perkName = (numberMap[tier] and "More Furniture " .. numberMap[tier]) or "Basic Furniture"
		return {
			getLabel = function()
				return perkName
			end,
			check = function()
				local shopManager = common.getShopManager()
				if shopManager and shopManager.data.moreFurniture >= tier then
					return true
				else
					return false, string.format("You must have the %s perk to be able to purchase this", perkName)
				end
			end,
		}
	end,
}

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
		id = "Retail:" .. furniture.id,
		craftableId = furniture.id,
		description = furniture.description,
		noResult = not config.devInstantDelivery,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = {
			this.customRequirements.inStock(furniture),
			this.customRequirements.moreFurniture(furniture.tier),
		},
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundType = "spendMoney",
		quickActivateCallback = function(self, e)
			require("retail.displayTable").set(e.reference)
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
		name = "Retail: Purchase Furniture",
		id = "Retail:PurchaseFurniture",
		type = "event",
		recipes = recipes,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Order",
		materialsHeaderText = "Cost",
	})
end

--[[
	spendMoney = {
			"retail\\spendMoneyCoin1.wav",
			"retail\\spendMoneyCoin2.wav",
			"retail\\spendMoneyCoin3.wav",
			"retail\\spendMoneyCoin4.wav",
			"retail\\spendMoneyCoinBag1.wav",
		},
]]

return this
