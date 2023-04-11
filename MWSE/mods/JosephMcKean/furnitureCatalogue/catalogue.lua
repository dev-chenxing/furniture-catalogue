local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")

local log = common.createLogger("catalogue")

local this = {}
this.currentActivator = nil ---@type tes3reference

local GUI_ID = {
	MenuDialog = tes3ui.registerID("MenuDialog"),
	MenuDialog_TopicList = tes3ui.registerID("MenuDialog_topics_pane"),
	MenuDialog_Divider = tes3ui.registerID("MenuDialog_divider"),
	MenuDialog_PurchaseFurniture = tes3ui.registerID("MenuPurchaseFurniture"),
}

local catalogueI = "jsmk_fc_catalogue_01" -- the id of the Furniture Catalogue
local catalogueII = "jsmk_fc_catalogue_02" -- the id of the Furniture Catalogue: Deluxe
local catalogueType = { [catalogueI] = "catalogueI", [catalogueII] = "catalogueII" }

--- Returns the type of catalogue of the object with the specified id
---@param id string
---@return string?
local function isCatalogue(id)
	return catalogueType[id:lower()]
end

---@alias furnitureCatalogue.type
---|  "merchants"
---|  "catalogueI"
---|  "catalogueII"

---@class furnitureCatalogue.MenuActivator.RegisteredEvent
---@field reference tes3reference? the reference that triggers the menu
---@field item tes3misc? the catalogue item that triggers the menu

---@param e furnitureCatalogue.MenuActivator.RegisteredEvent
local function getActivatorRef(e)
	if e.reference and e.reference.object.objectType == tes3.objectType.npc then
		--- set the currentActivator to the merchant we are buying furniture from
		log:debug("FurnitureCatalogueMerchants: %s", e.reference)
		this.currentActivator = e.reference
	else
		--- set the currentActivator to player if we are buying from a book
		this.currentActivator = tes3.player
	end
end
--- These events are triggered by clicking the purchase furniture button or activating the book
event.register("FurnitureCatalogueMerchants", getActivatorRef)
event.register("FurnitureCatalogueI", getActivatorRef)
event.register("FurnitureCatalogueII", getActivatorRef)

---@param e playItemSoundEventData
local function stopItemSounds(e)
	if not isCatalogue(e.item.id) then
		return
	end
	if e.state == 0 then -- item up
		tes3.playSound({ reference = e.reference, sound = "book open" })
	elseif e.state == 1 then -- item down
		tes3.playSound({ reference = e.reference, sound = "book close" })
	end
	return false
end
event.register("playItemSound", stopItemSounds, { priority = 1000 })

---@param catalogue tes3misc
local function triggerMenu(catalogue, type)
	tes3.playSound({ reference = tes3.player, sound = "scroll" })
	---@type furnitureCatalogue.MenuActivator.RegisteredEvent
	local eventData = { item = catalogue }
	timer.delayOneFrame(function()
		if type == "catalogueI" then
			event.trigger("FurnitureCatalogueI", eventData)
		elseif type == "catalogueII" then
			event.trigger("FurnitureCatalogueII", eventData)
		end
	end)
end

--- Triggered the MenuActivator FurnitureCatalogueI or FurnitureCatalogueII when activating the book
---@param e activateEventData
local function activateCatalogue(e)
	if e.activator ~= tes3.player then
		return
	end
	local type = isCatalogue(e.target.id)
	if not type then
		return
	end
	--- Allows drag-and-drop method
	if tes3ui.menuMode() then
		return
	end
	local catalogue = e.target.object ---@cast catalogue tes3misc
	triggerMenu(catalogue, type)
	return false
end
event.register("activate", activateCatalogue, { priority = -10 }) -- low priority to make sure player cannot activate the book while perfect placement-ing

--- Triggered the MenuActivator FurnitureCatalogueI or FurnitureCatalogueII when equipping the book
---@param e equipEventData
local function equipCatalogue(e)
	if e.reference ~= tes3.player then
		return
	end
	local type = isCatalogue(e.item.id)
	if not type then
		return
	end
	local catalogue = e.item ---@cast catalogue tes3misc
	triggerMenu(catalogue, type)
	return false
end
event.register("equip", equipCatalogue, { priority = 581 })

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
		end
	end
end
event.register("infoGetText", setServiceButtonVisibilitiesToTrue)
event.register("uiEvent", setServiceButtonVisibilitiesToTrue)

--- Add the Purchase Furniture to furniture merchant npcs upon talking to them
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
			local eventData = { reference = actorRef }
			timer.delayOneFrame(function()
				event.trigger("FurnitureCatalogueMerchants", eventData)
			end, timer.real) -- have to specify timer.real type so the Crafting Framework menu can open in menu mode
		end)
	end
end
event.register("uiActivated", onMenuDialogActivated, { filter = "MenuDialog", priority = -100 })

--- This section creates the essential objects so I don't need a plugin file
local merchantInventoryId = "jsmk_fc_merchant_inventory"
do
	--- Creating Furniture Catalogue: Standard
	local catalogueIObj = tes3.getObject(catalogueI)
	if not catalogueIObj then
		catalogueIObj = tes3.createObject({
			id = catalogueI,
			objectType = tes3.objectType.miscItem,
			name = "Furniture Catalogue: Standard",
			mesh = "jsmk\\fc\\catalogue_01.nif",
			icon = "jsmk\\fc\\catalogue_01.dds",
			weight = 3,
			value = 3000,
		})
	end
	--- Creating Furniture Catalogue: Deluxe
	local catalogueIIObj = tes3.getObject(catalogueII)
	if not catalogueIIObj then
		catalogueIIObj = tes3.createObject({
			id = catalogueII,
			objectType = tes3.objectType.miscItem,
			name = "Furniture Catalogue: Deluxe",
			mesh = "jsmk\\fc\\catalogue_02.nif",
			icon = "jsmk\\fc\\catalogue_02.dds",
			weight = 3,
			value = 30000, -- still unsure if this is a reasonable price
		})
	end
	--- Creating invisible container
	local merchantInventory = tes3.getObject(merchantInventoryId)
	if not merchantInventory then
		merchantInventory = tes3.createObject({
			id = merchantInventoryId,
			objectType = tes3.objectType.container,
			name = "Furniture Catalogues",
			mesh = "EditorMarker.nif",
			capacity = 1000,
		})
	end
end

--- Upon cell changed, place the catalogue in Dondril, Craftsmer's Hall and Vivec, The Abbey of St. Delyn the Wise
--- Might cause compatibility problem later on
--- Because people can't check in tes3view and the construction set
---@param e cellChangedEventData
local function placeCatalogue(e)
	if e.cell.id == "Dondril, Craftsmer's Hall" and not tes3.player.data.furnitureCatalogue.catalogueIPlaced then
		tes3.player.data.furnitureCatalogue.catalogueIPlaced = true
		tes3.createReference({
			object = catalogueI,
			position = tes3vector3.new(4606.880, 4502.960, 15491.104),
			orientation = tes3vector3.new(0, 0, 5.16),
			cell = e.cell,
		})
	elseif e.cell.id == "Vivec, The Abbey of St. Delyn the Wise" and not tes3.player.data.furnitureCatalogue.catalogueIIPlaced then
		tes3.player.data.furnitureCatalogue.catalogueIIPlaced = true
		tes3.createReference({
			object = catalogueII,
			position = tes3vector3.new(1312.389, 346.616, -373.685),
			orientation = tes3vector3.new(0, 0, 0.67),
			cell = e.cell,
		})
	end
end
event.register("cellChanged", placeCatalogue)

--- When talking to the merchant, place the invisible container at merchant's feet and add the catalogues to the container
local function merchantMobileActivated(e)
	local merchant = e.reference
	if config.furnitureMerchants[merchant.baseObject.id:lower()] then
		if not merchant.data.furnitureCatalogueAdded then
			merchant.data.furnitureCatalogueAdded = true
			log:debug("Adding catalogues to merchant %s", merchant.id)
			local container = tes3.createReference({
				object = merchantInventoryId,
				position = merchant.position:copy(),
				orientation = merchant.orientation:copy(),
				cell = merchant.cell,
			})
			tes3.player.tempData.container = container
			tes3.setOwner({ reference = container, owner = merchant })
			tes3.addItem({ reference = container, item = catalogueI })
			tes3.addItem({ reference = container, item = catalogueII })
		end
	end
end
event.register("mobileActivated", merchantMobileActivated)

return this
