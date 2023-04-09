local ashfall = include("mer.ashfall.interop")
local CraftingFramework = require("CraftingFramework")
local MenuActivator = include("CraftingFramework.components.MenuActivator")

local catalogue = require("JosephMcKean.furnitureCatalogue.catalogue")
local common = require("JosephMcKean.furnitureCatalogue.common")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("recipes")

local currentActivator = catalogue.currentActivator

---@param ref tes3reference
local function getNewStock(ref)
	ref.data.furnitureCatalogue.todayStock = {}
	local picked = {}
	local stockAmount = 50
	for i = 1, stockAmount do
		picked[math.random(1, table.size(furnConfig.furniture))] = true
	end
	local j = 1
	for index, furniture in pairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			if common.isAshlander(ref) then
				log:debug("%s is an Ashlander, %s is %s", ref.id, furniture.id,
				          (furniture.ashlandersAvailable and "ashlandersAvailable") or (furniture.ashlandersOnly and "ashlandersOnly") or "not available")
				if furniture.ashlandersAvailable or furniture.ashlandersOnly then
					log:debug("adding to todayStock")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			else
				log:debug("%s is not an Ashlander, %s is %s", ref.id, furniture.id, (furniture.ashlandersOnly and "ashlandersOnly") or "not ashlandersOnly")
				if not furniture.ashlandersOnly then
					log:debug("adding to todayStock")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			end
		end
		j = j + 1
	end
end

local customRequirements = {
	---@param furniture furnitureCatalogue.furniture
	inStock = function(furniture)
		return {
			getLabel = function()
				return "In-Stock"
			end,
			check = function()
				local today = tes3.findGlobal("DaysPassed").value
				currentActivator.data.furnitureCatalogue = currentActivator.data.furnitureCatalogue or {}
				if currentActivator.data.furnitureCatalogue.today ~= today then
					getNewStock(currentActivator)
					currentActivator.data.furnitureCatalogue.today = today
				end
				if currentActivator.data.furnitureCatalogue.todayStock[furniture.id] then
					return true
				else
					return false, string.format("Unfortunately, this product is out of stock.")
				end
			end,
		}
	end,
}

CraftingFramework.SoundType.register {
	id = "spendMoney",
	soundPaths = {
		"jsmk\\fc\\spendMoneyCoin1.wav",
		"jsmk\\fc\\spendMoneyCoin2.wav",
		"jsmk\\fc\\spendMoneyCoin3.wav",
		"jsmk\\fc\\spendMoneyCoin4.wav",
		"jsmk\\fc\\spendMoneyCoinBag1.wav",
	},
}

---@param self CraftingFramework.Craftable
---@param e CraftingFramework.Craftable.SuccessMessageCallback.params
local function successMessageCallback(self, e)
	return string.format("%s has been added to your inventory.", self.name)
end

---@param recipes CraftingFramework.Recipe.data[]
---@param index string
---@param furniture furnitureCatalogue.furniture
local function addRecipe(recipes, index, furniture)
	local furnitureObj = tes3.getObject(furniture.id)
	if not furnitureObj then
		return
	end

	local craftableId = "jsmk_fc_crate_" .. index
	-- Generate the craftable if one doesn't exist
	local craftable = tes3.getObject(craftableId)
	if not craftable then
		local icon = "jsmk\\fc\\crate.dds"
		log:debug("Craftable %s for placedObject %s does not exist, creating a misc", craftableId, furniture.id)
		craftable = tes3.createObject({
			id = craftableId,
			objectType = tes3.objectType.miscItem,
			name = furniture.name,
			icon = icon,
			mesh = furnitureObj.mesh,
			weight = furniture.weight,
		})
	end
	local soundType = "spendMoney" ---@cast soundType CraftingFramework.Craftable.SoundType

	local bedrollButtons = nil
	-- Only register beds if Ashfall is installed
	if furniture.category == "Beds" then
		if ashfall then
			bedrollButtons = { include("mer.ashfall.items.bedroll").buttons.sleep }
		else
			return
		end
	end
	---@type CraftingFramework.Recipe
	local recipe = {
		id = "FurnitureCatalogue:" .. furniture.id,
		craftableId = craftableId,
		placedObject = furniture.id,
		description = furniture.description,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = { customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundType = soundType,
		scale = furniture.scale,
		previewMesh = furnitureObj.mesh,
		previewScale = furniture.previewScale,
		previewHeight = furniture.previewHeight,
		successMessageCallback = successMessageCallback,
	}
	table.insert(recipes, recipe)
end

do
	if not MenuActivator then
		return
	end
	local recipes = {} ---@type CraftingFramework.Recipe.data[]
	---@param index string 
	---@param furniture furnitureCatalogue.furniture
	for index, furniture in pairs(furnConfig.furniture) do
		addRecipe(recipes, index, furniture)
	end
	MenuActivator:new({
		name = "Furniture Catalogue",
		id = "FurnitureCatalogue",
		type = "event",
		recipes = recipes,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Purchase",
		materialsHeaderText = "Cost",
	})
end
