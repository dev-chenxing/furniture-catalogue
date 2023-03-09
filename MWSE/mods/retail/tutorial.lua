local common = require("retail.common")
local log = common.createLogger("tutorial")
local this = {}

local steps = {
	[1] = {
		header = "Front Door",
		desc = "Shift + activate a door in the shop to set as the Front Door. This is where you open and close the shop, and also where the customers will come in from.",
		condition = function(shopManager)
			return shopManager.data.hasFrontDoor
		end,
	},
	[2] = {
		header = "Display Table",
		desc = "Before we open the shop, we need a display shelf or a display table to display our wares. Shift + activate valid furniture to set as Display Table. You can also purchase new furniture from the Shop Manager.",
		condition = function(shopManager)
			return shopManager.data.hasDisplayTable
		end,
		additionalDesc = "We'll need a shelf or a table to display our wares. Currently there is no valid furniture in the shop that can be set as Display Table. Please purchase new furniture from the Shop Manager. Then Shift + activate the furniture to set as Display Table.",
		additionalCondition = function(shopManager)
			return not shopManager.data.hasValidDisplayTable
		end,
	},
	[3] = {
		header = "Wares",
		desc = "Now simply put items on the Display Shelf to set for sale.",
		condition = function(shopManager)
			return shopManager.data.hasWares
		end,
	},
	[4] = {
		header = "Edit Barter Item Types",
		desc = "It is recommended to specify the types of wares you sell, so customers are more likely to buy your wares. To do that, activate the Shop Manager and Edit Barter Item Types.",
		condition = function()
			return false
		end,
	},
	[5] = {
		header = "Open the Shop",
		desc = "The shop is now ready to welcome its first customer. To open the shop, activate the Front Door of the shop.",
		condition = function()
			return false
		end,
	},
	[6] = {
		header = "Sale Tactics",
		desc = "If you have high enough Mercantile skill, you can persuade the customer to buy your product.",
		condition = function()
			return false
		end,
	},
	[7] = {
		header = "May I Help You",
		desc = "Customers sometimes want items that your shop currently does not have. Talk to them and ask May I help you.",
		condition = function()
			return false
		end,
	},
	[8] = {
		header = "Enjoy",
		desc = "This is the gist of the mod. If you enjoy this mod, remember to hit the endorse button. It really helps out.",
		condition = function()
			return false
		end,
	},
}

---@type tes3uiElement
local tutorialPopup = {}
---@type tes3uiElement
local tutorialHeader = {}
---@type tes3uiElement
local tutorialDesc = {}

local function createTutorialPopup()
	tutorialPopup = tes3ui.createHelpLayerMenu({ id = "MenuRetailTutorial" })
	tutorialPopup.absolutePosAlignX = 0.975
	tutorialPopup.absolutePosAlignY = 0.375
	tutorialPopup.minWidth = tes3.worldController.viewWidth / 4
	tutorialPopup.autoHeight = true
	tutorialPopup.borderAllSides = 10
	tutorialPopup.flowDirection = tes3.flowDirection.topToBottom
	tutorialHeader = tutorialPopup:createLabel({ id = "MenuRetailTutorial_header", text = "HEADER" })
	tutorialHeader.widthProportional = 1
	tutorialHeader.autoHeight = true
	tutorialHeader.borderTop = 10
	tutorialHeader.borderLeft = 10
	tutorialHeader.color = tes3ui.getPalette(tes3.palette.whiteColor)
	tutorialHeader.wrapText = true
	tutorialDesc = tutorialPopup:createLabel({ id = "MenuRetailTutorial_desc", text = "Description." })
	tutorialDesc.widthProportional = 1
	tutorialDesc.autoHeight = true
	tutorialDesc.borderAllSides = 10
	tutorialDesc.color = tes3ui.getPalette(tes3.palette.normalColor)
	tutorialDesc.wrapText = true
	tutorialPopup:updateLayout()
	tutorialPopup.visible = false
end
event.register("loaded", createTutorialPopup)

local function setTutorialPopupVisible()
	if tes3.player and tes3.player.data.retail.tutorialStep and tes3.player.data.retail.tutorialStep ~= 0 then
		local shopManager = common.getShopManager()
		if shopManager then
			for i, step in ipairs(steps) do
				if i == tes3.player.data.retail.tutorialStep then
					if step.condition(shopManager) then
						tes3.player.data.retail.tutorialStep = i + 1
						return
					end
					tutorialHeader.text = step.header:upper()
					if step.additionalCondition and step.additionalCondition(shopManager) then
						tutorialDesc.text = step.additionalDesc
					else
						tutorialDesc.text = step.desc
					end
					tutorialPopup:updateLayout()
				end
			end
			tutorialPopup.visible = true
		else
			tutorialPopup.visible = false -- tutorials should only be shown in shop cell
		end
	end
end
event.register("loaded", function()
	timer.start({ type = timer.simulate, duration = 0.125, iterations = -1, callback = setTutorialPopupVisible })
end)

function this.startTutorial()
	tes3.player.data.retail.tutorialStep = 1
	tes3.player.data.retail.tutorialFinished = false
end

return this
