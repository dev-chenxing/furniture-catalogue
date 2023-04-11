local ashfall = include("mer.ashfall.interop")
local CraftingFramework = require("CraftingFramework")
local Craftable = require("CraftingFramework.components.Craftable")
local MenuActivator = require("CraftingFramework.components.MenuActivator")

local catalogue = require("JosephMcKean.furnitureCatalogue.catalogue")
local common = require("JosephMcKean.furnitureCatalogue.common")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("recipes")

---@param furniture furnitureCatalogue.furniture
---@return string id
local function recipeId(furniture)
	return "FurnitureCatalogue:" .. furniture.id
end

---@param index string
---@param furniture furnitureCatalogue.furniture
---@return string id
local function craftableId(index, furniture)
	local furnitureObj = tes3.getObject(furniture.id)
	local id = "jsmk_fc_crate_" .. index
	-- Generate the craftable if one doesn't exist
	local craftable = tes3.getObject(id)
	if not craftable then
		local icon = "jsmk\\fc\\crate.dds"
		log:debug("Craftable %s for placedObject %s does not exist, creating a misc", id, furniture.id)
		craftable = tes3.createObject({
			id = id,
			objectType = tes3.objectType.miscItem,
			name = furniture.name,
			icon = icon,
			mesh = furnitureObj.mesh,
			value = 0,
			weight = furniture.weight,
		})
	end
	return id
end

---@param furniture furnitureCatalogue.furniture
---@param craftable CraftingFramework.Craftable
---@param reference tes3reference
---@param destroy boolean 
local function refund(furniture, craftable, reference, destroy)
	craftable:recoverItemsFromContainer(reference)
	if not destroy then
		craftable:playCraftingSound()
		local refundMessage = string.format("%s has been refunded.", furniture.name)
		local recoverMessage = string.format("%s gold has been added to your inventory.", furniture.cost)
		refundMessage = refundMessage .. "\n" .. recoverMessage
		tes3.messageBox(refundMessage)
	else
		local destroyMessage = string.format("%s has been destroyed.", furniture.name)
		tes3.messageBox(destroyMessage)
	end

	reference.sceneNode.appCulled = true
	tes3.positionCell({ reference = reference, position = { 0, 0, 0 } })
	reference:disable()
	if craftable.destroyCallback then
		craftable:destroyCallback({ reference = reference })
	end
	timer.delayOneFrame(function()
		reference:delete()
	end)
end

---@param index string
---@param furniture furnitureCatalogue.furniture
---@param type furnitureCatalogue.type
local function additionalMenuOptions(index, furniture, type)
	local destroy = (type == "catalogueII")
	local refundText = destroy and "Destroy" or "Refund"
	local buttons = {
		{
			text = refundText,
			showRequirements = function(e)
				return e.reference.data.crafted
			end,
			callback = function(e)
				tes3ui.showMessageMenu({
					message = string.format("%s %s?", refundText, furniture.name),
					buttons = {
						{
							text = "Yes",
							callback = function()
								local craftable = Craftable.getCraftable(craftableId(index, furniture))
								refund(furniture, craftable, e.reference, destroy)
							end,
						},
					},
					cancels = true,
				})
			end,
		},
	}
	-- Only register beds if Ashfall is installed
	if furniture.category == "Beds" then
		if ashfall then
			table.insert(buttons, include("mer.ashfall.items.bedroll").buttons.sleep)
		else
			return
		end
	end
	return buttons
end

---@param furniture furnitureCatalogue.furniture
---@param type string
---@return number
local function goldCount(furniture, type)
	if type == "merchants" then
		return furniture.cost
	elseif type == "catalogueI" then
		local shippingCost = 60
		return furniture.cost + shippingCost
	else
		return 0
	end
end

---@param ref tes3reference
local function getNewStock(ref)
	ref.data.furnitureCatalogue.todayStock = {}
	local picked = {}
	local stockAmount = 50
	for i = 1, stockAmount do
		picked[math.random(1, table.size(furnConfig.furniture))] = true
	end
	local j = 1
	local isAshlander = common.isAshlander(ref)
	for index, furniture in pairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			if isAshlander then
				if furniture.ashlandersAvailable or furniture.ashlandersOnly then
					log:debug("%s is %s, adding to todayStock", furniture.id,
					          (furniture.ashlandersAvailable and "ashlandersAvailable") or (furniture.ashlandersOnly and "ashlandersOnly") or "not available")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			else
				if not furniture.ashlandersOnly then
					log:debug("%s is %s, adding to todayStock", furniture.id, (furniture.ashlandersOnly and "ashlandersOnly") or "not ashlandersOnly")
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
				catalogue.currentActivator.data.furnitureCatalogue = catalogue.currentActivator.data.furnitureCatalogue or {}
				if catalogue.currentActivator.data.furnitureCatalogue.today ~= today then
					getNewStock(catalogue.currentActivator)
					catalogue.currentActivator.data.furnitureCatalogue.today = today
				end
				if catalogue.currentActivator.data.furnitureCatalogue.todayStock[furniture.id] then
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
local soundType = "spendMoney" ---@cast soundType CraftingFramework.Craftable.SoundType

---@param self CraftingFramework.Craftable
---@param e CraftingFramework.Craftable.SuccessMessageCallback.params
local function successMessageCallback(self, e)
	return string.format("%s has been added to your inventory.", self.name)
end

---@param recipes CraftingFramework.Recipe.data[]
---@param index string
---@param furniture furnitureCatalogue.furniture
---@param type string
local function addRecipe(recipes, index, furniture, type)
	local furnitureObj = tes3.getObject(furniture.id)
	if not furnitureObj then
		return
	end

	-- Only register beds if Ashfall is installed
	if furniture.category == "Beds" then
		if not ashfall then
			return
		end
	end

	---@type CraftingFramework.Recipe
	local recipe = {
		id = recipeId(furniture),
		craftableId = craftableId(index, furniture),
		placedObject = furniture.id,
		additionalMenuOptions = additionalMenuOptions(index, furniture, type),
		description = furniture.description,
		materials = { { material = "gold_001", count = goldCount(furniture, type) } },
		customRequirements = { customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
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
	local recipesMerchants = {} ---@type CraftingFramework.Recipe.data[]
	local recipesCatalogueI = {} ---@type CraftingFramework.Recipe.data[]
	local recipesCatalogueII = {} ---@type CraftingFramework.Recipe.data[]
	---@param index string 
	---@param furniture furnitureCatalogue.furniture
	for index, furniture in pairs(furnConfig.furniture) do
		addRecipe(recipesMerchants, index, furniture, "merchants")
		addRecipe(recipesCatalogueI, index, furniture, "catalogueI")
		addRecipe(recipesCatalogueII, index, furniture, "catalogueII")
	end
	MenuActivator:new({
		name = "Furniture Catalogue",
		id = "FurnitureCatalogueMerchants",
		type = "event",
		recipes = recipesMerchants,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Purchase",
		materialsHeaderText = "Cost",
	})
	MenuActivator:new({
		name = "Furniture Catalogue",
		id = "FurnitureCatalogueI",
		type = "event",
		recipes = recipesCatalogueI,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Purchase",
		materialsHeaderText = "Cost plus Shipping Fee 60 gold",
	})
	MenuActivator:new({
		name = "Furniture Catalogue",
		id = "FurnitureCatalogueII",
		type = "event",
		recipes = recipesCatalogueII,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Add to Cart",
		materialsHeaderText = "Free Furniture Catalogue",
	})
end
