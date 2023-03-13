local common = require("retail.common")
local log = common.createLogger("customer")
local npcConfig = require("retail.staticConfig.npc")

local greetings = {
	{ khajiit = "May this one help you?", generic = "May I help you?" },
	{ generic = "Hello, Welcome to %s", variable = "shopName" },
	{ generic = "Welcome to %s, friend!", variable = "shopName" },
	{ generic = "Welcome to %s.", variable = "shopName" },
	{ khajiit = "How can this one help you?", generic = "How can I help you?" },
	{ khajiit = "How can this one help you?", generic = "How may I help you?" },
	{ generic = "Greetings. Is everything alright?" },
	{ generic = "Buy something or get out of here.", rude = true },
	{ khajiit = "Warmest welcome to you.", generic = "Welcome, what would you like?" },
	{ generic = "Greetings to you." },
	{ generic = "Greetings to you. What would you like?" },
	{ generic = "I do not conduct business with someone like you.", rude = true },
	{ khajiit = "What can Khajiit do for you?", generic = "What can I do for you?" },
	{ khajiit = "What can Khajiit do for you?", generic = "What may I do for you?" },
	{ khajiit = "A pleasure. What can Khajiit do for you?", generic = "A pleasure. What may I do for you?" },
	{ khajiit = "What can Khajiit do for you?", generic = "If I can be of any assistance, I'll be happy to help." },
	{ generic = "Who let you in here?", rude = true },
	{ generic = "Yes, what is it?" },
	{ generic = "What is it?" },
	{ generic = "Welcome, sera." },
	{ generic = "Welcome!" },
	{ generic = "Good day, sera." },
	{ khajiit = "Warmly greeted. Welcome.", generic = "Greetings, Muthsera." },
	{ khajiit = "Warm day to you.", generic = "Greetings." },
	{ generic = "Greetings!" },
	{ generic = "Greetings, greetings!" },
	{ khajiit = "Warm greetings.", generic = "Greetings." },
	{ generic = "Yes?" },
	{ generic = "Whatever it is, not interested.", rude = true },
	{ generic = "Speak quickly.", rude = true },
	{ generic = "Anytime. I'm right here." },
	{ khajiit = "Can this one help you out?", generic = "Can I help you out?" },
	{ khajiit = "Anthing this one can do for you?", generic = "Anthing I can do for you?" },
	{ generic = "If you want something, now's the time to talk.", rude = true },
	{ generic = "So what do you want?", rude = true },
	{ generic = "Good %s.", variable = "hour" },
	{ khajiit = "You talk too much.", generic = "I don't think so.", rude = true },
	{ generic = "At your service." },
	{ generic = "And what is your business here?" },
	{ khajiit = "Ask and Khajiit will listen.", generic = "Ask and I will listen." },
	{ khajiit = "What can this one get you?", generic = "What can I get you?" },
	{ generic = "Interested in purchasing anything?" },
	{ generic = "Welcome, welcome." },
	{ khajiit = "Khajiit has wares if you have coins.", generic = "Are you interested in purchasing my goods?" },
	{ generic = "See something you like?" },
	{ generic = "Are you interested in purchasing something?" },
	{ khajiit = "Khajiit's wares are the finest in town.", generic = "My goods are the finest in town." },
	{ khajiit = "How can this one be of service?", generic = "How may I be of service?" },
	{ dunmer = "Three blessings to you", generic = "Greetings!" },
	{ generic = "A warm welcome to you." },
	{ khajiit = "Is there something Khajiit can do for you?", generic = "Is there something I can do for you" },
	{
		khajiit = "Why must the poor ones always come to this one?",
		generic = "Why must the poor ones always come to me?",
		rude = true,
	},
	{ khajiit = "Greetings. This one is at your service.", generic = "Greetings. I am at your service." },
	{ generic = "Tidings." },
	{ khajiit = "Would you have need of Khajiit's services?", generic = "Would you have need of my services?" },
	{ generic = "Do you wish to do business?" },
	{ khajiit = "This one is at your service.", generic = "I am blessed to be at your service." },
	{
		khajiit = "Khajiit has special prices just for you today.",
		generic = "Welcome. I've special prices just for you today.",
	},
	{ generic = "How about %s?", variable = "good" },
	{ khajiit = "Do you require this one's services?", generic = "Do you require my services?" },
	{ khajiit = "What can Khajiit sell you today?", generic = "What can I sell you today?" },
	{ khajiit = "Do you seek this one's services?", generic = "Do you seek my services?" },
	{ khajiit = "Khajiit's prices are the best!", generic = "My prices are the best!" },
	{ khajiit = "Feel free to peruse the goods.", generic = "Feel free to peruse my goods." },
	{ khajiit = "Khajiit has wares if you have coins.", generic = "May I interest you in something?" },
	{ khajiit = "How can this one be of service to you?", generic = "How can I be of service to you?" },
	{ generic = "Let's do some business, shall we?" },
	{ generic = "Looking for something in particular?" },
	{ khajiit = "Perhaps this one can be of assistance?", generic = "Perhaps I can be of assistance?" },
	{ generic = "Shopping for %s?", variable = "goods" },
	{ khajiit = "Khajiit's prices are reasonable.", generic = "My prices are reasonable." },
	{ generic = "Speak your needs." },
	{ generic = "You've come to the right place!" },
	{ generic = "Reasonable prices for top quality goods." },
	{ generic = "Good day. Let's do business." },
	{ khajiit = "Khajiit's prices are the best in town.", generic = "My prices are the best in town." },
	{ khajiit = "Can this one be of service to you?", generic = "Can I be of service to you?" },
}

---@param shopManager tes3reference
---@return string message
---@return boolean rude
local function randomGreeting(shopManager)
	local greeting = table.choice(greetings)
	local message
	if greeting.khajiit and tes3.player.object.race and (tes3.player.object.race.id == "Khajiit") then
		message = greeting.khajiit
	elseif greeting.dunmer and tes3.player.object.race and (tes3.player.object.race.id == "Dark Elf") then
		message = greeting.dunmer
	else
		message = greeting.generic
	end
	if greeting.variable then
		if greeting.variable == "shopName" then
			message = string.format(message, shopManager.data.shopName or shopManager.data.cellId)
		elseif greeting.variable == "hour" then
			local gameHour = tes3.worldController.hour.value
			if (gameHour > 16) and (gameHour < 7) then
				message = string.format(message, "evening")
			elseif (gameHour > 12) and (gameHour <= 16) then
				message = string.format(message, "afternoon")
			elseif (gameHour >= 7) and (gameHour <= 12) then
				message = string.format(message, "morning")
			else
				message = string.format(message, "day")
			end
		elseif greeting.variable == "good" then
			local notForSale = shopManager.data.notForSale
			if not notForSale[tes3.objectType.alchemy] then
				message = string.format(message, "a potion")
			elseif not notForSale[tes3.objectType.weapon] then
				message = string.format(message, "a sword")
			elseif not notForSale[tes3.objectType.clothing] then
				message = string.format(message, "a ring")
			else
				message = string.format(message, "this")
			end
		elseif greeting.variable == "goods" then
			local notForSale = shopManager.data.notForSale
			if not notForSale[tes3.objectType.alchemy] then
				message = string.format(message, "potions")
			elseif not notForSale[tes3.objectType.weapon] then
				message = string.format(message, "weapons")
			elseif not notForSale[tes3.objectType.clothing] then
				message = string.format(message, "enchantments")
			else
				message = string.format(message, "goods")
			end
		end
	end
	return message, greeting.rude
end

---@param npc tes3reference
---@return boolean
local function isRandomCustomer(npc)
	if table.find(npcConfig.npcs.randoms, npc.baseObject.id) then
		return true
	end
	return false
end

local buttonList = {
	{
		text = function(customer, shopManager)
			local message, rude = randomGreeting(shopManager)
			shopManager.data.currentGreetingRude = rude
			return message
		end,
		callback = function(customer, shopManager)
			if shopManager.data.currentGreetingRude then
				tes3.messageBox("Rude!")
			else
				tes3.messageBox("Nice!")
			end
		end,
	},
	{
		text = "Basic Sale",
		showRequirements = function()
			return tes3.mobilePlayer.mercantile.current >= 25
		end,
		callback = function(customer, shopManager)
			if math.random(100) < 50 then
				tes3.messageBox("Basic Sale success!")
			else
				tes3.messageBox("Basic Sale fail!")
			end
		end,
	},
}

--- @class RetailCustomerEventData
--- @field customer tes3reference The reference of the Front Door
--- @field shopManager tes3reference The reference of the ShopManager
--- @param e RetailCustomerEventData
local function showCustomerCommandsMenu(e)
	local buttons = {}
	for _, buttonData in pairs(buttonList) do
		table.insert(buttons, {
			text = function()
				if type(buttonData.text) == "string" then
					return buttonData.text
				elseif type(buttonData.text) == "function" then
					return buttonData.text(e.customer, e.shopManager)
				end
			end,
			enableRequirements = function()
				return (buttonData.enableRequirements == nil or buttonData.enableRequirements(e.customer, e.shopManager))
			end,
			tooltipDisabled = buttonData.tooltipDisabled,
			showRequirements = function()
				return (buttonData.showRequirements == nil or buttonData.showRequirements(e.customer, e.shopManager))
			end,
			callback = function()
				buttonData.callback(e.customer, e.shopManager)
			end,
		})
	end
	tes3ui.showMessageMenu({ message = "Customer", buttons = buttons, cancels = true, cancelText = "Never mind." })
	if not tes3.player.data.retail.tutorialFinished then
		e.shopManager.data.customerCommandsShownOnce = true
	end
end
event.register("Retail:Customer", showCustomerCommandsMenu)

---@param e activateEventData
local function talkToCustomer(e)
	if not isRandomCustomer(e.target) then
		return
	end
	if e.activator ~= tes3.player then
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	if shopManager.cell.id ~= shopManager.data.cellId then
		return
	end
	if tes3ui.menuMode() then
		return
	end
	local customer = e.target
	timer.delayOneFrame(function()
		event.trigger("Retail:Customer", { customer = customer, shopManager = shopManager })
	end)
	return false
end
event.register("activate", talkToCustomer, { priority = 541 })

---@param e referenceActivatedEventData
local function assignRandomOutfit(e)
	if not isRandomCustomer(e.reference) then
		return
	end
	if e.reference.data.randomOutfitAssigned then
		return
	end
	for _, stack in pairs(e.reference.object.inventory) do
		tes3.removeItem({ reference = e.reference, item = stack.object, count = stack.count })
	end
	for _, stack in pairs(table.choice(npcConfig.customerOutfits)) do
		if (not e.reference.object.female) and (stack.item.objectType == tes3.objectType.clothing) and
		(stack.item.slot == tes3.clothingSlot.skirt) then
			tes3.addItem({ reference = e.reference, item = "common_pants_02", count = 1 })
		else
			tes3.addItem({ reference = e.reference, item = stack.item, count = stack.count })
		end
	end
	e.reference.data.randomOutfitAssigned = true
end
event.register("referenceActivated", assignRandomOutfit)

local bodyParts = { [tes3.partIndex.head] = {}, [tes3.partIndex.hair] = {} }

---@param e bodyPartAssignedEventData
local function assignRandomHead(e)
	if isRandomCustomer(e.reference) then
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

local customer = {}

function customer.bodyPartIter()
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
end

---@return string
local function pickCustomer(frontDoor)
	frontDoor.data.customers = frontDoor.data.customers or {}
	if table.empty(frontDoor.data.customers) then
		local customersNum = math.random(6, 9)
		local customers = {}
		customers.uniques = 1
		customers.randoms = customersNum - customers.uniques
		for type, num in pairs(customers) do
			for i = 1, num do
				while true do
					local picked = table.choice(npcConfig.npcs[type]) ---@type string
					if not table.find(frontDoor.data.customers, picked) then
						table.insert(frontDoor.data.customers, picked)
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

---@param frontDoor tes3reference
local function spawnCustomer(frontDoor)
	local customerId = pickCustomer(frontDoor)
	local customerObj = tes3.getObject(customerId) ---@type any
	---@cast customerObj tes3npc|tes3creature|nil
	if customerObj then
		tes3.createReference({
			object = customerObj,
			cell = frontDoor.cell,
			position = frontDoor.data.spawnPoint.position,
			orientation = frontDoor.data.spawnPoint.orientation,
		})
	else
		log:debug("Customer %s not found", customerId)
	end
	timer.start({
		type = timer.simulate,
		duration = 10,
		callback = function()
			spawnCustomer(frontDoor)
		end,
	})
end

---@param frontDoor tes3reference
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
