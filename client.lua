--[[
───────────────────────────────────────────────────────────────────────

	Speedlimit & Speedlimiter script - Created by bleachy

	(bleachy#1960) (Credits to Big Yoda for the street names & limits)

───────────────────────────────────────────────────────────────────────
]]

-- Generic keys just for easy configuring
local keys = {["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118}
local autoSpeedLimitKey = keys[Config.autoSpeedlimitKey]

-- DO NOT change these
local enabled = false
local released = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

		local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local playerLocation = GetEntityCoords(ped)
            local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerLocation.x, playerLocation.y, playerLocation.z))

			if IsControlReleased(0, autoSpeedLimitKey) and GetLastInputMethod(2) then
				released = true
			end
		
			local veh = GetVehiclePedIsIn(ped, false)
			if GetPedInVehicleSeat(veh, -1) == ped and not table.find(Config.disabledVehicleClasses, GetVehicleClass(veh)) and not table.find(Config.disabledVehicles, GetDisplayNameFromVehicleModel(GetEntityModel(veh))) then
				local pressed = IsControlPressed(0, autoSpeedLimitKey)
				if pressed and enabled and released and Config.enableAutomaticSpeedlimiter and GetLastInputMethod(2) then
					enabled = false
					released = false
					SendAlert(Config.disabledAlert)
				elseif pressed and not enabled and released and Config.enableAutomaticSpeedlimiter then
					enabled = true
					released = false
					SendAlert(Config.enabledAlert)
				end		

				if Config.SpeedLimits[street] then
					speedlimit = Config.SpeedLimits[street]
					DisplayLimit(speedlimit)
				else
					speedlimit = "30"
					DisplayLimit(speedlimit)
				end
				
				if enabled and Config.enableAutomaticSpeedlimiter and (GetEntitySpeed(veh) * 2.236936) > tonumber(speedlimit) then
					DisableControlAction(0, 71, true)
				end
			end
		end					
    end
end)

function SendAlert(msg) 
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

function table.find(tbl, search)
	for k, v in ipairs(tbl) do
		if v == search then
			return true
		end
	end
	return false
end

function DisplayLimit(speedlimit)
	if Config.enableSpeedlimitDisplay then
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(0.45, 0.45)
		SetTextColour(255,255,255,255)
		SetTextDropShadow(0,0,0,0,255)
		SetTextDropShadow()
		SetTextEdge(1, 0,0,0,0)
		SetTextEntry("STRING")
        AddTextComponentString(string.format("~w~Speedlimit: ~w~%s~w~ MPH", speedlimit))
		DrawText(0.514 - 1.0 / 2, 1.230 - 1.0 / 2.04) -- Change text position here
	end
end
