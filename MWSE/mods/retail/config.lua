local configPath = "Retail"
local defaultConfig = { logLevel = "INFO", devInstantDelivery = false }

return mwse.loadConfig(configPath, defaultConfig)
