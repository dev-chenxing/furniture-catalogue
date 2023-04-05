local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local interop = {
	registerCatalogue = function(data)
		local id = data.id
		local catalogueData = data.data
		furnConfig.catalogue[id:lower()] = catalogueData
	end,
	registerFurniture = function(data)
		table.insert(furnConfig.furniture,
		             { id = data.id, name = data.name, category = data.category, cost = data.cost, tier = data.tier })
	end,
}

return interop
