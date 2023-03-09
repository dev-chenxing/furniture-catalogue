local customer = {}

local npcConfig = require("retail.staticConfig.npc")

---@param e referenceActivatedEventData
local function assignRandomOutfit(e)
	if table.find(npcConfig.npcs.randoms, e.reference.baseObject.id) then -- is a random customer
		if not e.reference.data.randomOutfitAssigned then
			for _, stack in pairs(e.reference.object.inventory) do
				tes3.removeItem({ reference = e.reference, item = stack.object, count = stack.count })
			end
			for _, stack in pairs(table.choice(npcConfig.customerOutfits)) do
				tes3.addItem({ reference = e.reference, item = stack.item, count = stack.count })
			end
			e.reference.data.randomOutfitAssigned = true
		end
	end
end
event.register("referenceActivated", assignRandomOutfit)

local bodyParts = { [tes3.partIndex.head] = {}, [tes3.partIndex.hair] = {} }

---@param e bodyPartAssignedEventData
local function assignRandomHead(e)
	if table.find(npcConfig.npcs.randoms, e.reference.baseObject.id) then -- is a random customer
		if bodyParts[e.index] and not e.object then -- is a head or hair
			if e.reference.data["bodyPart" .. e.index] then
				local bodyPart = tes3.getObject(e.reference.data["bodyPart" .. e.index]) ---@type any
				---@cast bodyPart tes3bodyPart
				e.bodyPart = bodyPart
			else
				local bodyPart = table.choice(bodyParts[e.index][e.reference.object.race.id][e.reference.object.female and 1 or 0]) ---@type any
				---@cast bodyPart tes3bodyPart
				e.bodyPart = bodyPart
				e.reference.data["bodyPart" .. e.index] = bodyPart.id
			end
		end
	end
end
event.register("bodyPartAssigned", assignRandomHead)

for race in tes3.iterate(tes3.dataHandler.nonDynamicData.races) do
	bodyParts[tes3.partIndex.head][race.id] = { [0] = {}, [1] = {} }
	bodyParts[tes3.partIndex.hair][race.id] = { [0] = {}, [1] = {} }
end

---@param bodyPart tes3bodyPart
for bodyPart in tes3.iterateObjects(tes3.objectType.bodyPart) do
	if bodyPart.partType == tes3.activeBodyPartLayer.base then
		if bodyParts[bodyPart.part] then -- Head and hair
			if (bodyPart.sourceMod == "Morrowind.esm") or (bodyPart.sourceMod == "OAAB_Data.esm") or
			(bodyPart.sourceMod == "Tamriel_Data.esm") then
				if bodyPart.vampiric then
					return
				end
				table.insert(bodyParts[bodyPart.part][bodyPart.raceName][bodyPart.female and 1 or 0], bodyPart)
			end
		end
	end
end

---@return string
local function pickCustomer(frontDoor)
	if not frontDoor.data.customers or table.empty(frontDoor.data.customers) then
		local customersNum = math.random(6, 9)
		local customers = {}
		customers.uniques = 1
		customers.randoms = customersNum - customers.uniques
		for type, num in pairs(customers) do
			for i = 1, num do
				while true do
					local picked = table.choice(npcConfig.npcs[type])
					if not table.find(frontDoor.data.customers[type], picked) then
						table.insert(frontDoor.data.customers[type], picked)
						break
					end
				end

			end
		end
	end
	local customerId = table.choice(frontDoor.data.customers)
	table.removevalue(frontDoor.data.customers, customerId)
	return customerId
end

---@param vector3 tes3vector3
---@return tes3vector3
local function rotatePiAlongZ(vector3)
	local rotationMatrix = tes3matrix33.new(-1, 0, 0, 0, -1, 0, 0, 0, 1)
	return rotationMatrix * vector3
end

local function spawnCustomer(frontDoor)
	local orientation = rotatePiAlongZ(frontDoor.data.spawnPoint.orientation)
	tes3.createReference({
		object = pickCustomer(frontDoor),
		cell = frontDoor.cell,
		position = frontDoor.data.spawnPoint.position,
		orientation = orientation,
	})
	timer.start({
		type = timer.simulate,
		duration = 5,
		callback = function()
			spawnCustomer(frontDoor)
		end,
	})
end

function customer.spawnTimerStart(frontDoor)
	timer.start({
		type = timer.simulate,
		duration = 5,
		callback = function()
			spawnCustomer(frontDoor)
		end,
	})
end

return customer
