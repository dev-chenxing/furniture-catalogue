local common = {}
common.mod = "Furniture Catalogue"
local furniture = require("JosephMcKean.furnitureCatalogue.furnConfig")

local config = require("JosephMcKean.furnitureCatalogue.config")
local logging = require("logging.logger")
---@type mwseLogger
common.log = logging.new({ name = "common", logLevel = config.logLevel })
common.loggers = { common.log }
-- create loggers for services of this mod 
common.createLogger = function(serviceName)
	local logger =
	logging.new { name = string.format("Furniture Catalogue - %s", serviceName), logLevel = config.logLevel }
	table.insert(common.loggers, logger)
	return logger -- return a table of logger
end

---@return boolean?
function common.isCatalogue(ref)
	return ref and (furniture.catalogue[ref.baseObject.id:lower()] ~= nil)
end

---@param vec1 tes3vector3
---@param vec2 tes3vector3
---@return tes3vector3
function common.rotationDifference(vec1, vec2)
	vec1 = vec1:normalized()
	vec2 = vec2:normalized()
	local axis = vec1:cross(vec2)
	local norm = axis:length()
	local ID33 = tes3matrix33.new(1, 0, 0, 0, 1, 0, 0, 0, 1)
	local difference
	if norm < 1e-5 then
		difference = ID33:toEulerXYZ()
		return difference
	end
	local angle = math.asin(norm)
	if vec1:dot(vec2) < 0 then
		angle = math.pi - angle
	end
	axis:normalize()
	local m = ID33:copy()
	m:toRotation(-angle, axis.x, axis.y, axis.z)
	difference = ID33:toEulerXYZ()
	return difference
end

local function orientRef(ref, rayResult, maxSteepness)
	local UP = tes3vector3.new(0, 0, 1)
	local newOrientation = common.rotationDifference(UP, rayResult.normal)
	newOrientation.x = math.clamp(newOrientation.x, (0 - maxSteepness), maxSteepness)
	newOrientation.y = math.clamp(newOrientation.y, (0 - maxSteepness), maxSteepness)
	newOrientation.z = ref.orientation.z
	ref.orientation = newOrientation
end

---@param ref tes3reference
---@param result niPickRecord
local function positionRef(ref, result)
	local bb = ref.object.boundingBox
	local offset = bb.min.z
	ref.position = { ref.position.x, ref.position.y, result.intersection.z - offset }
end

---@return niPickRecord|nil
function common.getGroundBelowRef(ref)
	local result = tes3.rayTest({
		position = { ref.position.x, ref.position.y, ref.position.z - ref.object.boundingBox.min.z },
		direction = { 0, 0, -1 },
		ignore = { ref, tes3.player },
		returnNormal = true,
		useBackTriangles = false,
		root = nil,
	})
	return result
end

---@param reference tes3reference
function common.orientRefToGround(reference)
	local ref = reference
	local maxSteepness = 0.4

	local result = common.getGroundBelowRef(ref)
	if not result then
		return false
	end
	orientRef(ref, result, maxSteepness)
	positionRef(ref, result)
	return true
end

return common
