local common = require("retail.common")
local log = common.createLogger("wares")
local currentRef = nil

local objectType = {
	["alchemy"] = { name = "Alchemy", value = 1212369985 },
	["ammunition"] = { name = "Ammunition", value = 1330466113 },
	["apparatus"] = { name = "Apparatus", value = 1095782465 },
	["armor"] = { name = "Armor", value = 1330467393 },
	["book"] = { name = "Book", value = 1263488834 },
	["clothing"] = { name = "Clothing", value = 1414483011 },
	["ingredient"] = { name = "Ingredient", value = 1380404809 },
	["light"] = { name = "Light", value = 1212631372 },
	["lockpick"] = { name = "Lockpick", value = 1262702412 },
	["miscItem"] = { name = "Misc Item", value = 1129531725 },
	["probe"] = { name = "Probe", value = 1112494672 },
	["repairItem"] = { name = "Repair Item", value = 1095779666 },
	["weapon"] = { name = "Weapon", value = 1346454871 },
}

---@param shopManager tes3reference
---@param type string
local function typeSelect(shopManager, type)
	if type == "all" then
		for _, data in pairs(objectType) do
			shopManager.data.notForSale[data.value] = false
		end
	elseif objectType[type] then
		shopManager.data.notForSale[objectType[type].value] = not shopManager.data.notForSale[objectType[type].value]
	elseif type == "none" then
		for _, data in pairs(objectType) do
			shopManager.data.notForSale[data.value] = true
		end
	end
	timer.delayOneFrame(function()
		event.trigger("Retail:EditBarterType", { shopManager = shopManager })
	end)
end

--- @class RetailEditBarterTypeEventData
--- @field shopManager tes3reference The reference of the Shop Manager
--- @param e RetailEditBarterTypeEventData
local function editBarterType(e)
	local prefix = "> "
	local currentAll = true
	local currentNone = true
	for _, data in pairs(objectType) do
		if e.shopManager.data.notForSale[data.value] then
			currentAll = false
		else
			currentNone = false
		end
	end
	local buttons = {
		{
			text = (currentAll and prefix or "") .. "All",
			callback = function()
				typeSelect(e.shopManager, "all")
			end,
		},
	}
	for id, data in pairs(objectType) do
		table.insert(buttons, {
			text = (not e.shopManager.data.notForSale[data.value] and prefix or "") .. data.name,
			callback = function()
				typeSelect(e.shopManager, id)
			end,
		})
	end
	table.insert(buttons, {
		text = (currentNone and prefix or "") .. "None",
		callback = function()
			typeSelect(e.shopManager, "none")
		end,
	})
	tes3ui.showMessageMenu({
		header = "Edit Barter Type",
		message = "Edit the type of items your shop sells\n\nLegend:\n\n\'>\' - Currently Selected value",
		buttons = buttons,
		cancels = true,
	})
end
event.register("Retail:EditBarterType", editBarterType)

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
	droppedRef.data.isWare = true
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
