local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("deliveryCrate")

--- When activating a crate, Craft the furniture
---@param e activateEventData
local function activateDeliveryCrate(e)
	if not (e.activator == tes3.player) then
		return
	end
	if tes3.menuMode() then
		return
	end
	if not common.isDeliveryCrate(e.target.object) then
		return
	end
	local crate = e.target
	crate:disable()
	crate:delete()
	-- crate.itemData.data.furn.Craftable:Craft()
	tes3.messageBox("Unboxing.")
	return false
end
event.register("activate", activateDeliveryCrate)
