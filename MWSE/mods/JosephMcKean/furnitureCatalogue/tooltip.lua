local common = require("JosephMcKean.furnitureCatalogue.common")

local log = common.createLogger("tooptip")

---@param tooltip tes3uiElement
---@param text string
local function hideTooltipElements(tooltip, text)
	local icon = tooltip:findChild("HelpMenu_icon")
	if icon then
		icon.visible = false
	end
	local name = tooltip:findChild("HelpMenu_name")
	if name then
		name.text = text
	end
	local value = tooltip:findChild("HelpMenu_value")
	if value then
		value.visible = false
	end
	local uiexpIconGold = tooltip:findChild("UIEXP_Tooltip_IconGoldBlock")
	if uiexpIconGold then
		log:debug("Setting uiexpIconGold to not visible")
		uiexpIconGold.visible = false
	end
	local uiexpIconRatio = tooltip:findChild("UIEXP_Tooltip_IconRatioBlock")
	if uiexpIconRatio then
		uiexpIconRatio.visible = false
	end
	tooltip:updateLayout()
end

---@param tooltip tes3uiElement
---@param uiID string
---@param text string
---@param color string
local function addLabel(tooltip, uiID, text, color)
	local block = tooltip:createBlock({})
	block.minWidth = 1
	block.maxWidth = 440
	block.autoWidth = true
	block.autoHeight = true
	block.paddingAllSides = 4
	local label = block:createLabel({ id = tes3ui.registerID(uiID), text = text })
	label.wrapText = true
	label.color = tes3ui.getPalette(color)
	tooltip:updateLayout()
end

---@param e uiObjectTooltipEventData
local function customTooltip(e)
	local uiID, text, color
	if common.isCatalogue(e.object) then
		uiID = "FurnitureCatalogue"
		text = "Furniture Catalogue"
		color = tes3.palette.activeColor
	elseif common.isDeliveryCrate(e.object) then
		uiID = "FurnitureCrate"
		text = "Furniture Crate"
		color = tes3.palette.answerPressedColor
		if e.itemData and e.itemData.data and e.itemData.data.furnitureCatalogue and
		e.itemData.data.furnitureCatalogue.furniture then
			hideTooltipElements(e.tooltip, e.itemData.data.furnitureCatalogue.furniture.name)
		end
	else
		return
	end
	addLabel(e.tooltip, uiID, text, color)
end
event.register("uiObjectTooltip", customTooltip)
