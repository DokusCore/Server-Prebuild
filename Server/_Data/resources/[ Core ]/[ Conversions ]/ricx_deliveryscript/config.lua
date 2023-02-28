Config = {}

Config.AtMissionText = "Press SPACEBAR to start" --says 'Press U to start' default. Change KeyID['name'] to change the control name

Config.D1 = {
	["JobBlipName"] = "Job: Delivery", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = 2790.46,
		["Y"]= -1421.77,
		["Z"] = 45.39
	},
	["Reward"] = 0.10, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int | NOT USED IN DOKUSCORE
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Delivery here!", --Drop' Blip Name on Map
	["JobName"] = "St Denis Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}

Config.D1Prop = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}


Config.D1DELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.0,--Reward odds
		["CP"] = {x=2831.71, y=-1414.59, z=45.39},--Delivery position
	},
	[2] = {
		["Odds"] = 1.0,
		["CP"] = {x=2822.5, y=-1383.32, z=45.39},
	},
	[3] = {
		["Odds"] = 1.0,
		["CP"] = {x=2861.75, y=-1372.91, z=44.56},
	}
}
