local CurrentEmote
local SharedEmoteRequest

RegisterNetEvent("emotes:requestSharedEmote")
RegisterNetEvent("emotes:rejectSharedEmote")
RegisterNetEvent("emotes:acceptSharedEmote")
RegisterNetEvent("emotes:stopSharedEmote")

function GetCompatibleAnim(ped, anim)
	if anim and anim.variants then
		for _, variant in ipairs(anim.variants) do
			if variant.isCompatible(ped) then
				return variant
			end
		end
	else
		return anim
	end
end

function PlayAnimation(ped, anim)
	anim = GetCompatibleAnim(ped, anim)

	if not DoesAnimDictExist(anim.dict) then
		print("Invalid animation dictionary: " .. anim.dict)
		return
	end

	RequestAnimDict(anim.dict)

	while not HasAnimDictLoaded(anim.dict) do
		Wait(0)
	end

	if anim.flag == 1 then
		FreezeEntityPosition(ped, true)
	end

	TaskPlayAnim(ped, anim.dict, anim.name, 1.0, 1.0, -1, anim.flag, 0.0, false, false, false, "", false)

	RemoveAnimDict(anim.dict)
end

function StopAnimation(ped, anim)
	anim = GetCompatibleAnim(ped, anim)

	StopAnimTask(ped, anim.dict, anim.name, 1.0)

	if anim.flag == 1 then
		FreezeEntityPosition(ped, false)
	end
end

function IsPlayingAnimation(ped, anim)
	anim = GetCompatibleAnim(ped, anim)

	return IsEntityPlayingAnim(ped, anim.dict, anim.name, anim.flag)
end

function CreateProp()
	CurrentEmote.prop.handle = CreateObjectNoOffset(GetHashKey(CurrentEmote.prop.model), 0.0, 0.0, 0.0, true, false, false, false)
end

function AttachProp(ped)
	local handle = CurrentEmote.prop.handle
	local bone = CurrentEmote.prop.bone
	local position = CurrentEmote.prop.position
	local rotation = CurrentEmote.prop.rotation

	if type(bone) == "string" then
		bone = GetEntityBoneIndexByName(ped, bone)
	end

	AttachEntityToEntity(handle, ped, bone, position, rotation, false, false, true, false, 0, true, false, false)
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

function GetClosestPedInRange()
	local myPed = PlayerPedId()
	local myPos = GetEntityCoords(myPed)

	local minDist, closestPed

	for ped in EnumeratePeds() do
		if myPed ~= ped then
			local theirPos = GetEntityCoords(ped)
			local distance = #(myPos - theirPos)

			if distance < Config.SharedEmoteRange and (not minDist or distance < minDist) then
				minDist = distance
				closestPed = ped
			end
		end
	end

	return closestPed
end

function GetPlayerFromPed(ped)
	for _, player in ipairs(GetActivePlayers()) do
		if GetPlayerPed(player) == ped then
			return player
		end
	end
end

function GetPlayerServerIdFromPed(ped)
	return GetPlayerServerId(GetPlayerFromPed(ped))
end

function GetPlayerPedFromServerId(serverId)
	return GetPlayerPed(GetPlayerFromServerId(serverId))
end

function GetPlayerNameFromServerId(serverId)
	return GetPlayerName(GetPlayerFromServerId(serverId))
end

function TeleportToPartner(ped, partner, emote)
	local partnerPos = GetEntityCoords(partner)
	local partnerHeading = GetEntityHeading(partner)

	local r = math.rad(partnerHeading)
	local cosr = math.cos(r)
	local sinr = math.sin(r)

	local x = emote.partner.offset.x * cosr - emote.partner.offset.y * sinr + partnerPos.x
	local y = emote.partner.offset.y * cosr + emote.partner.offset.x * sinr + partnerPos.y
	local z = emote.partner.offset.z + partnerPos.z
	local h = emote.partner.offset.w + partnerHeading

	SetEntityCoordsNoOffset(ped, x, y, z)
	SetEntityHeading(ped, h)
end

function DrawText2D(x, y, text)
	SetTextScale(0.35, 0.35)
	SetTextColor(255, 255, 255, 255)
	SetTextCentre(true)
	SetTextDropshadow(1, 0, 0, 0, 200)
	SetTextFontForCurrentCommand(0)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

function DrawText3D(x, y, z, text)
	local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
	SetTextScale(0.35, 0.35)
	SetTextFontForCurrentCommand(1)
	SetTextColor(255, 255, 255, 223)
	SetTextCentre(1)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), screenX, screenY)
end

function ShowNotification(text, duration)
	local endTime = GetSystemTime() + (duration or 5000)

	CreateThread(function()
		while GetSystemTime() < endTime do
			DrawText2D(0.5, 0.8, text)
			Wait(0)
		end
	end)
end

function SendSharedEmoteRequest(emote)
	local closestPed = GetClosestPedInRange()

	if not closestPed then
		ShowNotification("Nobody in range")
		return
	end

	emote.partner.ped = closestPed

	if IsPedAPlayer(closestPed) then
		TriggerServerEvent("emotes:requestSharedEmote", GetPlayerServerIdFromPed(closestPed), emote)
	else
		NetworkRequestControlOfEntity(closestPed)
		TeleportToPartner(closestPed, PlayerPedId(), emote)
		PlayAnimation(closestPed, emote.partner.animation)
		CurrentEmote = emote
	end
end

function AcceptSharedEmoteRequest()
	TriggerServerEvent("emotes:acceptSharedEmote", SharedEmoteRequest.player, SharedEmoteRequest.emote)

	local partner = GetPlayerPedFromServerId(SharedEmoteRequest.player)

	TeleportToPartner(PlayerPedId(), partner, SharedEmoteRequest.emote)

	local emote = SharedEmoteRequest.emote.partner
	emote.name = SharedEmoteRequest.emote.name
	emote.partner = {ped = partner}

	SharedEmoteRequest = nil

	CurrentEmote = emote
end

function RejectSharedEmoteRequest()
	TriggerServerEvent("emotes:rejectSharedEmote", SharedEmoteRequest.player, SharedEmoteRequest.emote)
	SharedEmoteRequest = nil
end

function StartUsingEmote(name)
	if CurrentEmote then
		StopUsingEmote()
	end

	local emote = Config.Emotes[name]

	if not emote then
		ShowNotification("Invalid emote: " .. name)
		return
	end

	if not emote.name then
		emote.name = name
	end

	if emote.partner then
		SendSharedEmoteRequest(emote)
	else
		CurrentEmote = emote
	end
end

function StopUsingEmote()
	if not CurrentEmote then
		return
	end

	local emote = CurrentEmote
	CurrentEmote = nil

	local ped = PlayerPedId()

	if emote.prop then
		DetachEntity(emote.prop.handle)
		DeleteObject(emote.prop.handle)
	end

	if emote.animation then
		StopAnimation(ped, emote.animation)
	end

	if emote.partner then
		if IsPedAPlayer(emote.partner.ped) then
			TriggerServerEvent("emotes:stopSharedEmote", GetPlayerServerIdFromPed(emote.partner.ped), emote)
		else
			StopAnimation(emote.partner.ped, emote.partner.animation)
		end
	end
end

function DrawSharedEmoteRequestText()
	local player = GetPlayerFromServerId(SharedEmoteRequest.player)
	local pos = GetEntityCoords(GetPlayerPed(player))
	DrawText3D(pos.x, pos.y, pos.z, GetPlayerName(player) .. " wants to use " .. SharedEmoteRequest.emote.name .. ". Press [E] to accept, or [R] to reject. Expires in " .. math.floor((SharedEmoteRequest.expires - GetSystemTime()) / 10000) .. "s...")
end

function EmoteCommand(source, args, raw)
	if args[1] then
		StartUsingEmote(args[1])
	else
		StopUsingEmote()
	end
end

function GetEmotes()
	local soloEmotes = {}
	local sharedEmotes = {}
	local propEmotes = {}

	for emote, info in pairs(Config.Emotes) do
		if info.type == "solo" then
			table.insert(soloEmotes, {name = info.name, command = emote})
		elseif info.type == "shared" then
			table.insert(sharedEmotes, {name = info.name, command = emote})
		elseif info.type == "prop" then
			table.insert(propEmotes, {name = info.name, command = emote})
		end
	end

	table.sort(soloEmotes, function(a, b) return a.name < b.name end)
	table.sort(sharedEmotes, function(a, b) return a.name < b.name end)
	table.sort(propEmotes, function(a, b) return a.name < b.name end)

	return {
		{name = "Solo Emotes", emotes = soloEmotes},
		{name = "Shared Emotes", emotes = sharedEmotes},
		{name = "Prop Emotes", emotes = propEmotes},
	}
end

function GetEmotesAsJson()
	return json.encode(GetEmotes())
end

exports("getEmotes", GetEmotes)
exports("getEmotesAsJson", GetEmotesAsJson)

RegisterCommand("emote", EmoteCommand)
RegisterCommand("e", EmoteCommand)

AddEventHandler("emotes:requestSharedEmote", function(player, emote)
	SharedEmoteRequest = {player = player, emote = emote, expires = GetSystemTime() + Config.SharedEmoteTimeout}
end)

AddEventHandler("emotes:rejectSharedEmote", function(player, emote)
	ShowNotification(GetPlayerNameFromServerId(player) .. " rejected your request to use " .. emote.name)
end)

AddEventHandler("emotes:acceptSharedEmote", function(player, emote)
	CurrentEmote = emote
end)

AddEventHandler("emotes:stopSharedEmote", function(player, emote)
	StopUsingEmote()
end)

AddEventHandler("onResourceStop", function(resource)
	if GetCurrentResourceName() ~= resource then
		return
	end

	if CurrentEmote then
		StopUsingEmote()
	end
end)

CreateThread(function()
	TriggerEvent("chat:addSuggestion", "/emote", "Use an emote", {
		{name = "emote", help = "Emote to use, or omit to cancel the current emote"}
	})
	TriggerEvent("chat:addSuggestion", "/e", "Use an emote", {
		{name = "emote", help = "Emote to use, or omit to cancel the current emote"}
	})

	while true do
		if SharedEmoteRequest then
			if SharedEmoteRequest.expires <= GetSystemTime() then
				RejectSharedEmoteRequest()
			else
				DrawSharedEmoteRequestText()

				DisableControlAction(0, Config.SharedEmoteAcceptControl, true)
				DisableControlAction(0, Config.SharedEmoteRejectControl, true)

				if IsDisabledControlJustPressed(0, Config.SharedEmoteAcceptControl) then
					AcceptSharedEmoteRequest()
				elseif IsDisabledControlJustPressed(0, Config.SharedEmoteRejectControl) then
					RejectSharedEmoteRequest()
				end
			end
		end

		if CurrentEmote then
			local ped = PlayerPedId()
			local anim = CurrentEmote.animation

			if anim and not IsPlayingAnimation(ped, anim) then
				PlayAnimation(ped, anim)
			end

			if CurrentEmote.prop then
				if not (CurrentEmote.prop.handle and DoesEntityExist(CurrentEmote.prop.handle)) then
					CreateProp()
					AttachProp(ped)
				elseif not IsEntityAttachedToEntity(CurrentEmote.prop.handle, ped) then
					AttachProp(ped)
				end
			end
		end

		Wait(0)
	end
end)
