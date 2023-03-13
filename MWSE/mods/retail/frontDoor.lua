local common = require("retail.common")
local customer = require("retail.customer")
local log = common.createLogger("frontDoor")
local this = {}

function this.openShop(frontDoor, shopManager)
	frontDoor.data.open = not frontDoor.data.open
	if frontDoor.data.open then
		-- Opening the shop
		if not tes3.player.data.retail.tutorialFinished then
			shopManager.data.openShopOnce = true
		end
		tes3.playSound({ soundPath = "\\R0\\fx\\chime0" .. math.random(1, 4) .. ".wav" })
		local position = tes3.player.position
		local orientation = tes3.player.orientation
		frontDoor.data.spawnPoint = {
			position = tes3vector3.new(position.x, position.y, position.z),
			orientation = tes3vector3.new(orientation.x, orientation.y, orientation.z + math.pi),
		}
		tes3.messageBox("%s is Open For Business!", shopManager.data.shopName or shopManager.data.cellId)
		customer.spawnTimerStart(frontDoor)
	else
		-- Closing the shop
		tes3.messageBox("Closing the shop has not been implemented.")
	end
end

local buttonList = {
	{
		text = function(frontDoor)
			return string.format("%s Shop", frontDoor.data.open and "Close" or "Open")
		end,
		callback = function(frontDoor, shopManager)
			this.openShop(frontDoor, shopManager)
		end,
	},
	{
		text = "Leave Shop",
		callback = function(frontDoor)
			tes3.player:activate(frontDoor)
		end,
	},
}

--- @class RetailFrontDoorEventData
--- @field frontDoor tes3reference The reference of the Front Door
--- @field shopManager tes3reference The reference of the ShopManager
--- @param e RetailFrontDoorEventData
local function showFrontDoorMenu(e)
	local buttons = {}
	for _, buttonData in pairs(buttonList) do
		table.insert(buttons, {
			text = function()
				if type(buttonData.text) == "string" then
					return buttonData.text
				elseif type(buttonData.text) == "function" then
					return buttonData.text(e.frontDoor)
				end
			end,
			enableRequirements = function()
				return (buttonData.enableRequirements == nil or buttonData.enableRequirements(e.frontDoor))
			end,
			tooltipDisabled = buttonData.tooltipDisabled,
			showRequirements = function()
				return (buttonData.showRequirements == nil or buttonData.showRequirements(e.frontDoor))
			end,
			callback = function()
				buttonData.callback(e.frontDoor, e.shopManager)
			end,
		})
	end
	tes3ui.showMessageMenu({ message = "Front Door", buttons = buttons, cancels = true, cancelText = "Cancel" })
end
event.register("Retail:FrontDoor", showFrontDoorMenu)

---@param e activateEventData
local function activateFrontDoor(e)
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
	if shopManager.cell.id ~= shopManager.data.cellId then
		return
	end
	if not frontDoor.data.isFrontDoor then
		return
	end
	if tes3ui.menuMode() then
		return
	end
	timer.delayOneFrame(function()
		event.trigger("Retail:FrontDoor", { frontDoor = frontDoor, shopManager = shopManager })
	end)
	return false
end
event.register("activate", activateFrontDoor, { priority = 561 })

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
