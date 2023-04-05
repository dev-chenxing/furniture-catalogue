local common = require("JosephMcKean.furnitureCatalogue.common")

---@param e uiObjectTooltipEventData
local function furnitureCatalogueTooltip(e)
	if not (e.reference and e.reference.data) then
		return
	end
	local uiID
	local text
	local color
	if common.isCatalogue(e.reference) then
		uiID = "FurnitureCatalogue"
		text = "Furniture Catalogue"
		color = tes3.palette.activeColor
	else
		return
	end
	local block = e.tooltip:createBlock({})
	block.minWidth = 1
	block.maxWidth = 440
	block.autoWidth = true
	block.autoHeight = true
	block.paddingAllSides = 4
	local label = block:createLabel({ id = tes3ui.registerID(uiID), text = text })
	label.wrapText = true
	label.color = tes3ui.getPalette(color)
end
event.register("uiObjectTooltip", furnitureCatalogueTooltip)