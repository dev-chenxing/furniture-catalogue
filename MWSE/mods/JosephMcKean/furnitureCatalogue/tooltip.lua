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
	local uiexpIconBar = tooltip:findChild("UIEXP_Tooltip_IconBar")
	if uiexpIconBar then
		log:debug("UI Expansion Installed, hide icon bar")
		local weight = tooltip:findChild("HelpMenu_weight")
		if weight then
			weight.visible = true
		end
		uiexpIconBar.visible = false
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
	local furniture = common.getFurniture(e.object)
	if furniture then
		uiID = "FurnitureCrate"
		text = "Furniture Crate"
		color = tes3.palette.answerPressedColor
		hideTooltipElements(e.tooltip, furniture.name)
	else
		return
	end
	addLabel(e.tooltip, uiID, text, color)
end
event.register("uiObjectTooltip", customTooltip, { priority = -200 })
