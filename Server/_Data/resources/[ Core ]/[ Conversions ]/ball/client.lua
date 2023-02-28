local EquippedBall
local CurrentAnimation

local ActiveProjectiles = {}

RegisterNetEvent("ball:equipBall")
RegisterNetEvent("ball:unequipBall")
RegisterNetEvent("ball:hit")

function LoadModel(model)
	if not IsModelInCdimage(model) then
		print("Invalid model: " .. model)
		return false
	end

	RequestModel(model)

	while not HasModelLoaded(model) do
		Wait(0)
	end

	return true
end

function AttachBall(ball, ped)
	AttachEntityToEntity(ball, ped,
		GetEntityBoneIndexByName(ped, "SKEL_R_Finger33"),
		0.02, -0.02, -0.02,
		0.0, 180.0, 0.0,
		false,
		false,
		false,
		false,
		0,
		true,
		false,
		false)
end

function EquipBall(name, amount)
	if EquippedBall then
		UnequipBall()
	end

	local ballType = Config.Balls[name]

	if not ballType then
		return
	end

	local ped = PlayerPedId()

	if not LoadModel(ballType.model) then
		return
	end

	local ball = CreateObject(ballType.model, 0.0, 0.0, 0.0, true, false, true, false, false)

	SetEntityLodDist(ball, 0xFFFF)

	AttachBall(ball, ped)

	EquippedBall = {
		name = name,
		handle = ball,
		breakOnImpact = ballType.breakOnImpact,
		amount = amount
	}

	SetPlayerLockon(PlayerId(), false)
end

function UnequipBall()
	if not EquippedBall then
		return
	end

	DeleteObject(EquippedBall.handle)
	EquippedBall = nil

	if CurrentAnimation then
		StopAnimTask(PlayerPedId(), CurrentAnimation.dict, CurrentAnimation.name, 1.0)
	end

	SetPlayerLockon(PlayerId(), true)
end

function IsPlayingAnimation(ped, anim)
	return IsEntityPlayingAnim(ped, anim.dict, anim.name, anim.flag)
end

function PlayAnimation(ped, anim)
	if not DoesAnimDictExist(anim.dict) then
		print("Invalid animation dictionry: " .. anim.dict)
		return
	end

	RequestAnimDict(anim.dict)

	while not HasAnimDictLoaded(anim.dict) do
		Wait(0)
	end

	TaskPlayAnim(ped, anim.dict, anim.name, 4.0, 4.0, -1, anim.flag, 0, false, false, false, "", false)

	RemoveAnimDict(anim.dict)
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

function EnumerateEntities(firstFunc, nextFunc, endFunc)
	return coroutine.wrap(function()
		local iter, id = firstFunc()

		if not id or id == 0 then
			endFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = endFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = nextFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		endFunc(iter)
	end)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetBallNames()
	local names = {}

	for name, _ in pairs(Config.Balls) do
		table.insert(names, name)
	end

	table.sort(names)

	return names
end

function RequestControl(entity, func)
	NetworkRequestControlOfEntity(entity)

	local timeWaited = 0

	while not NetworkHasControlOfEntity(entity) and timeWaited <= 500 do
		Wait(1)
		timeWaited = timeWaited + 1
	end

	if func then
		func(entity)
	end
end

function ApplyBallHit(ped, velocity)
	SetPedToRagdoll(ped, 3000, 3000, 0, 0, 0, 0)
	SetEntityVelocity(ped, velocity / 6.0)
end

function GetPlayerFromPed(ped)
	for _, player in ipairs(GetActivePlayers()) do
		if GetPlayerPed(player) == ped then
			return player
		end
	end
end

function IsPvpEnabled()
	return GetRelationshipBetweenGroups(`PLAYER`, `PLAYER`) == 5
end

function CanThrowBall(ped)
	return not (IsPedRagdoll(ped) or IsPedClimbing(ped))
end

exports("equipBall", EquipBall)
exports("unequipBall", UnequipBall)
exports("getBallNames", GetBallNames)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then
		return
	end

	if EquippedBall then
		UnequipBall()
	end
end)

AddEventHandler("ball:equipBall", EquipBall)
AddEventHandler("ball:unequipBall", UnequipBall)

AddEventHandler("ball:hit", function(ped, velocity)
	if ped == -1 then
		if IsPvpEnabled() then
			ApplyBallHit(PlayerPedId(), velocity)
		end
	else
		ApplyBallHit(NetToPed(ped), velocity)
	end
end)

CreateThread(function()
	while true do
		if EquippedBall then
			DisableControlAction(0, `INPUT_MELEE_ATTACK`, true)
			DisableControlAction(0, `INPUT_MELEE_GRAPPLE`, true)
			DisableControlAction(0, `INPUT_MELEE_GRAPPLE_CHOKE`, true)
			DisableControlAction(0, `INPUT_INSPECT_ZOOM`, true)
			DisableControlAction(0, `INPUT_INTERACT_LOCKON`, true)
			DisableControlAction(0, `INPUT_CONTEXT_LT`, true)

			local _, wep = GetCurrentPedWeapon(ped)
			if wep ~= `WEAPON_UNARMED` then
				SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true, 0, false, false)
			end

			if IsControlJustPressed(0, `INPUT_OPEN_WHEEL_MENU`) or IsControlJustPressed(0, `INPUT_TOGGLE_HOLSTER`) or IsControlJustPressed(0, `INPUT_TWIRL_PISTOL`) then
				UnequipBall()
			end
		end

		Wait(0)
	end
end)

CreateThread(function()
	local timeStartedPressing

	while true do
		if EquippedBall then
			local ped = PlayerPedId()

			-- Re-attach ball if it becomes detached or ped changes
			if not IsEntityAttachedToEntity(EquippedBall.handle, ped) then
				AttachBall(EquippedBall.handle, ped)
			end

			-- Restart animation if interrupted
			if CurrentAnimation then
				if not IsPlayingAnimation(ped, CurrentAnimation) then
					PlayAnimation(ped, CurrentAnimation)
				end
			end

			if IsControlPressed(0, `INPUT_AIM`) and CanThrowBall(ped) then
				-- Determine how long the attack button has been pressed
				local timePressed

				if timeStartedPressing then
					timePressed = GetSystemTime() - timeStartedPressing
				else
					timePressed = 0
				end

				-- Determine Z angle of throw
				local rot = GetGameplayCamRot(2)
				local zangle

				if rot.x < -20.0 then
					if timePressed > 1000 then
						CurrentAnimation = Config.Animations.aimingFullLow
					else
						CurrentAnimation = Config.Animations.aimingLow
					end

					zangle = 5.0
				elseif rot.x < 20.0 then
					if timePressed > 1000 then
						CurrentAnimation = Config.Animations.aimingFullMed
					else
						CurrentAnimation = Config.Animations.aimingMed
					end
					
					zangle = 10.0
				else
					if timePressed > 1000 then
						CurrentAnimation = Config.Animations.aimingFullHigh
					else
						CurrentAnimation = Config.Animations.aimingHigh
					end

					zangle = 15.0
				end

				if IsControlPressed(0, `INPUT_ATTACK`) then
					if not timeStartedPressing then
						timeStartedPressing = GetSystemTime()
					end
				elseif IsControlJustReleased(0, `INPUT_ATTACK`) then
					-- Determine intensity of throw based on length of button press
					local velocity
					local throwingAnim

					if timePressed > 1000 then
						velocity = Config.BaseVelocity * 5
						throwingAnim = Config.Animations.throwingHigh
					elseif timePressed > 200 then
						velocity = Config.BaseVelocity * 3
						throwingAnim = Config.Animations.throwingMed
					else
						velocity = Config.BaseVelocity
						throwingAnim = Config.Animations.throwingLow
					end

					timeStartedPressing = nil

					-- Play throwing animation
					ClearPedTasksImmediately(ped)
					SetEntityHeading(ped, rot.z)
					PlayAnimation(ped, throwingAnim)

					Wait(500)

					-- Calculate trajectory
					local r = math.rad(-rot.z)
					local vx = velocity * math.sin(r)
					local vy = velocity * math.cos(r)
					local vz = rot.x + zangle

					-- Throw ball
					ClearPedTasks(ped)
					DetachEntity(EquippedBall.handle)
					SetEntityCoords(EquippedBall.handle, GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.2))
					SetEntityVelocity(EquippedBall.handle, vx, vy, vz)
					ActiveProjectiles[EquippedBall.handle] = {
						breakOnImpact = EquippedBall.breakOnImpact
					}
					TriggerEvent("ball:thrown", EquippedBall)

					-- Clean up
					local model = GetEntityModel(EquippedBall.handle)
					SetObjectAsNoLongerNeeded(EquippedBall.handle)
					EquippedBall.handle = 0

					-- Spawn a new ball
					if EquippedBall.amount then
						if EquippedBall.amount > 1 then
							EquipBall(EquippedBall.name, EquippedBall.amount - 1)
						else
							UnequipBall()
						end
					else
						EquipBall(EquippedBall.name)
					end
				end
			else
				timeStartedPressing = nil

				if IsPedWalking(ped) then
					CurrentAnimation = Config.Animations.idleWalking
				else
					CurrentAnimation = Config.Animations.idle
				end
			end
		end

		Wait(0)
	end
end)

CreateThread(function()
	while true do
		for handle, data in pairs(ActiveProjectiles) do
			if HasEntityCollidedWithAnything(handle) then
				local velocity = GetEntityVelocity(handle)

				for ped in EnumeratePeds() do
					if IsEntityTouchingEntity(handle, ped) then
						if IsPedAPlayer(ped) then
							if IsPvpEnabled() then
								TriggerServerEvent("ball:hit", GetPlayerServerId(GetPlayerFromPed(ped)), -1, velocity)
							end
						elseif NetworkGetEntityIsNetworked(ped) then
							if NetworkHasControlOfEntity(ped) then
								ApplyBallHit(ped, velocity)
							else
								TriggerServerEvent("ball:hit", -1, PedToNet(ped), velocity)
							end
						end
					end
				end

				if data.breakOnImpact then
					RequestControl(handle, DeleteObject)
				elseif Config.ProjectileLifetime then
					local ball = handle
					SetTimeout(Config.ProjectileLifetime, function()
						RequestControl(ball, DeleteObject)
					end)
				end

				ActiveProjectiles[handle] = nil
			end
		end

		Wait(0)
	end
end)

CreateThread(function()
	TriggerEvent("chat:addSuggestion", "/ball", "Equip/Unequip a throwable ball", {
		{name = "type", help = table.concat(GetBallNames(), ", ")}
	})
end)

if Config.EnableCommand then
	RegisterCommand("ball", function(source, args, raw)
		if #args < 1 then
			if EquippedBall then
				UnequipBall()
			else
				EquipBall(Config.DefaultBall)
			end
		else
			EquipBall(args[1])
		end
	end)
end
