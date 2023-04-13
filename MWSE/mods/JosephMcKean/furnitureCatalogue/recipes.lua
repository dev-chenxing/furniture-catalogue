local ashfall = include("mer.ashfall.interop")
local CraftingFramework = require("CraftingFramework")
local Craftable = CraftingFramework.Craftable
local MenuActivator = CraftingFramework.MenuActivator

local catalogue = require("JosephMcKean.furnitureCatalogue.catalogue")
local common = require("JosephMcKean.furnitureCatalogue.common")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("recipes")

--- Returns the recipe id of the furniture recipe
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
		log:debug("Craftable %s for placedObject %s does not exist, creating a misc", id, furniture.id)
		craftable = tes3.createObject({
			id = id,
			objectType = tes3.objectType.miscItem,
			name = furniture.name,
			icon = "jsmk\\fc\\crate.dds",
			mesh = furnitureObj.mesh, -- the dummy misc has the same model with the furniture so it can be placed in world with correct position
			value = 0,
			weight = furniture.weight,
		})
	end
	return id
end

--- If the destroy flag is true, delete the reference. If the destroy flag is false, give player money then delete the reference.
--- Basically the same function as Craftable:destroy
---@param furniture furnitureCatalogue.furniture
---@param craftable CraftingFramework.Craftable
---@param reference tes3reference
local function refund(furniture, craftable, reference)
	craftable:recoverItemsFromContainer(reference)
	craftable:playCraftingSound() -- plays the spend money sound
	local refundMessage = string.format("%s has been refunded.", furniture.name)
	local recoverMessage = string.format("%s gold has been added to your inventory.", furniture.cost)
	refundMessage = refundMessage .. "\n" .. recoverMessage
	tes3.messageBox(refundMessage)
	-- the following code is from Merlord's CF, not sure why it's this complicated
	-- i thought disable then delete is good enough
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

local ashfallOnlyCategory = {
	["Beds"] = include("mer.ashfall.items.bedroll").buttons.sleep,
	["Water"] = {
		text = "Ashfall: Water Menu",
		callback = function(e)
			event.trigger("Ashfall:WaterMenu")
		end,
	},
}

--- Returns the additionalMenuOptions for furniture recipes
---@param index string
---@param furniture furnitureCatalogue.furniture
local function additionalMenuOptions(index, furniture)
	local buttons = {
		{
			text = "Refund",
			showRequirements = function(e)
				return e.reference.data.crafted
			end,
			callback = function(e)
				-- Ask you sure wanna destroy this? Yes, or Cancel
				local refundMessage = string.format("Refund %s?", furniture.name)
				tes3ui.showMessageMenu({
					message = refundMessage,
					buttons = {
						{
							text = "Yes",
							callback = function()
								local craftable = Craftable.getCraftable(craftableId(index, furniture))
								refund(furniture, craftable, e.reference)
							end,
						},
					},
					cancels = true,
				})
			end,
		},
	}
	-- Only register beds if Ashfall is installed
	if ashfallOnlyCategory[furniture.category] and ashfall then
		table.insert(buttons, ashfallOnlyCategory[furniture.category])
	end
	return buttons
end

--- Returns the amount of gold the furniture costs. 
--- At the time of writing, I can't change the cost after the recipes have been added.
--- So I'm registering multiple MenuActivator to change the price. 
---@param furniture furnitureCatalogue.furniture
---@param type string
---@return number
local function goldCount(furniture, type)
	--- Buying furniture from merchants directly doesn't cost you extras
	if type == "merchants" then
		return furniture.cost
		--- Buying from the standard catalogue though, you need to pay 60g shipping fee
	elseif type == "catalogueI" then
		local shippingCost = 50
		return furniture.cost + shippingCost
	else
		--- There's also the deluxe version where all furniture is free.
		return 0
	end
end

---@param ref tes3reference
local function getNewStock(ref)
	ref.data.furnitureCatalogue.todayStock = {}
	local picked = {}
	local stockAmount = 50 --- Change this if you want more furniture available each day
	--- From the list of furniture, we randomly pick 50
	for i = 1, stockAmount do
		picked[math.random(1, table.size(furnConfig.furniture))] = true
	end
	local j = 1
	local isAshlander = common.isAshlander(ref)
	--- Loop through the list of furniture again
	for index, furniture in pairs(furnConfig.furniture) do
		--- if it should always be in stock, or is one of the picked ones
		if furniture.alwaysInStock or picked[j] then
			--- if the player or the merchant selling the furniture is an Ashlander
			if isAshlander then
				--- and the furniture is available at Ashlander merchant
				if furniture.ashlandersAvailable or furniture.ashlandersOnly then
					log:debug("%s is %s, adding to todayStock", furniture.id,
					          (furniture.ashlandersAvailable and "ashlandersAvailable") or (furniture.ashlandersOnly and "ashlandersOnly") or "not available")
					--- add the furniture to today's list of available furniture
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			else
				--- if the player or the merchant is not an Ashlander though, check if the furniture can only be sold at Ashlander.
				--- if not, add the furniture to today's list of available furniture
				if not furniture.ashlandersOnly then
					log:debug("%s is %s, adding to todayStock", furniture.id, (furniture.ashlandersOnly and "ashlandersOnly") or "not ashlandersOnly")
					ref.data.furnitureCatalogue.todayStock[furniture.id] = true
				end
			end
		end
		j = j + 1
	end
end

--- Custom requirement for furniture being purchasable
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
				--- Get new stock every day
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

--- Thanks Merlord for adding this register soundType feature
CraftingFramework.SoundType.register({
	id = "spendMoney",
	soundPaths = {
		"jsmk\\fc\\spendMoneyCoin1.wav",
		"jsmk\\fc\\spendMoneyCoin2.wav",
		"jsmk\\fc\\spendMoneyCoin3.wav",
		"jsmk\\fc\\spendMoneyCoin4.wav",
		"jsmk\\fc\\spendMoneyCoinBag1.wav",
	},
})
--- I am doing this cast because the soundType parameter accepts CraftingFramework.Craftable.SoundType
--- But "spendMoney" is not one of the alias
local soundType = "spendMoney" ---@cast soundType CraftingFramework.Craftable.SoundType

---@param self CraftingFramework.Craftable
---@param e CraftingFramework.Craftable.SuccessMessageCallback.params
---@param type string
---@return string successMessage
local function successMessageCallback(self, e, type)
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
	--- The recipe for the furniture
	---@type CraftingFramework.Recipe 
	local recipe = {
		id = recipeId(furniture),
		craftableId = craftableId(index, furniture),
		placedObject = furniture.id,
		additionalMenuOptions = additionalMenuOptions(index, furniture),
		description = furniture.description,
		materials = { { material = "gold_001", count = goldCount(furniture, type) } }, --- It would be cool if the count parameter here can accept function
		knownByDefault = not furniture.notForSale, --- this is for duplicate furniture
		customRequirements = { customRequirements.inStock(furniture) },
		category = furniture.category,
		name = furniture.name,
		soundType = soundType,
		scale = furniture.scale,
		previewMesh = furnitureObj.mesh,
		successMessageCallback = function(self, e)
			return successMessageCallback(self, e, type)
		end,
	}
	table.insert(recipes, recipe)
end

--- Registering MenuActivator
do
	if not MenuActivator then
		return
	end
	local recipesMerchants = {} ---@type CraftingFramework.Recipe.data[]
	local recipesCatalogueI = {} ---@type CraftingFramework.Recipe.data[]
	local recipesCatalogueII = {} ---@type CraftingFramework.Recipe.data[]
	--- I registered thrice almost the same recipes because I need different prices for furniture
	---@param index string 
	---@param furniture furnitureCatalogue.furniture
	for index, furniture in pairs(furnConfig.furniture) do
		addRecipe(recipesMerchants, index, furniture, "merchants")
		addRecipe(recipesCatalogueI, index, furniture, "catalogueI")
		-- addRecipe(recipesCatalogueII, index, furniture, "catalogueII")
	end
	--- These MenuActivator are event type, trigger the event to openCraftingMenu
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
		name = "Furniture Catalogue: Standard",
		id = "FurnitureCatalogueI",
		type = "event",
		recipes = recipesCatalogueI,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Purchase",
		materialsHeaderText = "Cost plus Shipping Fee 60 gold",
	})
	--[[MenuActivator:new({
		name = "Furniture Catalogue: Deluxe",
		id = "FurnitureCatalogueII",
		type = "event",
		recipes = recipesCatalogueII,
		defaultSort = "name",
		defaultFilter = "canCraft",
		defaultShowCategories = true,
		craftButtonText = "Add to Cart",
		materialsHeaderText = "Free Furniture Catalogue",
	})]]
end
