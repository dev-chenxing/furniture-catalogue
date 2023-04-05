local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")

local function registerModConfig()
	local template = mwse.mcm.createTemplate({ name = common.mod })
	template:saveOnClose(common.mod, config)
	local settings = template:createSideBarPage({ label = "Settings" })
	local devOptions = template:createSideBarPage({ label = "Developer Options" })
	devOptions:createDropdown({
		label = "Log Level",
		description = "Set the logging level for mwse.log. Keep on INFO unless you are debugging.",
		options = { { label = "DEBUG", value = "DEBUG" }, { label = "INFO", value = "INFO" } },
		variable = mwse.mcm.createTableVariable { id = "logLevel", table = config },
		callback = function(self)
			for _, log in ipairs(common.loggers) do
				log:setLogLevel(self.variable.value)
			end
		end,
	})
	devOptions:createOnOffButton{
		label = "Instant Delivery",
		description = "Furniture bought from the Shop Manager get crafted instantly, i.e. noResult flag will be false.",
		variable = mwse.mcm.createTableVariable { id = "devInstantDelivery", table = config, restartRequired = true },
	}
	template:register()
end

event.register("modConfigReady", registerModConfig)
