local common = {}
common.mod = "Furniture Catalogue"
local furniture = require("JosephMcKean.furnitureCatalogue.furnConfig")

local config = require("JosephMcKean.furnitureCatalogue.config")
local logging = require("logging.logger")
---@type mwseLogger
common.log = logging.new({ name = "common", logLevel = config.logLevel })
common.loggers = { common.log }
-- create loggers for services of this mod 
common.createLogger = function(serviceName)
	local logger =
	logging.new { name = string.format("Furniture Catalogue - %s", serviceName), logLevel = config.logLevel }
	table.insert(common.loggers, logger)
	return logger -- return a table of logger
end

---@return boolean?
function common.isCatalogue(ref)
	return ref and (furniture.catalogue[ref.baseObject.id:lower()] ~= nil)
end

return common
