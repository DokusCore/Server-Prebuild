-- main-client.lua

local config = {
	key = 0x760A9C6F, -- G
	game_rules = {
		max_hits = 10,
		max_misses = 5,
	},
	locations = {
		{
			x = -198.6,
			y = 631.06,
			z = 112.05,
			h = 131.0, -- if you change this you will need to change the offsets too
			cost = false, -- false to not charge, number to charge that amount
		},
		{
			x = 1393.2,
			y = -1247.6,
			z = 77.8,
			h = 131.0, -- if you change this you will need to change the offsets too
			cost = false, -- false to not charge, number to charge that amount
		},
		{
			x = -3574.5,
			y = -2670.1,
			z = -10.7,
			h = 131.0, -- if you change this you will need to change the offsets too
			cost = false, -- false to not charge, number to charge that amount
		},
	},
	current_language = 'en',
	language = {
		['en'] = {
			["prompt_press"] = 'Press',
			["prompt_play"] = 'Play',
			["prompt_end"] = 'End',
			["prompt_game_name"] = 'Bottle Game',
			["wrong_weapon"] = "That weapon won't work",
			["goto_spot"] = 'Head to the shoot spot!',
			["game_hits"] = 'Hits',
			["game_misses"] = 'Misses',
			["game_hit"] = 'Hit!',
			["game_miss"] = 'Miss!',
			["game_shoot"] = 'Shoot the bottle!',
			["game_end-win"] = 'Game over. You win!',
			["game_end-lose"] = 'Game over. You LOSE!',
		},
	},
	functions = {
		check_function = function(cost)
			return true -- return false if cannot play
		end,
		charge_fucntion = function(cost)
			return true -- return false if payment fails
		end,
		reward_function = function(reward)
			-- reward player with 'reward'
		end,
		notification_function = function(text, duration)
			-- feel free to change this
			exports['bottleshoot']:ShowTooltip(tostring(text), tonumber(duration))
		end
	}
}

CreateThread(function()
	local vec = vec3(config.locations[1].x, config.locations[1].y, config.locations[1].z)
	for k,v in pairs(config.locations) do
		local Vec = vec3(v.x, v.y, v.z)
		SetBlip(Vec, -1052367340, 1.0, 'Gun Game')
	end
end)

------------------------------------
-- RESOURCE SYSTEM
---- Do not edit past this line
------------------------------------

local system_config = {
	initiated = false,
	locations = {},
	game_data = {
		playing = false,
		init = false,
		location = false,
		counts = {
			hits = 0,
			misses = 0,
		},
	},
	offsets = {
		shoot_spot = {
			x = 5.0,
			y = 5.0,
			z = 0.0
		},
		crate_left = {
			x = 0.8,
			y = -1.4,
			z = 0.0,
			h = 98.0
		},
		crate_right = {
			x = -0.8,
			y = 1.4,
			z = 0.0,
			h = 60.0
		},
		bottles = {
			[1] = { -- middle crate
				{
					mdl = GetHashKey('P_BOTTLEBEER01A_1'),
					x = 0.0,
					y = 0.0,
					z = 1.0,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLECASTOR01X'),
					x = -0.25,
					y = 0.25,
					z = 1.0,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLECASTOR01X'),
					x = -0.40,
					y = -0.05,
					z = 1.0,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLECHAMPAGNE01X'),
					x = 0.25,
					y = -0.25,
					z = 1.0,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLECHAMPAGNE01X'),
					x = 0.25,
					y = -0.08,
					z = 1.0,
					h = 0.0
				},
			},
			[2] = { -- left crate
				{
					mdl = GetHashKey('P_BOTTLEJD01X'),
					x = -0.8,
					y = 1.2,
					z = 1.08,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLEABSINTHE01X'),
					x = -0.950,
					y = 1.560,
					z = 1.02,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLECORDIAL01X'),
					x = -1.050,
					y = 1.860,
					z = 1.02,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLE008X_BIG'),
					x = -0.750,
					y = 0.550,
					z = 1.02,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLE013X'),
					x = -0.850,
					y = 0.850,
					z = 1.07,
					h = 0.0
				},
				{
					mdl = GetHashKey('P_BOTTLE02X'),
					x = -0.950,
					y = 2.050,
					z = 1.07,
					h = 0.0
				},
			},
			-- [3] = { -- right crate
			-- }
		}
	},
	prompts = {
		startGame = false,
		endGame = false,
	},
	prompt_groups = {
		startGame = GetRandomIntInRange(0, 0xffffff),
		endGame = GetRandomIntInRange(0, 0xffffff),
	}
}

function getLangString(key)
	if not config.current_language or not config.language[config.current_language] then
		return 'INVALID LANGUAGE SET / NO LANGUAGE SET'
	end
	if not config.language[config.current_language][key] then
		return 'INVALID STRING KEY'
	else
		return config.language[config.current_language][key]
	end
end

function InitPrompts()
	system_config.prompts.startGame = PromptRegisterBegin()
	PromptSetControlAction(system_config.prompts.startGame, config.key)
	local str = CreateVarString(10, 'LITERAL_STRING', getLangString('prompt_play'))
	PromptSetText(system_config.prompts.startGame, str)
	PromptSetEnabled(system_config.prompts.startGame, 1)
	PromptSetVisible(system_config.prompts.startGame, 1)
	PromptSetStandardMode(system_config.prompts.startGame, 1)
	PromptSetGroup(system_config.prompts.startGame, system_config.prompt_groups.startGame)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C, system_config.prompts.startGame, true)
	PromptRegisterEnd(system_config.prompts.startGame)

	system_config.prompts.endGame = PromptRegisterBegin()
	PromptSetControlAction(system_config.prompts.endGame, config.key)
	local str = CreateVarString(10, 'LITERAL_STRING', getLangString('prompt_end'))
	PromptSetText(system_config.prompts.endGame, str)
	PromptSetEnabled(system_config.prompts.endGame, 1)
	PromptSetVisible(system_config.prompts.endGame, 1)
	PromptSetStandardMode(system_config.prompts.endGame, 1)
	PromptSetGroup(system_config.prompts.endGame, system_config.prompt_groups.endGame)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C, system_config.prompts.endGame, true)
	PromptRegisterEnd(system_config.prompts.endGame)
end


function createCrate(crate)
	local response = false

	local crate_model = crate.mdl
	RequestModel(crate_model)
	while not HasModelLoaded(crate_model) do Wait(10) end
	local existing = GetClosestObjectOfType(crate.x, crate.y, crate.z, 5.0, crate_model, false, false, false)
	if existing then
		DeleteEntity(existing)
	end
	local create_handle = CreateObject(crate_model, crate.x, crate.y, crate.z, false, true, false)
	SetEntityHeading(create_handle, crate.h)
	if create_handle then
		response = create_handle
	end

	return response
end

function createCrates(location_id)
	local location = config.locations[location_id]
	local response = {}

	local crates = { -- need to move this into config really
		[1] = { -- middle crate
			mdl = GetHashKey("P_CRATE012AX"),
			x = location.x,
			y = location.y,
			z = location.z,
			h = location.h
		},
		-- [2] = { -- left crate
		-- 	mdl = GetHashKey("P_CRATE04X_B"),
		-- 	x = location.x + system_config.offsets.crate_left.x,
		-- 	y = location.y + system_config.offsets.crate_left.y,
		-- 	z = location.z + system_config.offsets.crate_left.z,
		-- 	h = location.h + system_config.offsets.crate_left.h
		-- },
		[3] = { -- right crate
			mdl = GetHashKey("P_CRATE04X"),
			x = location.x + system_config.offsets.crate_right.x,
			y = location.y + system_config.offsets.crate_right.y,
			z = location.z + system_config.offsets.crate_right.z,
			h = location.h + system_config.offsets.crate_right.h
		}
	}

	for k, crate in pairs(crates) do
		table.insert(response, createCrate(crate))
	end

	return response
end

function createBottle(bottle, handle_thread)
	local response = false

	local bottle_model = bottle.mdl
	RequestModel(bottle_model)
	while not HasModelLoaded(bottle_model) do Wait(1) end
	local create_handle = CreateObject(bottle_model, bottle.x, bottle.y, bottle.z, false, true, false)
	SetEntityHeading(create_handle, bottle.h)
	FreezeEntityPosition(create_handle, true)
	if create_handle then
		response = create_handle
	end

	if handle_thread then
		Citizen.CreateThread(function()
			local ended = true
			-- handle respawn / updating game data
			while ended and system_config.game_data.playing do Citizen.Wait(0)
				local just_shot = false
				if IsPedShooting(GetPlayerPed(PlayerId())) then
					-- shot
					just_shot = true
					Citizen.Wait(100)
				end
				if just_shot then
					if create_handle then
						if HasEntityBeenDamagedByAnyPed(create_handle) then
							-- damaged
							system_config.game_data.counts.hits = system_config.game_data.counts.hits + 1
							ended = true
							config.functions.notification_function(getLangString('game_hit'), 1000)
							DeleteEntity(create_handle)
							if system_config.game_data.counts.hits < config.game_rules.max_hits then
								createRandomBottle(system_config.game_data.location)
							else
								-- end game
								config.functions.notification_function(getLangString('game_end-win'), 3000)
								system_config.game_data.playing = false
								-- system_config.locations[system_config.game_data.location].bottles = createBottles(system_config.game_data.location)
							end
							break
						else
							-- missed
							config.functions.notification_function(getLangString('game_miss'), 1000)
							system_config.game_data.counts.misses = system_config.game_data.counts.misses + 1
							ended = true
							DeleteEntity(create_handle)
							if system_config.game_data.counts.misses < config.game_rules.max_misses then
								createRandomBottle(system_config.game_data.location)
							else
								-- end game
								config.functions.notification_function(getLangString('game_end-lose'), 3000)
								system_config.game_data.playing = false
								-- system_config.locations[system_config.game_data.location].bottles = createBottles(system_config.game_data.location)
							end
							break
							-- retry
						end
					end
				end
			end
			if create_handle then
				DeleteEntity(create_handle)
			end
		end)
	else
		SetEntityInvincible(create_handle, true)
	end
	return response
end

function createBottles(location_id) -- creates all bottles for display ?needed?
	local response = {}

	local location = config.locations[location_id]
	local bottles = system_config.offsets.bottles

	for k, bottle_groups in pairs(bottles) do
		for k, bottle in pairs(bottle_groups) do
			local x = location.x + bottle.x
			bottle.x = x
			local y = location.y + bottle.y
			bottle.y = y
			local z = location.z + bottle.z
			bottle.z = z
			local h = location.z + bottle.h
			bottle.h = h
			table.insert(response, createBottle(bottle,false))
		end
	end

	return response
end

function createRandomBottle(location_id)
	local response = {}

	local random_side = 1
	local random_bottle = 1

	if system_config.game_data.last_side then
		random_side = system_config.game_data.last_side
		while random_side == system_config.game_data.last_side do Citizen.Wait(0)
			random_side = math.random(1, #system_config.offsets.bottles)
		end
	else
		random_side = math.random(1, #system_config.offsets.bottles)
	end
	if system_config.game_data.last_bottle then
		while random_bottle == system_config.game_data.last_bottle do Citizen.Wait(0)
			random_bottle = math.random(1, #system_config.offsets.bottles[random_side])
		end
	else
		random_bottle = math.random(1, #system_config.offsets.bottles[random_side])
	end
	random_bottle = system_config.offsets.bottles[random_side][random_bottle]

	table.insert(response, createBottle(random_bottle,true))

	return response
end

function startGame(location_id)
	system_config.game_data.init = true
	-- delete the bottles that currently exist
	local location = config.locations[location_id]
	local system_location = system_config.locations[location_id]
	for k, bottle in pairs(system_location.bottles) do
		local handle = GetClosestObjectOfType(GetEntityCoords(bottle), 0.01, GetEntityModel(bottle), false, false, false) -- not sure why I have to do this?
		DeleteEntity(handle)
	end
	system_config.locations[system_config.game_data.location].bottles = createRandomBottle(system_config.game_data.location)
end

Citizen.CreateThread(function()
	if not system_config.initiated then
		InitPrompts()
		-- SetEntityCoords(GetPlayerPed(PlayerId()), config.locations[1].x, config.locations[1].y, config.locations[1].z) -- easy dev+
		system_config.initiated = true
	end
	while true do Citizen.Wait(0)

	    if system_config.game_data.playing then
	    	local playing_location = config.locations[system_config.game_data.location]

		    local scoreboard_prompt = DatabindingAddDataContainerFromPath("", "helperTextfields");
		    DatabindingAddDataString(scoreboard_prompt, "rawLabel0", getLangString('game_hits'));
		    DatabindingAddDataString(scoreboard_prompt, "rawLabel1", getLangString('game_misses'));
		    DatabindingAddDataString(scoreboard_prompt, "rawValue0", tostring(system_config.game_data.counts.hits));
		    DatabindingAddDataString(scoreboard_prompt, "rawValue1", tostring(system_config.game_data.counts.misses));
	        Citizen.InvokeNative(0xC9CAEAEEC1256E54, -66088566)

	        local shoot_spot_x = playing_location.x + system_config.offsets.shoot_spot.x
	        local shoot_spot_y = playing_location.y + system_config.offsets.shoot_spot.y
	        local shoot_spot_z = playing_location.z + system_config.offsets.shoot_spot.z

			local shoot_spot_dist = Util.GetVecDist(GetEntityCoords(GetPlayerPed(PlayerId())), vector3(shoot_spot_x,shoot_spot_y,shoot_spot_z))
			if shoot_spot_dist > 1.5 then
				-- walked away from the spot / not there yet
				Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, vector3(shoot_spot_x,shoot_spot_y,shoot_spot_z), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), vector3(0.5, 0.5, 0.5), vector4(1, 1, 1, 1), false, false, 0, false, false, false, false)
			else
				-- in shoot area
				if not system_config.game_data.init then
					startGame(system_config.game_data.location)
				end
			end
	    end

		for k, location in pairs(config.locations) do
			local dist = Util.GetVecDist(GetEntityCoords(GetPlayerPed(PlayerId())), vector3(location.x, location.y, location.z))
			-- check if player is nearby location
			if dist < 30 then
				-- handle spawn of objects
				if not system_config.locations[k] then
					-- location has not been spawned before...
					local spawned_crates = createCrates(k)
					local spawned_bottles = createBottles(k)
					system_config.locations[k] = {
						crates = spawned_crates,
						bottles = spawned_bottles
					}
				else
					-- check if the crates/bottles are still there ?
				end
				if dist < 2 then
					-- display prompt
					if system_config.game_data.playing == false then
						PromptSetActiveGroupThisFrame(system_config.prompt_groups.startGame, CreateVarString(10, 'LITERAL_STRING', getLangString('prompt_game_name')))
						if Citizen.InvokeNative(0xC92AC953F0A982AE, system_config.prompts.startGame) then
							-- pressed key associated with prompt
							config.functions.notification_function(getLangString('goto_spot'), 1000)
							system_config.game_data.playing = true
							system_config.game_data.location = k
							system_config.game_data.init = false
							system_config.game_data.counts.hits = 0
							system_config.game_data.counts.misses = 0
						end
					else
						PromptSetActiveGroupThisFrame(system_config.prompt_groups.endGame, CreateVarString(10, 'LITERAL_STRING', getLangString('prompt_game_name')))
						if Citizen.InvokeNative(0xC92AC953F0A982AE, system_config.prompts.endGame) then
							-- pressed key associated with prompt
							system_config.game_data.playing = false
						end
					end
				end
			end
		end
	end
end)
