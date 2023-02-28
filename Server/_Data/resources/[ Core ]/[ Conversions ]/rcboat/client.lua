local RCBoat
local Driver
local Camera

RegisterNetEvent("rcboat:torpedoFired")
RegisterNetEvent("rcboat:torpedoReloaded")
RegisterNetEvent("rcboat:boatSunk")

function PrepareSoundset(soundsetName, p1)
	return Citizen.InvokeNative(0xD9130842D7226045, soundsetName, p1)
end

function PlaySoundFromPosition(audioName, x, y, z, audioRef, isNetwork, p6, p7, p8)
	return Citizen.InvokeNative(0xCCE219C922737BFA, audioName, x, y, z, audioRef, isNetwork, p6, p7, p8)
end

function RemoveSoundset(soundsetName)
	return Citizen.InvokeNative(0x531A78D6BF27014B, soundsetName)
end

function IsUsingKeyboard(padIndex)
	return Citizen.InvokeNative(0xA571D46727E2B718, padIndex)
end

function BlipAddForEntity(blipHash, entity)
	return Citizen.InvokeNative(0x23F74C2FDA6E7C61, blipHash, entity)
end

function LoadModel(model)
	if not IsModelInCdimage(model) then
		return false
	end

	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end

	return true
end

function CreateRCBoat()
	LoadModel(Config.RCBoatModel)

	local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(playerPed)
	local playerYaw = GetEntityHeading(playerPed)

	local r = math.rad(-playerYaw)
	local spawnPos = playerPos + vector3(5 * math.sin(r), 5 * math.cos(r), 0)

	local rcboat = CreateVehicle(Config.RCBoatModel, spawnPos, playerYaw, true, false, false, false)

	SetModelAsNoLongerNeeded(Config.RCBoatModel)

	if Config.RCBoatBlip then
		BlipAddForEntity(Config.RCBoatBlip, rcboat)
	end

	return rcboat
end

function CreateDriver()
	LoadModel(Config.DriverModel)

	local driver = CreatePedInsideVehicle(RCBoat, Config.DriverModel, -1, false, false, false)

	SetModelAsNoLongerNeeded(Config.DriverModel)

	SetEntityVisible(driver, false)
	SetEntityInvincible(driver, true)
	FreezeEntityPosition(driver, true)
	SetBlockingOfNonTemporaryEvents(driver, true)
	SetPedFleeAttributes(driver, 0, false)
	SetPedCanBeTargetted(driver, false)
	SetPedCanBeKnockedOffVehicle(driver, false)

	return driver
end

function DeployRCBoat()
	RCBoat = CreateRCBoat()
	Driver = CreateDriver()
end

function PlaySound(set, name, coords)
	Citizen.CreateThread(function()
		while not PrepareSoundset(set, 0) do
			Citizen.Wait(0)
		end

		PlaySoundFromPosition(name, coords, set, false, 0, true, 0)

		Citizen.Wait(2000)

		RemoveSoundset(set)
	end)
end

function StowRCBoat()
	DeleteVehicle(RCBoat)
	RCBoat = nil

	DeletePed(Driver)
	Driver = nil

	if Camera then
		ToggleCamera()
	end
end

function ToggleCamera()
	if Camera then
		RenderScriptCams(false, true, 500, true, true)
		DestroyCam(Camera)
		Camera = nil
	else
		Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		AttachCamToEntity(Camera, RCBoat, 0.0, -1.0, 0.4, true)
		RenderScriptCams(true, true, 500, true, true)
	end
end

function Accelerate(prompt)
	TaskVehicleTempAction(Driver, RCBoat, 9, 1)
end

function Deaccelerate(prompt)
	TaskVehicleTempAction(Driver, RCBoat, 6, 2500)
end

function Reverse(prompt)
	TaskVehicleTempAction(Driver, RCBoat, 28, 1)
end

function TurnLeft(prompt)
	if prompt.acceleratePrompt:isControlPressed() then
		TaskVehicleTempAction(Driver, RCBoat, 7, 1)
	elseif prompt.reversePrompt:isControlPressed() then
		TaskVehicleTempAction(Driver, RCBoat, 13, 1)
	else
		TaskVehicleTempAction(Driver, RCBoat, 4, 1)
	end
end

function TurnRight(prompt)
	if prompt.acceleratePrompt:isControlPressed() then
		TaskVehicleTempAction(Driver, RCBoat, 8, 1)
	elseif prompt.reversePrompt:isControlPressed() then
		TaskVehicleTempAction(Driver, RCBoat, 14, 1)
	else
		TaskVehicleTempAction(Driver, RCBoat, 5, 1)
	end
end

-- Two or more prompts that perform the same function
local AltPrompts = {}

function AltPrompts:new(prompts)
	self.__index = self
	local self = setmetatable({}, self)

	self.prompts = prompts or {}

	return self
end

function AltPrompts:addPrompt(prompt)
	table.insert(self.prompts, prompt)
end

function AltPrompts:setEnabled(toggle)
	for _, prompt in ipairs(self.prompts) do
		prompt:setEnabled(toggle)
	end
end

function AltPrompts:setText(text)
	for _, prompt in ipairs(self.prompts) do
		prompt:setText(text)
	end
end

local TorpedoPrompts = AltPrompts:new()

function FireTorpedo(prompt)
	TorpedoPrompts:setEnabled(false)

	local rcboatCoords = GetEntityCoords(RCBoat)
	local heading = GetEntityHeading(RCBoat)

	LoadModel(Config.TorpedoModel)

	local r = math.rad(-heading)
	local startCoords = rcboatCoords + vector3(2 * math.sin(r), 2 * math.cos(r), 0)

	local torpedo = CreateObjectNoOffset(Config.TorpedoModel, startCoords, true, false, true, false)

	SetModelAsNoLongerNeeded(Config.TorpedoModel)

	SetEntityHeading(torpedo, heading)

	local velocity = vector3(Config.TorpedoSpeed * math.sin(r), Config.TorpedoSpeed * math.cos(r), 0.0)
	SetEntityVelocity(torpedo, velocity)

	NetworkRegisterEntityAsNetworked(torpedo)

	if NetworkGetEntityIsNetworked(torpedo) then
		TriggerServerEvent("rcboat:torpedoFired", rcboatCoords, ObjToNet(torpedo))
	end

	Citizen.CreateThread(function()
		local text = prompt:getText()

		while torpedo do
			local torpedoCoords = GetEntityCoords(torpedo)
			local distance = #(torpedoCoords - startCoords)
			local range = math.floor(Config.TorpedoRange - distance)

			if HasEntityCollidedWithAnything(torpedo) or range <= 0 then
				AddExplosion(torpedoCoords - vector3(0, 0, 0.5), 23, Config.TorpedoDamage, true, false, 1.0)
				DeleteObject(torpedo)
				torpedo = nil
			else
				SetEntityVelocity(torpedo, velocity)

				TorpedoPrompts:setText(text .. " (" .. range .. "m)")
			end

			Citizen.Wait(0)
		end

		for secs = Config.TorpedoCooldown, 1, -1 do
			TorpedoPrompts:setText(text .. " (" .. secs .. "s)")
			Citizen.Wait(1000)
		end

		TriggerServerEvent("rcboat:torpedoReloaded", GetEntityCoords(RCBoat))

		TorpedoPrompts:setText(text)
		TorpedoPrompts:setEnabled(true)
	end)
end

function ExplodeRCBoat()
	AddExplosion(GetEntityCoords(RCBoat) - vector3(0, 0, 0.5), 23, Config.SelfDestructDamage, true, false, 1.0)
	SetEntityHealth(RCBoat, 0)
end

local SelfDestructPrompts = AltPrompts:new()

function SelfDestruct(prompt)
	SelfDestructPrompts:setEnabled(false)

	Citizen.CreateThread(function()
		local text = prompt:getText()

		for secs = Config.SelfDestructTime, 1, -1 do
			SelfDestructPrompts:setText("~COLOR_RED~" .. text .. " in " .. secs .. "s")
			Citizen.Wait(1000)
		end

		ExplodeRCBoat()

		SelfDestructPrompts:setText(text)
		SelfDestructPrompts:setEnabled(true)
	end)
end

-- Primary controls
local RCBoatPrompts = UipromptGroup:new("RC Boat")

local AcceleratePrompt = Uiprompt:new(`INPUT_FRONTEND_UP`, "Accelerate", RCBoatPrompts)
AcceleratePrompt:setOnControlPressed(Accelerate)
AcceleratePrompt:setOnControlJustReleased(Deaccelerate)

local ReversePrompt = Uiprompt:new(`INPUT_FRONTEND_DOWN`, "Reverse", RCBoatPrompts)
ReversePrompt:setOnControlPressed(Reverse)
ReversePrompt:setOnControlJustReleased(Deaccelerate)

local TurnLeftPrompt = Uiprompt:new(`INPUT_FRONTEND_LEFT`, "Turn Left", RCBoatPrompts)
TurnLeftPrompt:setOnControlPressed(TurnLeft)
TurnLeftPrompt.acceleratePrompt = AcceleratePrompt
TurnLeftPrompt.reversePrompt = ReversePrompt

local TurnRightPrompt = Uiprompt:new(`INPUT_FRONTEND_RIGHT`, "Turn Right", RCBoatPrompts)
TurnRightPrompt:setOnControlPressed(TurnRight)
TurnRightPrompt.acceleratePrompt = AcceleratePrompt
TurnRightPrompt.reversePrompt = ReversePrompt

local ToggleCameraPrompt = Uiprompt:new(`INPUT_FRONTEND_ACCEPT`, "Toggle Camera", RCBoatPrompts)
ToggleCameraPrompt:setHoldMode(true)
ToggleCameraPrompt:setOnHoldModeJustCompleted(ToggleCamera)

local TorpedoPrompt = Uiprompt:new(`INPUT_GAME_MENU_EXTRA_OPTION`, "Fire Torpedo", RCBoatPrompts)
TorpedoPrompt:setOnControlJustReleased(FireTorpedo)
TorpedoPrompts:addPrompt(TorpedoPrompt)

local SelfDestructPrompt = Uiprompt:new(`INPUT_FRONTEND_CANCEL`, "Self-destruct", RCBoatPrompts)
SelfDestructPrompt:setHoldMode(true)
SelfDestructPrompt:setOnHoldModeJustCompleted(SelfDestruct)
SelfDestructPrompts:addPrompt(SelfDestructPrompt)

-- Alternate controls for controllers that avoids left D-pad
local AltRCBoatPrompts = UipromptGroup:new("RC Boat")

local AltAcceleratePrompt = Uiprompt:new(`INPUT_FRONTEND_UP`, "Accelerate", AltRCBoatPrompts)
AltAcceleratePrompt:setOnControlPressed(Accelerate)
AltAcceleratePrompt:setOnControlJustReleased(Deaccelerate)

local AltReversePrompt = Uiprompt:new(`INPUT_FRONTEND_DOWN`, "Reverse", AltRCBoatPrompts)
AltReversePrompt:setOnControlPressed(Reverse)
AltReversePrompt:setOnControlJustReleased(Deaccelerate)

local AltTurnLeftPrompt = Uiprompt:new(`INPUT_FRONTEND_LB`, "Turn Left", AltRCBoatPrompts)
AltTurnLeftPrompt:setOnControlPressed(TurnLeft)
AltTurnLeftPrompt.acceleratePrompt = AltAcceleratePrompt
AltTurnLeftPrompt.reversePrompt = AltReversePrompt

local AltTurnRightPrompt = Uiprompt:new(`INPUT_FRONTEND_RB`, "Turn Right", AltRCBoatPrompts)
AltTurnRightPrompt:setOnControlPressed(TurnRight)
AltTurnRightPrompt.acceleratePrompt = AltAcceleratePrompt
AltTurnRightPrompt.reversePrompt = AltReversePrompt

local AltToggleCameraPrompt = Uiprompt:new(`INPUT_FRONTEND_ACCEPT`, "Toggle Camera", AltRCBoatPrompts)
AltToggleCameraPrompt:setHoldMode(true)
AltToggleCameraPrompt:setOnHoldModeJustCompleted(ToggleCamera)

local AltTorpedoPrompt = Uiprompt:new(`INPUT_GAME_MENU_EXTRA_OPTION`, "Fire Torpedo", AltRCBoatPrompts)
AltTorpedoPrompt:setOnControlJustReleased(FireTorpedo)
TorpedoPrompts:addPrompt(AltTorpedoPrompt)

local AltSelfDestructPrompt = Uiprompt:new(`INPUT_FRONTEND_CANCEL`, "Self-destruct", AltRCBoatPrompts)
AltSelfDestructPrompt:setHoldMode(true)
AltSelfDestructPrompt:setOnHoldModeJustCompleted(SelfDestruct)
SelfDestructPrompts:addPrompt(AltSelfDestructPrompt)

local RCBoatPromptGroups = AltPrompts:new{RCBoatPrompts, AltRCBoatPrompts}

RegisterCommand("rcboat", function(source, args, raw)
	if RCBoat then
		StowRCBoat()
	else
		DeployRCBoat()
	end
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() == resourceName and RCBoat then
		StowRCBoat()
	end
end)

AddEventHandler("rcboat:torpedoFired", function(rcBoatCoords, torpedoNetId)
	PlaySound("RCKPT1_Sounds", "TORPEDO_FIRE", rcBoatCoords)

	if NetworkDoesNetworkIdExist(torpedoNetId) then
		UseParticleFxAsset("scr_crackpot")
		StartParticleFxLoopedOnEntity("scr_crackpot_torpedo_spray", NetToObj(torpedoNetId), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, false, false, false)
	end
end)

AddEventHandler("rcboat:torpedoReloaded", function(rcBoatCoords)
	PlaySound("RCKPT1_Sounds", "BOAT_RELOAD", rcBoatCoords)
end)

AddEventHandler("rcboat:boatSunk", function(rcBoatCoords)
	PlaySound("RCKPT1_Sounds", "BOAT_SINKS", rcBoatCoords)
end)

Citizen.CreateThread(function()
	TriggerEvent("chat:addSuggestion", "/rcboat", "Deploy or stow a remote-controllable boat")
end)

Citizen.CreateThread(function()
	while true do
		if RCBoat then
			if IsUsingKeyboard(0) then
				RCBoatPrompts:handleEvents()
			else
				AltRCBoatPrompts:handleEvents()
			end

			if Camera then
				if IsControlJustPressed(0, `INPUT_LOOK_BEHIND`) then
					AttachCamToEntity(Camera, RCBoat, 0.0, 1.0, 0.4, true)
				end

				if IsControlJustReleased(0, `INPUT_LOOK_BEHIND`) then
					AttachCamToEntity(Camera, RCBoat, 0.0, -1.0, 0.4, true)
				end

				if IsControlPressed(0, `INPUT_LOOK_BEHIND`) then
					SetCamRot(Camera, GetEntityRotation(RCBoat) + vector3(0, 0, 180))
				else
					SetCamRot(Camera, GetEntityRotation(RCBoat))
				end
			end
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	local cautionShown = false

	while true do
		if RCBoat then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local rcBoatCoords = GetEntityCoords(RCBoat)
			local distance = #(playerCoords - rcBoatCoords)
			local rcBoatHealth = GetEntityHealth(RCBoat)

			if not DoesEntityExist(Driver) then
				Driver = CreateDriver()
			elseif GetPedInVehicleSeat(RCBoat, -1) ~= Driver then
				DeletePed(Driver)
				Driver = CreateDriver()
			end

			if rcBoatHealth == 0 then
				TriggerServerEvent("rcboat:boatSunk", rcBoatCoords)
				StowRCBoat()
			elseif IsPedDeadOrDying(playerPed) or distance > Config.ControlRange then
				ExplodeRCBoat()
			end

			local colour

			if distance > Config.ControlRange - Config.WarningRange then
				colour = "~COLOR_RED~"
			elseif distance > Config.ControlRange - Config.CautionRange then
				colour = "~COLOR_YELLOW~"

				if not cautionShown then
					exports.uifeed:showObjective(Config.RangeNotification, 5000)
					cautionShown = true
				end
			else
				colour = "~COLOR_WHITE~"

				cautionShown = false
			end

			RCBoatPromptGroups:setText("RC Boat - " .. rcBoatHealth .. " HP (" .. colour .. math.floor(distance) .. "m~COLOR_WHITE~)")
		end

		Citizen.Wait(500)
	end
end)
