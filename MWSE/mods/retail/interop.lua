local furnConfig = require("retail.staticConfig.furniture")
local npcConfig = require("retail.staticConfig.npc")

local interop = {
	priority = require("retail.main").priority,
	registerCustomers = function(npcs)
		for type, _ in pairs(npcConfig.npcs) do
			if npcs[type] then
				for _, actor in ipairs(npcs[type]) do
					table.insert(npcConfig.npcs[type], actor)
				end
			end
		end
	end,
	registerShopManager = function(data)
		local id = data.id
		local shopManagerData = data.data
		furnConfig.shopManagers[id:lower()] = shopManagerData
	end,
	registerFurniture = function(data)
		table.insert(furnConfig.furniture,
		             { id = data.id, name = data.name, category = data.category, cost = data.cost, tier = data.tier })
	end,
	registerDisplayTable = function(data)
		furnConfig.displayTables[data.mesh] = { name = data.name, isStatic = data.isStatic }
	end,
}

return interop
