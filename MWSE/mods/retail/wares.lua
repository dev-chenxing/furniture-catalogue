local common = require("retail.common")
local log = common.createLogger("wares")
local currentRef = nil

local dropText = function(droppedRef)
	return string.format("Set %s for sale", droppedRef.object.name)
end

---@param target tes3reference
---@param droppedRef tes3reference
---@return boolean
local canDrop = function(target, droppedRef)
	if not target.data.isDisplayTable then
		return false
	end
	local shopManager = common.getShopManager()
	if shopManager then
		if shopManager.data.notForSale[droppedRef.object.objectType] then
			return false
		end
	end
	return true
end

---@param target tes3reference
---@param droppedRef tes3reference
local onDrop = function(target, droppedRef)
	target.data.isWare = true
	if not tes3.player.data.retail.tutorialFinished then
		local shopManager = common.getShopManager()
		if shopManager then
			shopManager.data.hasWares = true
		end
	end
	local stackCount = common.getStackCount(droppedRef)
	if not (stackCount == 1) then
		droppedRef.attachments.variables.count = droppedRef.attachments.variables.count - 1
		common.pickUp(droppedRef)
	end
	tes3.messageBox("Set %s for sale", droppedRef.object.name)
end

---@param e itemDroppedEventData
local function itemDroppedOnDisplayTable(e)
	local target = currentRef
	if not target then
		return
	end
	local droppedRef = e.reference
	if canDrop(target, droppedRef) then
		onDrop(target, droppedRef)
	end
end
event.register("itemDropped", itemDroppedOnDisplayTable)

local function getRaytestTarget(e)
	local result = e.rayResult
	if result and result.reference then
		currentRef = result.reference
	end
end
event.register("CraftingFramework:StaticActivatorIndicator", getRaytestTarget)
