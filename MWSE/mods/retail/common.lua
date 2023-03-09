local common = {}
common.mod = "Retail"
local furnConfig = require("retail.staticConfig.furniture")

local config = require("retail.config")
local logging = require("logging.logger")
---@type mwseLogger
common.log = logging.new({ name = "common", logLevel = config.logLevel })
common.loggers = { common.log }
-- create loggers for services of this mod 
common.createLogger = function(serviceName)
	local logger = logging.new { name = string.format("Retail - %s", serviceName), logLevel = config.logLevel }
	table.insert(common.loggers, logger)
	return logger -- return a table of logger
end

--- If the mesh of the reference is on the displayTables config, return the name of the display table, otherwise return nil.
---@param ref tes3reference
---@return string?, boolean?
function common.getDisplayTable(ref)
	local displayTable = furnConfig.displayTables[ref.object.mesh and ref.object.mesh:lower()]
	if displayTable then
		return displayTable.name, displayTable.isStatic
	end
	return nil, nil
end

--- Returns the shop manager. Must be unique.
---@return tes3reference?
function common.getShopManager()
	local shopManager
	local hasDisplayTable = false
	local hasValidDisplayTable = false
	for ref in tes3.player.cell:iterateReferences() do
		if common.getDisplayTable(ref) then -- check if the cell has any valid Display Table
			hasValidDisplayTable = true
			if not hasDisplayTable and ref.data.isDisplayTable then -- check if the cell has any Display Table
				hasDisplayTable = true
			end
		end
		if common.isShopManager(ref) then
			if ref.data.cellId == ref.cell.id then
				shopManager = ref
			end
		end
	end
	if shopManager then
		shopManager.data.hasValidDisplayTable = hasValidDisplayTable
		shopManager.data.hasDisplayTable = hasDisplayTable
	end
	return shopManager
end

function common.getStackCount(reference)
	return reference and reference.attachments and reference.attachments.variables and
	       reference.attachments.variables.count or 1
end

---@return boolean?
function common.isShopManager(ref)
	return ref and (furnConfig.shopManagers[ref.baseObject.id:lower()] ~= nil)
end

---@return boolean
function common.isValidDoor(ref)
	if not (ref and ref.object and ref.object.objectType == tes3.objectType.door) then -- Has to be a door
		return false
	end
	if tes3.getLocked({ reference = ref }) then -- Has to be unlocked
		return false
	end
	if not ref.destination then -- Has to be teleport door
		return false
	end
	return true
end

function common.pickUp(reference)
	local function stealActivateEvent(e)
		event.unregister("activate", stealActivateEvent)
		e.claim = true
	end

	local function blockSound()
		event.unregister("addSound", blockSound)
		return false
	end

	local safeRef = tes3.makeSafeObjectHandle(reference)
	timer.frame.delayOneFrame(function()
		if safeRef and safeRef:valid() then
			event.register("activate", stealActivateEvent, { priority = 1000000 })
			event.register("addSound", blockSound, { priority = 1000000 })
			tes3.player:activate(safeRef:getObject())
		end
	end)
end

return common
