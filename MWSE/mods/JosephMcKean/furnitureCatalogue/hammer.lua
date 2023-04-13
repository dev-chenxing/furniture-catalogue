--- not working yet

local common = require("JosephMcKean.furnitureCatalogue.common")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("hammer")

local hammerId = "AB_w_ToolHammer"

---@return tes3reference? furnitureRef
local function isLookingAtFurniture()
	local rayResult = tes3.rayTest({
		position = tes3.getPlayerEyePosition(),
		direction = tes3.getPlayerEyeVector(),
		maxDistance = tes3.getPlayerActivationDistance(),
		ignore = { tes3.player },
	})
	if rayResult and rayResult.reference then
		local furnitureRef = rayResult.reference
		local furnitureId = furnitureRef.id:lower()
		log:debug("Ray testing %s...", furnitureId)
		if furnConfig.furnitureIndices[furnitureId] then
			return furnitureRef
		end
	end
end

---@param furniture tes3reference
local function replaceFurniture(furniture)
	furniture:disable()
	local newFurniture = tes3.createReference {
		object = furniture.id,
		position = { furniture.position.x, furniture.position.y, furniture.position.z },
		orientation = { furniture.orientation.x, furniture.orientation.y, furniture.orientation.z },
		cell = furniture.cell,
	}
	newFurniture.scale = furniture.scale
	newFurniture.data.crafted = true
	tes3.playSound({ reference = tes3.player, sound = "Door Latched Two Close" }) -- It sounds kinda like hammering wood
end

---@param e attackEventData
local function replaceFurnitureOnAttack(e)
	if e.mobile.reference ~= tes3.player then
		return
	end
	local weapon = tes3.player.mobile.readiedWeapon
	if not weapon then
		return
	end
	if weapon.object.id ~= hammerId then
		return
	end
	if tes3.mobilePlayer.inCombat then
		return --- No home decorating in combat
	end
	local ref = isLookingAtFurniture()
	if not ref then
		log:debug("Not furniture")
		return
	end
	if ref.data.crafted then
		return
	end
	timer.start({
		type = timer.simulate,
		duration = 0.5,
		callback = function()
			replaceFurniture(ref)
		end,
	})
	return false
end
event.register("attack", replaceFurnitureOnAttack, { priority = -10 })
