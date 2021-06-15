--[[
───────────────────────────────────────────────────────────────────────

	Speedlimit & Speedlimiter script - Created by bleachy

	(bleachy#1960) (Credits to Big Yoda for the street names & limits)

───────────────────────────────────────────────────────────────────────
]]

-- Ignore this line
Config = {}

-- Set to true if you would like the speedlimit of each road to be displayed on the HUD
Config.enableSpeedlimitDisplay = true

-- Set to true if you would like the automatic speedlimiter to be enabled
Config.enableAutomaticSpeedlimiter = true

-- You can choose from these keys https://docs.fivem.net/docs/game-references/controls/
Config.autoSpeedlimitKey = "]"

-- This will disable the speedlimit & speedlimiter from working on the below vehicle classes
-- Use https://i.imgur.com/7Jy5izx.png if you would like to disable more vehicle classes
Config.disabledVehicleClasses = {
	14, -- Boats
	15, -- Helicopters
	16, -- Planes
	21 -- Trains
}

-- This will disable the speedlimit & speedlimiter from working on the below vehicles
-- WARNING: You may need to put the vehicle model name in FULL CAPS
Config.disabledVehicles = {
	"RHINO"
}

-- Alerts that pop up when auto speed limiting is enabled/disabled
Config.enabledAlert = "You have ~g~ENABLED~w~ automatic speed limits"
Config.disabledAlert = "You have ~r~DISABLED~w~ automatic speed limits"

-- Change the positioning of the speedlimit text in the client.lua file. 




