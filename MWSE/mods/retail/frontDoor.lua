local common = require("retail.common")
local customer = require("retail.customer")
local log = common.createLogger("frontDoor")
local this = {}

---@param e uiObjectTooltipEventData
local function frontDoorTooltip(e)
	if e.reference and e.reference.data and e.reference.data.isFrontDoor then
		local block = e.tooltip:createBlock()
		block.minWidth = 1
		block.maxWidth = 440
		block.autoWidth = true
		block.autoHeight = true
		block.paddingAllSides = 4
		local label = block:createLabel({ id = tes3ui.registerID("Retail_front_door"), text = "Front Door" })
		label.wrapText = true
		label.color = tes3ui.getPalette(tes3.palette.activeOverColor)
	end
end
event.register("uiObjectTooltip", frontDoorTooltip)

function this.openShop(frontDoor)
	frontDoor.data.open = not frontDoor.data.open
	timer.delayOneFrame(function()
		if frontDoor.data.open then
			-- Opening the shop
			tes3.playSound({ soundPath = "\\R0\\fx\\chime0" .. math.random(1, 4) .. ".wav" })
			frontDoor.data.spawnPoint = { position = tes3.player.position, orientation = tes3.player.orientation }
			customer.spawnTimerStart(frontDoor)
		else
			-- Closing the shop
			tes3.messageBox("Closing the shop has not been implemented.")
		end
	end)
end

local buttonList = {
	{
		text = function(frontDoor)
			return string.format("%s Shop", frontDoor.data.open and "Open" or "Close")
		end,
		showRequirements = function(frontDoor, shopManagerRef)
			return frontDoor.data.isFrontDoor
		end,
		callback = function(frontDoor, shopManagerRef)
			this.openShop(frontDoor)
		end,
	},
	{
		text = "Leave Shop",
		callback = function(frontDoor)
			frontDoor.data.leaveShop = true
		end,
	},
}

--- Shift activate to set shop Front Door. Priority lower than abot's Loading Doors so you can lock Front Doors with keys.
---@param e activateEventData
local function setShopFrontDoor(e)
	if not tes3.worldController.inputController:isShiftDown() then
		return
	end
	if tes3ui.menuMode() then
		return
	end
	if e.activator ~= tes3.player then
		return
	end
	if not common.isValidDoor(e.target) then -- Has to be a door
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	local frontDoor = e.target
	local shopName = shopManager.data.shopName or shopManager.data.cellId
	log:debug("shopManager.data.cellId = %s", shopManager.data.cellId)
	if frontDoor.data.isFrontDoor then
		frontDoor.data.isFrontDoor = false
		shopManager.data.hasFrontDoor = false
		local message = string.format("Unset as the Front Door of %s", shopName)
		tes3.messageBox(message)
		log:debug(message)
	elseif shopManager.data.hasFrontDoor then
		local message = string.format("%s already has a Front Door. Unset the Front Door to set a new one.", shopName)
		tes3.messageBox(message)
		log:debug(message)
	else
		frontDoor.data.isFrontDoor = true
		frontDoor.modified = true
		shopManager.data.hasFrontDoor = true
		local message = string.format("Set as the Front Door of %s", shopName)
		tes3.messageBox(message)
		log:debug(message)
	end
	return false
end
event.register("activate", setShopFrontDoor, { priority = 571 })

return this
