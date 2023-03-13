local common = require("retail.common")
local customer = require("retail.customer")
local displayTable = require("retail.displayTable")
local log = common.createLogger("shopManager")
local this = {}

--- @class shopManager.renameShop.params
--- @field activator tes3reference
--- @field init boolean?
--- @param params shopManager.renameShop.params This table accepts the following values:
--- 
--- `activator`: tes3reference — The reference of the shop's front door or shop manager.
--- 
--- `init`: boolean? — *Default*: `false`. Opens the shop after renaming the shop. The activator has to be a front foor if true.
function this.renameShop(params)
	local menu = tes3ui.createMenu({ id = tes3ui.registerID("MenuNameTheShop"), fixedFrame = true })
	menu.minWidth = 400
	local label = menu:createLabel({ id = tes3ui.registerID("MenuNameTheShop_label"), text = "Name the shop" })
	label.color = tes3ui.getPalette(tes3.palette.headerColor)
	label.borderAllSides = 10
	label.wrapText = true
	label.justifyText = "center"
	local inputBorder = menu:createThinBorder({ id = tes3ui.registerID("MenuNameTheShop_input_border") })
	inputBorder.height = 30
	inputBorder.width = 300
	inputBorder.absolutePosAlignX = 0.5
	inputBorder.borderAllSides = 10
	inputBorder.paddingAllSides = 5
	inputBorder.paddingLeft = 8
	inputBorder.consumeMouseEvents = true
	local input = inputBorder:createTextInput({ id = tes3ui.registerID("MenuNameTheShop_input") })
	input.text = tes3.player.cell.displayName
	input.color = tes3ui.getPalette(tes3.palette.whiteColor)
	input.absolutePosAlignX = 0.5
	input.absolutePosAlignY = 0.5
	inputBorder:register("mouseClick", function()
		tes3ui.acquireTextInput(input)
	end)
	tes3ui.acquireTextInput(input)
	local buttons = menu:createBlock({ id = tes3ui.registerID("MenuNameTheShop_buttons") })
	buttons.height = 30
	buttons.autoWidth = true
	buttons.absolutePosAlignX = 0.5
	local ok = buttons:createButton({ id = tes3ui.registerID("MenuNameTheShop_ok"), text = "OK" })
	ok:register("mouseClick", function()
		tes3.player.cell.displayName = input.text
		if params.activator.data.isShopManager then
			params.activator.data.shopName = input.text -- shopManager.data.shopName
		elseif common.isValidDoor(params.activator) then
			params.activator.data.isFrontDoor = true
			common.getShopManager().data.shopName = input.text -- shopManager.data.shopName
		end
		tes3ui.acquireTextInput(nil)
		tes3ui.leaveMenuMode()
		tes3ui.findMenu("MenuNameTheShop"):destroy()
		if params.init then -- the activator has to be a front door if init is true
			require("retail.frontDoor").openShop(params.activator)
		end
	end)
	local cancel = buttons:createButton({ id = tes3ui.registerID("MenuNameTheShop_cancel"), text = "Cancel" })
	cancel:register("mouseClick", function()
		tes3ui.acquireTextInput(nil)
		tes3ui.leaveMenuMode()
		tes3ui.findMenu("MenuNameTheShop"):destroy()
	end)
	tes3ui.enterMenuMode("MenuNameTheShop")
end

local buttonList = {
	{
		text = "Start a Business",
		enableRequirements = function(shopManager)
			return not shopManager.cell.isOrBehavesAsExterior
		end,
		tooltipDisabled = "The shop needs to be in an interior cell.",
		showRequirements = function(shopManager)
			return shopManager.cell.id ~= shopManager.data.cellId
		end,
		callback = function(shopManager)
			shopManager.data.cellId = shopManager.cell.id -- mark the cell as a shop cell
			shopManager.modified = true
			tes3.messageBox({
				message = string.format("Congratulations! You can now start selling items in %s.", shopManager.cell.displayName),
				buttons = { "OK", "Skip Tutorial" },
				callback = function(e)
					if e.button == 0 then
						shopManager.data.notForSale = {}
						require("retail.tutorial").startTutorial()
					end
				end,
			})
		end,
	},
	{
		text = "Purchase Furniture",
		showRequirements = function(shopManager)
			return shopManager.cell.id == shopManager.data.cellId
		end,
		callback = function(shopManager)
			shopManager.data.moreFurniture = shopManager.data.moreFurniture or 0
			timer.delayOneFrame(function()
				event.trigger("Retail:PurchaseFurniture")
			end)
		end,
	},
	{
		text = "Edit Barter Type",
		showRequirements = function(shopManager)
			return shopManager.cell.id == shopManager.data.cellId
		end,
		callback = function(shopManager)
			if not tes3.player.data.retail.tutorialFinished then
				shopManager.data.editBarterTypeClicked = true
			end
			timer.delayOneFrame(function()
				event.trigger("Retail:EditBarterType", { shopManager = shopManager })
			end)
		end,
	},
	--[[{
		text = "Rename Shop",
		showRequirements = function(shopManager)
			return shopManager.data.cellId
		end,
		callback = function(shopManager)
			this.renameShop({ activator = shopManager })
		end,
	},]]
}

---@param e activateEventData
local function activateShopManager(e)
	if e.activator ~= tes3.player then
		return
	end
	if not common.isShopManager(e.target) then
		return
	end
	log:debug("Activating shop manager %s in %s", e.target.id, e.target.cell.id)
	local shopManager = e.target
	if tes3ui.menuMode() then
		if shopManager.data.cellId then
			return false
		else -- no business started
			return
		end
	end
	local buttons = {}
	for _, buttonData in pairs(buttonList) do
		table.insert(buttons, {
			text = buttonData.text,
			enableRequirements = function()
				return (buttonData.enableRequirements == nil or buttonData.enableRequirements(shopManager))
			end,
			tooltipDisabled = buttonData.tooltipDisabled,
			showRequirements = function()
				return (buttonData.showRequirements == nil or buttonData.showRequirements(shopManager))
			end,
			callback = function()
				buttonData.callback(shopManager)
			end,
		})
	end
	tes3ui.showMessageMenu({ message = "Shop Manager", buttons = buttons, cancels = true, cancelText = "Cancel" })
	return false
end
event.register("activate", activateShopManager, { priority = 581 })

local function initializeShopManager(e)
	local isShopManager = e.reference.data and e.reference.data.isShopManager
	if common.isShopManager(e.reference) and not isShopManager then
		local shopManager = e.reference
		shopManager.data.isShopManager = true
	end
end
event.register("referenceSceneNodeCreated", initializeShopManager)

return this
