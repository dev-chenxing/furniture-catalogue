local common = require("retail.common")
local ashfall = include("mer.ashfall.interop")
---@type CraftingFramework
local CraftingFramework = require("CraftingFramework")
---@type CraftingFramework.MenuActivator
local MenuActivator = CraftingFramework.MenuActivator
local log = common.createLogger("displayTable")
local furnConfig = require("retail.staticConfig.furniture")
local this = {}

local function getNewStock()
	tes3.player.data.retail.todayStock = {}
	local picked = {}
	for i = 1, furnConfig.stockAmount do
		picked[math.random(1, #furnConfig.furniture)] = true
	end
	for j, furniture in ipairs(furnConfig.furniture) do
		if furniture.alwaysInStock or picked[j] then
			tes3.player.data.retail.todayStock[furniture.id] = true
		end
	end
end

---@param displayTable tes3reference
---@param name string?
---@param shopMana tes3reference?
local function set(displayTable, name, shopMana)
	local displayTableName
	local shopManager
	if not shopMana then
		displayTableName = common.getDisplayTable(displayTable)
		shopManager = common.getShopManager()
	else
		displayTableName = name
		shopManager = shopMana
	end
	if not displayTableName then
		return
	end
	if not shopManager then
		return
	end
	local message
	if displayTable.data.isDisplayTable then
		displayTable.data.isDisplayTable = false
		message = string.format("%s unset as Display Table", displayTableName)
	else
		displayTable.data.isDisplayTable = true
		displayTable.modified = true
		message = string.format("%s set as Display Table", displayTableName)
	end
	tes3.messageBox(message)
	log:debug(message)
end

this.customRequirements = {
	inStock = function(furniture)
		return {
			getLabel = function()
				return "In-Stock"
			end,
			check = function()
				local today = tes3.findGlobal("DaysPassed").value
				if tes3.player.data.retail.today ~= today then
					getNewStock()
					tes3.player.data.retail.today = today
				end
				if tes3.player.data.retail.todayStock[furniture.id] then
					return true
				else
					return false, string.format("Unfortunately, this product is out of stock.")
				end
			end,
		}
	end,
	moreFurniture = function(tier)
		local numberMap = { [1] = "I", [2] = "II", [3] = "III" }
		local perkName = (numberMap[tier] and "More Furniture " .. numberMap[tier]) or "Basic Furniture"
		return {
			getLabel = function()
				return perkName
			end,
			check = function()
				local shopManager = common.getShopManager()
				if shopManager and shopManager.data.moreFurniture >= tier then
					return true
				else
					return false, string.format("You must have the %s perk to be able to purchase this", perkName)
				end
			end,
		}
	end,
}

local furnitureRegistered

local function addRecipe(recipes, furniture)
	if not tes3.getObject(furniture.id) then
		return
	end
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
		id = "Retail:" .. furniture.id,
		craftableId = furniture.id,
		description = furniture.description,
		materials = { { material = "gold_001", count = furniture.cost } },
		customRequirements = {
			this.customRequirements.inStock(furniture),
			this.customRequirements.moreFurniture(furniture.tier),
		},
		category = furniture.category,
		name = furniture.name,
		additionalMenuOptions = bedrollButtons,
		soundId = "Item Misc Up",
		quickActivateCallback = function(self, e)
			set(e.reference)
		end,
	}
	table.insert(recipes, recipe)
end

function this.createPurchaseFurnitureMenu()
	if not furnitureRegistered then
		furnitureRegistered = true
		local recipes = {}
		for _, furniture in ipairs(furnConfig.furniture) do
			addRecipe(recipes, furniture)
		end
		MenuActivator:new({
			name = "Retail: Purchase Furniture",
			id = "Retail:PurchaseFurniture",
			type = "event",
			recipes = recipes,
			defaultSort = "name",
			defaultFilter = "canCraft",
			defaultShowCategories = true,
			craftButtonText = "Purchase",
			materialsHeaderText = "Cost",
		})
	end
end

-- Does not really work
--[[local function QuickLootTooltipPatch()
	local quickLootGUI = tes3ui.findMenu("QuickLoot:Menu")
	if not quickLootGUI then
		return
	end
	local nameLabel = quickLootGUI:findChild("QuickLoot:NameLabel")
	if not nameLabel then
		return
	end
	if quickLootGUI:findChild("QuickLoot:Retail_display_table") then
		return
	end
	local nameBlock = nameLabel.parent
	nameBlock.flowDirection = "top_to_bottom"
	local label = nameBlock:createLabel(
	              { id = tes3ui.registerID("QuickLoot:Retail_display_table"), text = "Display Table" })
	label.wrapText = true
	label.color = tes3ui.getPalette(tes3.palette.activePressedColor)
end
if include("QuickLoot.interop") then
	event.register("activationTargetChanged", QuickLootTooltipPatch, { priority = 571 })
end
]]

---@param e uiObjectTooltipEventData
local function displayTableTooltip(e)
	if e.reference and e.reference.data and e.reference.data.isDisplayTable then
		local block = e.tooltip:createBlock()
		block.minWidth = 1
		block.maxWidth = 440
		block.autoWidth = true
		block.autoHeight = true
		block.paddingAllSides = 4
		local label = block:createLabel({ id = tes3ui.registerID("Retail_display_table"), text = "Display Table" })
		label.wrapText = true
		label.color = tes3ui.getPalette(tes3.palette.activePressedColor)
	end
end
event.register("uiObjectTooltip", displayTableTooltip)

--- Shift activate to set as Display Table. Compatibility issues with MWCA and Loading Doors
---@param e activateEventData
local function setWorldDisplayTable(e)
	if not tes3.worldController.inputController:isShiftDown() then
		return
	end
	if tes3ui.menuMode() then
		return
	end
	if e.activator ~= tes3.player then
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	local displayTableName, isStatic = common.getDisplayTable(e.target)
	if not displayTableName then -- Has to be on the Display Table list
		return
	end
	if isStatic then
		return
	end
	local displayTable = e.target
	if displayTable.data.crafted then
		return
	end
	set(displayTable, displayTableName, shopManager)
	return false
end
event.register("activate", setWorldDisplayTable, { priority = 570 })

--- Shift activate to set as Display Table.
local function setWorldStaticDisplayTable(e)
	if not tes3.worldController.inputController:isShiftDown() then
		return
	end
	if not e.reference then
		return
	end
	local shopManager = common.getShopManager()
	if not shopManager then
		return
	end
	local displayTableName, isStatic = common.getDisplayTable(e.reference)
	if not displayTableName then -- Has to be on the Display Table list
		return
	end
	if not isStatic then
		return
	end
	local displayTable = e.reference
	if displayTable.data.crafted then
		return
	end
	set(displayTable, displayTableName, shopManager)
end
event.register("CraftingFramework:StaticActivation", setWorldStaticDisplayTable)

return this
