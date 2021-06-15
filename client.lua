--[[
───────────────────────────────────────────────────────────────────────

	Speedlimit & Speedlimiter script - Created by bleachy

	(bleachy#1960) (Credits to Big Yoda for the street names & limits)

───────────────────────────────────────────────────────────────────────
]]


-- Streets & their speedlimits
local streetInfo = {["East Joshua Road"] = "50", ["Marina Dr"] = "35", ["Alhambra Dr"] = "35", ["Niland Ave"] = "35", ["Zancudo Ave"] = "35", ["Armadillo Ave"] = "35", ["Algonquin Blvd"] = "35", ["Mountain View Dr"] = "35", ["Cholla Springs Ave"] = "35", ["Panorama Dr"] = "40", ["Lesbos Ln"] = "35", ["Calafia Rd"] = "30", ["North Calafia Way"] = "30", ["Cassidy Trail"] = "25", ["Seaview Rd"] = "35", ["Grapeseed Main St"] = "35", ["Grapeseed Ave"] = "35", ["Joad Ln"] = "35", ["Union Rd"] = "40", ["O'Neil Way"] = "25", ["Senora Fwy"] = "65", ["Catfish View"] = "35", ["Great Ocean Hwy"] = "60", ["Paleto Blvd"] = "35", ["Duluoz Ave"] = "35", ["Procopio Dr"] = "35", ["Cascabel Ave"] = "30", ["Procopio Promenade"] = "25", ["Pyrite Ave"] = "30", ["Fort Zancudo Approach Rd"] = "25", ["Barbareno Rd"] = "30", ["Ineseno Road"] = "30", ["West Eclipse Blvd"] = "35", ["Playa Vista"] = "30", ["Bay City Ave"] = "30", ["Del Perro Fwy"] = "65", ["Equality Way"] = "30", ["Red Desert Ave"] = "30", ["Magellan Ave"] = "25", ["Sandcastle Way"] = "30", ["Vespucci Blvd"] = "40", ["Prosperity St"] = "30", ["San Andreas Ave"] = "40", ["North Rockford Dr"] = "35", ["South Rockford Dr"] = "35", ["Marathon Ave"] = "30", ["Boulevard Del Perro"] = "35", ["Cougar Ave"] = "30", ["Liberty St"] = "30", ["Bay City Incline"] = "40", ["Conquistador St"] = "25", ["Cortes St"] = "25", ["Vitus St"] = "25", ["Aguja St"] = "25", ["Goma St"] = "25", ["Melanoma St"] = "25", ["Palomino Ave"] = "35", ["Invention Ct"] = "25", ["Imagination Ct"] = "25", ["Rub St"] = "25", ["Tug St"] = "25", ["Ginger St"] = "30", ["Lindsay Circus"] = "30", ["Calais Ave"] = "35", ["Adam's Apple Blvd"] = "40", ["Alta St"] = "40", ["Integrity Way"] = "30", ["Swiss St"] = "30", ["Strawberry Ave"] = "40", ["Capital Blvd"] = "30", ["Crusade Rd"] = "30", ["Innocence Blvd"] = "40", ["Davis Ave"] = "40", ["Little Bighorn Ave"] = "35", ["Roy Lowenstein Blvd"] = "35", ["Jamestown St"] = "30", ["Carson Ave"] = "35", ["Grove St"] = "30", ["Brouge Ave"] = "30", ["Covenant Ave"] = "30", ["Dutch London St"] = "40", ["Signal St"] = "30", ["Elysian Fields Fwy"] = "50", ["Plaice Pl"] = "30", ["Chum St"] = "40", ["Chupacabra St"] = "30", ["Miriam Turner Overpass"] = "30", ["Autopia Pkwy"] = "35", ["Exceptionalists Way"] = "35", ["La Puerta Fwy"] = "60", ["New Empire Way"] = "30", ["Runway1"] = "", ["Greenwich Pkwy"] = "35", ["Kortz Dr"] = "30", ["Banham Canyon Dr"] = "40", ["Buen Vino Rd"] = "40", ["Route 68"] = "55", ["Zancudo Grande Valley"] = "40", ["Zancudo Barranca"] = "40", ["Galileo Rd"] = "40", ["Mt Vinewood Dr"] = "40", ["Marlowe Dr"] = "40", ["Milton Rd"] = "35", ["Kimble Hill Dr"] = "35", ["Normandy Dr"] = "35", ["Hillcrest Ave"] = "35", ["Hillcrest Ridge Access Rd"] = "35", ["North Sheldon Ave"] = "35", ["Lake Vinewood Dr"] = "35", ["Lake Vinewood Est"] = "35", ["Baytree Canyon Rd"] = "40", ["North Conker Ave"] = "35", ["Wild Oats Dr"] = "35", ["Whispymound Dr"] = "35", ["Didion Dr"] = "35", ["Cox Way"] = "35", ["Picture Perfect Drive"] = "35", ["South Mo Milton Dr"] = "35", ["Cockingend Dr"] = "35", ["Mad Wayne Thunder Dr"] = "35", ["Hangman Ave"] = "35", ["Dunstable Ln"] = "35", ["Dunstable Dr"] = "35", ["Greenwich Way"] = "35", ["Greenwich Pl"] = "35", ["Hardy Way"] = "35", ["Richman St"] = "35", ["Ace Jones Dr"] = "35", ["Los Santos Freeway"] = "65", ["Senora Rd"] = "40", ["Nowhere Rd"] = "25", ["Smoke Tree Rd"] = "35", ["Cholla Rd"] = "35", ["Cat-Claw Ave"] = "35", ["Senora Way"] = "40", ["Palomino Fwy"] = "60", ["Shank St"] = "25", ["Macdonald St"] = "35", ["Route 68 Approach"] = "55", ["Vinewood Park Dr"] = "35", ["Vinewood Blvd"] = "40", ["Mirror Park Blvd"] = "35", ["Glory Way"] = "35", ["Bridge St"] = "35", ["West Mirror Drive"] = "35", ["Nikola Ave"] = "35", ["East Mirror Dr"] = "35", ["Nikola Pl"] = "25", ["Mirror Pl"] = "35", ["El Rancho Blvd"] = "40", ["Olympic Fwy"] = "60", ["Fudge Ln"] = "25", ["Amarillo Vista"] = "25", ["Labor Pl"] = "35", ["El Burro Blvd"] = "35", ["Sustancia Rd"] = "45", ["South Shambles St"] = "30", ["Hanger Way"] = "30", ["Orchardville Ave"] = "30", ["Popular St"] = "40", ["Buccaneer Way"] = "45", ["Abattoir Ave"] = "35", ["Voodoo Place"] = "30", ["Mutiny Rd"] = "35", ["South Arsenal St"] = "35", ["Forum Dr"] = "35", ["Morningwood Blvd"] = "35", ["Dorset Dr"] = "40", ["Caesars Place"] = "25", ["Spanish Ave"] = "30", ["Portola Dr"] = "30", ["Edwood Way"] = "25", ["San Vitus Blvd"] = "40", ["Eclipse Blvd"] = "35", ["Gentry Lane"] = "30", ["Las Lagunas Blvd"] = "40", ["Power St"] = "40", ["Mt Haan Rd"] = "40", ["Elgin Ave"] = "40", ["Hawick Ave"] = "35", ["Meteor St"] = "30", ["Alta Pl"] = "30", ["Occupation Ave"] = "35", ["Carcer Way"] = "40", ["Eastbourne Way"] = "30", ["Rockford Dr"] = "35", ["Abe Milton Pkwy"] = "35", ["Laguna Pl"] = "30", ["Sinners Passage"] = "30", ["Atlee St"] = "30", ["Sinner St"] = "30", ["Supply St"] = "30", ["Amarillo Way"] = "35", ["Tower Way"] = "35", ["Decker St"] = "35", ["Tackle St"] = "25", ["Low Power St"] = "35", ["Clinton Ave"] = "35", ["Fenwell Pl"] = "35", ["Utopia Gardens"] = "25", ["Cavalry Blvd"] = "35", ["South Boulevard Del Perro"] = "35", ["Americano Way"] = "25", ["Sam Austin Dr"] = "25", ["East Galileo Ave"] = "35", ["Galileo Park"] = "35", ["West Galileo Ave"] = "35", ["Tongva Dr"] = "40", ["Zancudo Rd"] = "35", ["Movie Star Way"] = "35", ["Heritage Way"] = "35", ["Perth St"] = "25", ["Chianski Passage"] = "30", ["Lolita Ave"] = "35", ["Meringue Ln"] = "35", ["Joshua Rd"] = "50"}

-- Generic keys just for easy configging
local keys = {["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118}
local autoSpeedLimitKey = keys[Config.autoSpeedlimitKey]

-- DO NOT change these
local enabled = false
local released = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

		local ped = GetPlayerPed(-1)
        local playerLocation = GetEntityCoords(ped)
        street = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerLocation.x, playerLocation.y, playerLocation.z))

		if IsPedInAnyVehicle(ped) then
		
			if IsControlReleased(0, autoSpeedLimitKey) then
				released = true
			end
		
			local veh = GetVehiclePedIsIn(ped, false)
			if GetPedInVehicleSeat(veh, -1) == ped and not table.find(Config.disabledVehicleClasses, GetVehicleClass(veh)) and not table.find(Config.disabledVehicles, GetDisplayNameFromVehicleModel(GetEntityModel(veh))) then
		
				local pressed = IsControlPressed(0, autoSpeedLimitKey)
				if pressed and enabled and released and Config.enableAutomaticSpeedlimiter then
					enabled = false
					released = false
					alertmsg(Config.disabledAlert)
				elseif pressed and not enabled and released and Config.enableAutomaticSpeedlimiter then
					enabled = true
					released = false
					alertmsg(Config.enabledAlert)
				end		

				if streetInfo[street] then
					speedlimit = streetInfo[street]
					displayLimit(speedlimit)	
				else
					speedlimit = "30"
					displayLimit(speedlimit)
				end
				
				if enabled and Config.enableAutomaticSpeedlimiter and (GetEntitySpeed(veh) * 2.236936) > tonumber(speedlimit) then
					DisableControlAction(0, 71, true)
				end
			end
		
		end
		
		
					
    end
end)

function alertmsg(msg) 
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

function displayLimit(speedlimit)
	if Config.enableSpeedlimitDisplay then
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(0.45, 0.45)
		SetTextColour(255,255,255,255)
		SetTextDropShadow(0,0,0,0,255)
		SetTextDropShadow()
		SetTextEdge(1, 0,0,0,0)
		SetTextEntry("STRING")
		AddTextComponentString("~w~Speedlimit: ~w~"..speedlimit.."~w~ MPH")
		DrawText(0.514 - 1.0 / 2, 1.230 - 1.0 / 2.04) -- Change text position here
	end
end
