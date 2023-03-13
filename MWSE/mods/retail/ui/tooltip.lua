local common = require("retail.common")

---@param e uiObjectTooltipEventData
local function retailTooltip(e)
	if not (e.reference and e.reference.data) then
		return
	end
	local uiID
	local text
	local color
	if common.isShopManager(e.reference) then
		uiID = "Retail_shop_manager"
		text = "Shop Manager"
		color = tes3.palette.activeColor
	elseif e.reference.data.isFrontDoor then
		uiID = "Retail_front_door"
		text = "Front Door"
		color = tes3.palette.activeOverColor
	elseif e.reference.data.isDisplayTable then
		uiID = "Retail_display_table"
		text = "Display Table"
		color = tes3.palette.activePressedColor
	elseif e.reference.data.isWare then
		uiID = "Retail_ware"
		text = "For Sale"
		color = tes3.palette.answerColor
	else
		return
	end
	local block = e.tooltip:createBlock()
	block.minWidth = 1
	block.maxWidth = 440
	block.autoWidth = true
	block.autoHeight = true
	block.paddingAllSides = 4
	local label = block:createLabel({ id = tes3ui.registerID(uiID), text = text })
	label.wrapText = true
	label.color = tes3ui.getPalette(color)
end
event.register("uiObjectTooltip", retailTooltip)

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
