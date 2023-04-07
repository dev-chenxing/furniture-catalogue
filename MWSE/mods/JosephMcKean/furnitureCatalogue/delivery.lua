local common = require("JosephMcKean.furnitureCatalogue.common")
local config = require("JosephMcKean.furnitureCatalogue.config")
local furnConfig = require("JosephMcKean.furnitureCatalogue.furnConfig")

local log = common.createLogger("delivery")

local dist = 60

---@param e activateEventData
local function activateDeliveryCrate(e)
	if not (e.activator == tes3.player) then
		return
	end
	if string.startswith(e.target.object.id:lower(), "jsmk_fc_crate") then
		e.target:disable()
		tes3.messageBox("Unboxing.")
		return false
	end
end
event.register("activate", activateDeliveryCrate)

---@param order furnitureCatalogue.order
local function placeCrate(order)
	local deliveryCrate = tes3.createReference({
		object = furnConfig.deliveryCrate[order.product.size],
		cell = order.shippingAddress.cell,
		position = {
			order.shippingAddress.position.x + dist * math.cos(order.shippingAddress.orientation.z + math.pi / 2),
			order.shippingAddress.position.y + dist * math.sin(order.shippingAddress.orientation.z + math.pi / 2),
			order.shippingAddress.position.z + 128,
		},
	})
	-- Drop and orient the crate on the ground
	common.orientRefToGround(deliveryCrate)
end

---@param num number
---@param order furnitureCatalogue.order
local function deliver(num, order)
	local deliveryCrateId = furnConfig.deliveryCrate[order.product.size]
	if tes3.getObject(deliveryCrateId) then
		placeCrate(order)
		order.status = "Completed"
		local i = num
		if i == tes3.player.data.furnitureCatalogue.orderListHead then
			local j = i + 1
			while true do
				if order[j] and (order[j].status == "Completed") then
					j = j + 1
				else
					tes3.player.data.furnitureCatalogue.orderListHead = j
					break
				end
			end
		end
	else
		log:error("deliveryCrateId not found")
	end
end

---@class timerCallbackData
---@field timer mwseTimer Access to our timer
---@param e timerCallbackData
local function deliveryCheckTimerCallback(e)
	local timer = e.timer
	local data = timer.data
	if not tes3.player.data.furnitureCatalogue.order then
		return
	end
	if table.empty(tes3.player.data.furnitureCatalogue.order) then
		return
	end
	tes3.player.data.furnitureCatalogue.orderListHead = tes3.player.data.furnitureCatalogue.orderListHead or 1
	for i = tes3.player.data.furnitureCatalogue.orderListHead, #tes3.player.data.furnitureCatalogue.order do
		local order = tes3.player.data.furnitureCatalogue.order[i] ---@type furnitureCatalogue.order
		local daysPassed = tes3.findGlobal("DaysPassed").value
		if daysPassed >= order.dayPassed + config.deliveryTime then
			local hour = tes3.findGlobal("GameHour").value
			local weatherController = tes3.worldController.weatherController
			if hour >= weatherController.sunriseHour and hour <= weatherController.sunsetHour then -- delivery closed at night
				deliver(i, order)
			end
		end
	end
end

local function deliveryCheckTimerStart()
	timer.register("FurnitureCatalogue:deliveryCheckTimer", deliveryCheckTimerCallback)
	timer.start({
		type = timer.game,
		persist = true,
		iterations = -1,
		duration = 1,
		callback = "FurnitureCatalogue:deliveryCheckTimer",
		data = {},
	})
end
event.register("loaded", deliveryCheckTimerStart)
