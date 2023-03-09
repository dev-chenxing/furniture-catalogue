local common = require("retail.common")
local config = require("retail.config")

local modConfig = {}
function modConfig.onCreate(parent)
	local pane = parent:createThinBorder{}
	pane.flowDirection = "top_to_bottom"
	pane.layoutHeightFraction = 1.0
	pane.layoutWidthFraction = 1.0
	pane.paddingAllSides = 12
	local header = pane:createLabel({ text = common.mod })
	header.color = tes3ui.getPalette("header_color")
	header.borderAllSides = 12
	local logLevelDropdown = mwse.mcm.createDropdown(pane, {
		class = "Dropdown",
		label = "Log Level",
		options = { { label = "DEBUG", value = "DEBUG" }, { label = "INFO", value = "INFO" } },
		variable = mwse.mcm.createTableVariable({ class = "TableVariable", id = "logLevel", table = config }),
		callback = function(self)
			for _, log in ipairs(common.loggers) do
				mwse.log("Setting %s to log level %s", log.name, self.variable.value)
				log:setLogLevel(self.variable.value)
			end
		end,
	})
	logLevelDropdown.elements.border.widthProportional = 0.3
end
function modConfig.onClose()
	mwse.saveConfig(common.mod, config)
end

event.register("modConfigReady", function()
	mwse.registerModConfig(common.mod, modConfig)
end)
