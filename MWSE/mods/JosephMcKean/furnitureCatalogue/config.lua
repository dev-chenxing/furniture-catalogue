local configPath = "Furniture Catalogue"
local defaultConfig = {
	logLevel = "INFO",
	devInstantDelivery = false,
	deliveryTime = 1,
	furnitureMerchants = { ["arrille"] = true },
}

return mwse.loadConfig(configPath, defaultConfig)
