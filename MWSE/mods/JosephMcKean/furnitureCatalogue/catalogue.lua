local ashfall = include("mer.ashfall.interop")
local CraftingFramework = require("CraftingFramework")
local MenuActivator = include("CraftingFramework.components.MenuActivator")

local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")
local log = common.createLogger("catalogue")
local this = {}

---@class furnitureCatalogue.MenuActivator.RegisteredEvent
---@field activator tes3reference

local currentActivator ---@type tes3reference

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

CraftingFramework.SoundType.register {
	id = "spendMoney",
	soundPaths = {
		"jsmk\\fc\\spendMoneyCoin1.wav",
		"jsmk\\fc\\spendMoneyCoin2.wav",
		"jsmk\\fc\\spendMoneyCoin3.wav",
		"jsmk\\fc\\spendMoneyCoin4.wav",
		"jsmk\\fc\\spendMoneyCoinBag1.wav",
	},
}

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getActivatorRef(e)
	log:debug("currentActivator: %s", e.activator)
	if e.activator.object.objectType == tes3.objectType.npc then
		currentActivator = e.activator
	else
		currentActivator = tes3.player
	end
end
event.register("FurnitureCatalogue", getActivatorRef)

local function isAshlander(ref)
	local faction = ref.object.faction
	if faction and faction.id == "Ashlanders" then
		return true
	end
	return false
end

---@param ref tes3reference
local function getNewStock(ref)
	ref.data.furnitureCatalogue.todayStock = {}
	local picked = {}
	local stockAmount = 50
	for i = 1, stockAmount do
		picked[math.random(1, table.size(furnConfig.furniture))] = true
	end
	local j = 1
	for index, furniture in pairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			if isAshlander(ref) then
				log:debug("%s is an Ashlander, %s is %s", ref.id, furniture.id,
				          (furniture.ashlandersAvailable and "ashlandersAvailable") or (furniture.ashlandersOnly and "ashlandersOnly") or "not available")
				if furniture.ashlandersAvailable or furniture.ashlandersOnly then
					log:debug("adding to todayStock")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			else
				log:debug("%s is not an Ashlander, %s is %s", ref.id, furniture.id, (furniture.ashlandersOnly and "ashlandersOnly") or "not ashlandersOnly")
				if not furniture.ashlandersOnly then
					log:debug("adding to todayStock")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			end
		end
		j = j + 1
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
				currentActivator.data.furnitureCatalogue = currentActivator.data.furnitureCatalogue or {}
				if currentActivator.data.furnitureCatalogue.today ~= today then
					getNewStock(currentActivator)
					currentActivator.data.furnitureCatalogue.today = today
				end
				if currentActivator.data.furnitureCatalogue.todayStock[furniture.id] then
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

---@param self CraftingFramework.Craftable
---@param e CraftingFramework.Craftable.SuccessMessageCallback.params
local function successMessageCallback(self, e)
	return string.format("%s has been added to your inventory.", self.name)
end

---@param recipes CraftingFramework.Recipe.data[]
---@param index string
---@param furniture furnitureCatalogue.furniture
local function addRecipe(recipes, index, furniture)
	local furnitureObj = tes3.getObject(furniture.id)
	if not furnitureObj then
		return
	end

	local craftableId = "jsmk_fc_crate_" .. index
	-- Generate the craftable if one doesn't exist
	local craftable = tes3.getObject(craftableId)
	if not craftable then
		local icon = "jsmk\\fc\\crate.dds"
		log:debug("Craftable %s for placedObject %s does not exist, creating a misc", craftableId, furniture.id)
		craftable = tes3.createObject({
			id = craftableId,
			objectType = tes3.objectType.miscItem,
			name = furniture.name,
			icon = icon,
			mesh = furnitureObj.mesh,
			weight = furniture.weight,
		})
	end
	local soundType = "spendMoney" ---@cast soundType CraftingFramework.Craftable.SoundType

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
		craftableId = craftableId,
		placedObject = furniture.id,
		description = furniture.description,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = { this.customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundType = soundType,
		scale = furniture.scale,
		previewMesh = furnitureObj.mesh,
		previewScale = furniture.previewScale,
		previewHeight = furniture.previewHeight,
		successMessageCallback = successMessageCallback,
	}
	table.insert(recipes, recipe)
end

do
	if not MenuActivator then
		return
	end
	local recipes = {} ---@type CraftingFramework.Recipe.data[]
	---@param index string 
	---@param furniture furnitureCatalogue.furniture
	for index, furniture in pairs(furnConfig.furniture) do
		addRecipe(recipes, index, furniture)
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
