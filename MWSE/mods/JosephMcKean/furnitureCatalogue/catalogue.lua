local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")
local log = common.createLogger("catalogue")
local this = {}

---@alias furnitureCatalogue.type
---|  "merchants"
---|  "catalogueI"
---|  "catalogueII"

---@class furnitureCatalogue.MenuActivator.RegisteredEvent
---@field activator tes3reference

this.currentActivator = nil ---@type tes3reference

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getActivatorRef(e)
	log:debug("FurnitureCatalogueMerchants: %s", e.activator)
	if e.activator.object.objectType == tes3.objectType.npc then
		this.currentActivator = e.activator
	end
end
event.register("FurnitureCatalogueMerchants", getActivatorRef)

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getActivatorRef(e)
	log:debug("Triggered FurnitureCatalogueI")
	this.currentActivator = tes3.player
end
event.register("FurnitureCatalogueI", getActivatorRef)

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getActivatorRef(e)
	log:debug("Triggered FurnitureCatalogueII")
	this.currentActivator = tes3.player
end
event.register("FurnitureCatalogueII", getActivatorRef)

local buttonList = {
	{
		text = "Purchase Furniture",
		---@param activator tes3reference
		---@param type furnitureCatalogue.type
		callback = function(activator, type)
			---@type furnitureCatalogue.MenuActivator.RegisteredEvent
			local eventData = { activator = activator }
			timer.delayOneFrame(function()
				if type == "catalogueI" then
					event.trigger("FurnitureCatalogueI", eventData)
				elseif type == "catalogueII" then
					event.trigger("FurnitureCatalogueII", eventData)
				end
			end)
		end,
	},
	{
		text = "Pick Up",
		---@param activator tes3reference
		callback = function(activator)
			tes3.addItem({ reference = tes3.player, item = activator.id })
			activator:disable()
			activator:delete()
		end,
	},
}

---@param e activateEventData
local function activateCatalogue(e)
	if e.activator ~= tes3.player then
		return
	end
	local type = common.isCatalogue(e.target)
	if not type then
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
				buttonData.callback(catalogue, type)
			end,
		})
	end
	tes3ui.showMessageMenu({ message = "Furniture Catalogue", buttons = buttons, cancels = true, cancelText = "Cancel" })
	return false
end
event.register("activate", activateCatalogue, { priority = 581 })

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
				event.trigger("FurnitureCatalogueMerchants", eventData)
			end, timer.real)
		end)
	end
end
event.register("uiActivated", onMenuDialogActivated, { filter = "MenuDialog", priority = -100 })

local function merchantMobileActivated(e)
	local merchant = e.reference
	if config.furnitureMerchants[merchant.baseObject.id:lower()] then
		if not merchant.data.furnitureCatalogueAdded then
			merchant.data.furnitureCatalogueAdded = true
			local container = tes3.createReference({
				object = "jsmk_fc_merchant_inventory",
				position = merchant.position:copy(),
				orientation = merchant.orientation:copy(),
				cell = merchant.cell,
			})
			tes3.setOwner({ reference = container, owner = merchant })
		end
	end
end
event.register("mobileActivated", merchantMobileActivated)

return this
