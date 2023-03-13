local common = require("retail.common")
local log = common.createLogger("main")

local function onInit()
	if not tes3.isModActive("Retail.esp") then
		mwse.log("[Retail] Failed to initialize due to disabled Retail.esp.")
		return
	end
	local function checkIfInShop()
		for ref in tes3.player.cell:iterateReferences() do
			if common.isShopManager(ref) then
				tes3.player.data.retail.inShopCell = tes3.player.cell.id
			end
		end
	end

	local function initPlayerData()
		if not tes3.player.data.retail then
			local defaultPlayerData = {
				inShopCell = nil, -- nil: not in shop cell, string: shop cell id
			}
			tes3.player.data.retail = defaultPlayerData
		end
	end
	event.register("loaded", initPlayerData)
	event.register("cellChanged", checkIfInShop)
	require("retail.frontDoor")
	require("retail.customer")
	require("retail.customer").bodyPartIter()
	require("retail.shopManager")
	require("retail.displayTable")
	require("retail.purchase")
	require("retail.wares")
	require("retail.ui.tooltip")
	require("retail.tutorial")
	require("retail.interop")
end
event.register("initialized", onInit, { priority = 551 })

require("retail.mcm")
