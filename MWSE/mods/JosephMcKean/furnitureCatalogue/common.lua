local common = {}
common.mod = "Furniture Catalogue"
local furniture = require("JosephMcKean.furnitureCatalogue.furnConfig")

local config = require("JosephMcKean.furnitureCatalogue.config")
local logging = require("logging.logger")

---@type mwseLogger
common.log = logging.new({ name = "common", logLevel = config.debugMode and "DEBUG" or "INFO" })
common.loggers = { common.log }
-- create loggers for services of this mod 
common.createLogger = function(serviceName)
	local logger =
	logging.new { name = string.format("Furniture Catalogue - %s", serviceName), logLevel = config.debugMode and "DEBUG" or "INFO" }
	table.insert(common.loggers, logger)
	return logger -- return a table of logger
end

---@param obj tes3object
---@return boolean
function common.isCatalogue(obj)
	return furniture.catalogue[obj.id:lower()] ~= nil
end

---@param obj tes3object
---@return boolean
function common.isDeliveryCrate(obj)
	return string.startswith(obj.id:lower(), "jsmk_fc_crate")
end

---@param ref tes3reference
---@return boolean
function common.isAshlander(ref)
	local faction = ref.object.faction
	if faction and faction.id == "Ashlanders" then
		return true
	end
	return false
end

return common
