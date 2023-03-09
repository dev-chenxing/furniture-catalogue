local configPath = "Retail"
local defaultConfig = {}

defaultConfig.logLevel = "INFO"

return mwse.loadConfig(configPath, defaultConfig)
