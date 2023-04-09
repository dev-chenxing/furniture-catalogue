local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")

local log = common.createLogger("mcm")

local function registerModConfig()
	local template = mwse.mcm.createTemplate({ name = common.mod })
	template:saveOnClose(common.mod, config)
	local settings = template:createSideBarPage({ label = "Settings" })
	settings:createOnOffButton({
		label = "Debug mode",
		variable = mwse.mcm.createTableVariable { id = "debugMode", table = config },
		callback = function(self)
			log:setLogLevel(self.variable.value and "DEBUG" or "INFO")
		end,
	})
	template:register()
end

event.register("modConfigReady", registerModConfig)
