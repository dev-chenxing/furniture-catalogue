local ashfall = include("mer.ashfall.interop")
local MenuActivator = include("CraftingFramework.components.MenuActivator")

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
		return
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
	---@param furniture furnitureCatalogue.furniture
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

local GUI_ID = {
	MenuDialog = tes3ui.registerID("MenuDialog"),
	MenuDialog_TopicList = tes3ui.registerID("MenuDialog_topics_pane"),
	MenuDialog_Divider = tes3ui.registerID("MenuDialog_divider"),
	MenuDialog_PurchaseFurniture = tes3ui.registerID("MenuPurchaseFurniture"),
}

--- Checks if the npc sells furniture
--- @param ref tes3reference
--- @return boolean
local function checkIfFurnitureMerchant(ref)
	return config.furnitureMerchants[ref.baseObject.id:lower()]
end

-- To keep the service buttons visible after the menu updates
local function setServiceButtonVisibilitiesToTrue()
	local menu = tes3ui.findMenu(GUI_ID.MenuDialog)
	if not menu then
		return
	end

	local serviceButton = menu:findChild(GUI_ID.MenuDialog_PurchaseFurniture)
	if serviceButton and not serviceButton.visible then
		if checkIfFurnitureMerchant(tes3ui.getServiceActor().reference) then
			serviceButton.visible = true
			log:debug("Purchase Furniture button set to visible")
		end
	end
end
event.register("infoGetText", setServiceButtonVisibilitiesToTrue)
event.register("uiEvent", setServiceButtonVisibilitiesToTrue)

--- @param e uiActivatedEventData
local function onMenuDialogActivated(e)
	local actor = tes3ui.getServiceActor()
	local actorRef = actor.reference ---@type tes3reference
	log:debug("Talking to %s", actorRef.id)
	local topicsScrollPane = e.element:findChild(GUI_ID.MenuDialog_TopicList)
	local divider = topicsScrollPane:findChild(GUI_ID.MenuDialog_Divider)
	local topicsList = divider.parent

	-- Need to update the visibility once after the menu is updated for the
	-- first time, after that, we update the visibility on each "uiEvent" event.
	local updatedOnce = false
	local function updateOnce()
		if updatedOnce then
			return
		end
		updatedOnce = true
		setServiceButtonVisibilitiesToTrue()
	end
	e.element:registerAfter("update", updateOnce)

	-- Add the service buttons
	if checkIfFurnitureMerchant(actorRef) then
		-- Create the new button
		local button = topicsList:createTextSelect({ id = GUI_ID.MenuDialog_PurchaseFurniture, text = "Purchase Furniture" })
		log:debug("Purchase Furniture button created")

		-- By default move it above the divider, into the services section
		topicsList:reorderChildren(divider, button, 1)

		button:register("mouseClick", function()
			---@type furnitureCatalogue.MenuActivator.RegisteredEvent
			local eventData = { activator = actorRef }
			timer.delayOneFrame(function()
				event.trigger("FurnitureCatalogue", eventData)
			end, timer.real)
		end)
	end
end
event.register("uiActivated", onMenuDialogActivated, { filter = "MenuDialog", priority = -100 })

---@param furn furnitureCatalogue.furniture
local function purchase(furn)
	local crate = furnConfig.deliveryCrate[furn.size]
	tes3.addItem({ reference = tes3.player, item = crate })
	local itemData
	itemData = tes3.addItemData({ to = tes3.player, item = crate })
	itemData.data.furnitureCatalogue = { furniture = { id = furn.id, name = furn.name } }
	tes3.messageBox("%s has been added to your inventory.", furn.name)
end

---@param recipes CraftingFramework.Recipe.data[]
---@param furniture furnitureCatalogue.furniture
local function addRecipe(recipes, furniture)
	log:debug("Adding recipe: %s", furniture.id)
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
		craftableId = furnConfig.deliveryCrate[furniture.size],
		placedObject = furniture.id,
		description = furniture.description,
		-- noResult = not config.devInstantDelivery,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = { this.customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundId = "jsmk_fc_spendMoney01",
		--[[---@param self CraftingFramework.Craftable
		---@param e CraftingFramework.Craftable.craftCallback.params
		craftCallback = function(self, e)
			log:debug("craftCallback(%s)", furniture.id)
			purchase(furniture)
		end,]]
		previewMesh = furnitureObj.mesh,
	}
	table.insert(recipes, recipe)
end

do
	if not MenuActivator then
		return
	end
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
		craftButtonText = "Purchase",
		materialsHeaderText = "Cost",
	})
end

return this
