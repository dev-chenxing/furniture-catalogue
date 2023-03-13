local common = require("retail.common")

---@type CraftingFramework
local CraftingFramework = require("CraftingFramework")
---@type CraftingFramework.MenuActivator
local MenuActivator = CraftingFramework.MenuActivator
local log = common.createLogger("displayTable")
local this = {}

---@param displayTable tes3reference
---@param name string?
---@param shopMana tes3reference?
function this.set(displayTable, name, shopMana)
	local displayTableName
	local shopManager
	if not shopMana then
		displayTableName = common.getDisplayTable(displayTable)
		shopManager = common.getShopManager()
	else
		displayTableName = name
		shopManager = shopMana
	end
	if not displayTableName then
		return
	end
	if not shopManager then
		return
	end
	local message
	if displayTable.data.isDisplayTable then
		displayTable.data.isDisplayTable = false
		message = string.format("%s unset as Display Table", displayTableName)
	else
		displayTable.data.isDisplayTable = true
		displayTable.modified = true
		message = string.format("%s set as Display Table", displayTableName)
	end
	tes3.messageBox(message)
	log:debug(message)
end

--- Shift activate to set as Display Table. Compatibility issues with MWCA and Loading Doors
---@param e activateEventData
local function setWorldDisplayTable(e)
	if not tes3.worldController.inputController:isShiftDown() then
		return
	end
	if tes3ui.menuMode() then
		return
	end
	if e.activator ~= tes3.player then
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	local displayTableName, isStatic = common.getDisplayTable(e.target)
	if not displayTableName then -- Has to be on the Display Table list
		return
	end
	if isStatic then
		return
	end
	local displayTable = e.target
	if displayTable.data.crafted then
		return
	end
	this.set(displayTable, displayTableName, shopManager)
	return false
end
event.register("activate", setWorldDisplayTable, { priority = 551 })

--- Shift activate to set as Display Table.
local function setWorldStaticDisplayTable(e)
	if not tes3.worldController.inputController:isShiftDown() then
		return
	end
	if not e.reference then
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	local displayTableName, isStatic = common.getDisplayTable(e.reference)
	if not displayTableName then -- Has to be on the Display Table list
		return
	end
	if not isStatic then
		return
	end
	local displayTable = e.reference
	if displayTable.data.crafted then
		return
	end
	this.set(displayTable, displayTableName, shopManager)
end
event.register("CraftingFramework:StaticActivation", setWorldStaticDisplayTable)

return this
