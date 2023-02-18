local UiIsOpen = false

local CurrentInstrument
local NotesPlaying = 0
local ActivelyPlayingTimer = 0

local Recording = {
	active = false,
	startTime = 0,
	length = 0,
	events = {},
	buffer = {},
	playing = false
}

RegisterNetEvent('instruments:noteOn')
RegisterNetEvent('instruments:noteOff')
RegisterNetEvent('instruments:showUi')
RegisterNetEvent('instruments:hideUi')
RegisterNetEvent('instruemnts:toggleUi')

function GetNearbyObjects(coords)
	local itemset = CreateItemset(true)
	local size = Citizen.InvokeNative(0x59B57C4B06531E1E, coords, Config.MaxInteractDistance, itemset, 3, Citizen.ResultAsInteger())

	local objects = {}

	if size > 0 then
		for i = 0, size - 1 do
			table.insert(objects, GetIndexedItemInItemset(i, itemset))
		end
	end

	if IsItemsetValid(itemset) then
		DestroyItemset(itemset)
	end

	return objects
end

function IsInstrument(object, info)
	local model = GetEntityModel(object)

	for _, instrumentModel in ipairs(info.models) do
		if model == GetHashKey(instrumentModel) then
			return true
		end
	end

	return false
end

function GetClosestInstrumentObject(ped, info)
	local pos = GetEntityCoords(ped)

	local minDist, closest

	for _, object in ipairs(GetNearbyObjects(pos)) do
		if IsInstrument(object, info) then
			local instrumentPos = GetEntityCoords(object)
			local distance = #(pos - instrumentPos)

			if not minDist or distance < minDist then
				minDist = distance
				closest = object
			end
		end
	end

	return closest
end

function AttachToInstrument(ped, info)
	local object = GetClosestInstrumentObject(ped, info)

	if object then
		AttachEntityToEntity(ped, object, 0, info.position, info.rotation, false, false, true, false, 0, true, false, false)
		return true
	else
		return false
	end
end

function DetachFromInstrument(ped)
	DetachEntity(ped)
end

function StartPlayingInstrument(instrument)
	if CurrentInstrument then
		StopPlayingInstrument()
	end

	CurrentInstrument = Config.Instruments[instrument]

	if not CurrentInstrument then
		return
	end

	local ped = PlayerPedId()

	SendNUIMessage({
		type = 'setInstrumentPreset',
		instrument = CurrentInstrument.midiInstrument,
	})

	if CurrentInstrument.attachTo and not AttachToInstrument(ped, CurrentInstrument.attachTo) then
		CurrentInstrument = nil
		return
	end

	ActivelyPlayingTimer = 0
	NotesPlaying = 0
end

function StopPlayingInstrument()
	if not CurrentInstrument then
		return
	end

	local instrument = CurrentInstrument
	CurrentInstrument = nil

	local ped = PlayerPedId()

	if instrument.attachTo then
		DetachFromInstrument(ped)
	end

	if instrument.props then
		for _, prop in ipairs(instrument.props) do
			if prop.handle then
				DeleteObject(prop.handle)
			end
		end
	end

	local anim = GetAnimation(ped, instrument)

	StopAnimTask(ped, anim.dict, anim.name)
end

function ShowUi()
	SendNUIMessage({
		type = 'showUi'
	})
	SetNuiFocus(true, true)
	UiIsOpen = true
end

function HideUi()
	SendNUIMessage({
		type = 'hideUi'
	})
	SetNuiFocus(false, false)
	UiIsOpen = false
end

function ToggleUi()
	if UiIsOpen then
		HideUi()
	else
		ShowUi()
	end
end

function IsInSameRoom(entity1, entity2)
	local interior1 = GetInteriorFromEntity(entity1)
	local interior2 = GetInteriorFromEntity(entity2)

	if interior1 ~= interior2 then
		return false
	end

	local roomHash1 = GetRoomKeyFromEntity(entity1)
	local roomHash2 = GetRoomKeyFromEntity(entity2)

	if roomHash1 ~= roomHash2 then
		return false
	end

	return true
end

function GetListenerInfo()
	local cam = GetRenderingCam()
	local ped = PlayerPedId()

	local listenerCoords

	if cam == -1 then
		if IsPedDeadOrDying(ped) then
			listenerCoords = GetGameplayCamCoord()
		else
			listenerCoords = GetEntityCoords(ped)
		end
	else
		listenerCoords = GetCamCoord(cam)
	end

	return ped, listenerCoords
end

function IsActivelyPlaying()
	local isPlaying = GetSystemTime() < ActivelyPlayingTimer

	if not isPlaying and NotesPlaying > 0 then
		NotesPlaying = 0
	end

	return isPlaying
end

function GetAnimation(ped, instrument)
	local anim

	if IsActivelyPlaying() then
		anim = instrument.activeAnimation
	else
		anim = instrument.inactiveAnimation
	end

	local isMale = IsPedMale(ped)

	if anim.female and not isMale then
		return anim.female
	elseif anim.male and isMale then
		return anim.male
	else
		return anim
	end
end

function PlayAnimation(ped, anim)
	if not DoesAnimDictExist(anim.dict) then
		return
	end

	RequestAnimDict(anim.dict)

	while not HasAnimDictLoaded(anim.dict) do
		Wait(0)
	end

	TaskPlayAnim(ped, anim.dict, anim.name, 1.0, 1.0, -1, anim.flag, 0, false, false, false, '', false)

	RemoveAnimDict(anim.dict)
end

function GetInstrumentList()
	local instruments = {}

	for instrument, _ in pairs(Config.Instruments) do
		table.insert(instruments, instrument)
	end

	table.sort(instruments)

	return instruments
end

function RecordNoteOn(channel, note, octave)
	local lastEvent = Recording.buffer[#Recording.buffer]

	if lastEvent then
		RecordWait(GetSystemTime() - Recording.startTime - lastEvent.time)
	end

	table.insert(Recording.buffer, {
		type = 'noteOn',
		time = GetSystemTime() - Recording.startTime,
		channel = channel,
		note = note,
		octave = octave
	})
end

function RecordNoteOff(channel, note, octave)
	local lastEvent = Recording.buffer[#Recording.buffer]

	if lastEvent then
		RecordWait(GetSystemTime() - Recording.startTime - lastEvent.time)
	end

	table.insert(Recording.buffer, {
		type = 'noteOff',
		time = GetSystemTime() - Recording.startTime,
		channel = channel,
		note = note,
		octave = octave
	})
end

function NoteOn(channel, instrument, note, octave)
	TriggerServerEvent('instruments:noteOn', channel, instrument, note, octave)

	NotesPlaying = NotesPlaying + 1
	ActivelyPlayingTimer = GetSystemTime() + 4000

	if Recording.active then
		if not Recording.playing then
			PlaybackRecording()
		end

		RecordNoteOn(channel, note, octave)
	end
end

function NoteOff(channel, note, octave)
	TriggerServerEvent('instruments:noteOff', channel, note, octave)

	NotesPlaying = NotesPlaying - 1

	if NotesPlaying < 0 then
		NotesPlaying = 0
	end

	if NotesPlaying == 0 then
		ActivelyPlayingTimer = GetSystemTime() + 500
	end

	if Recording.active then
		RecordNoteOff(channel, note, octave)
	end
end

function StartRecording()
	Recording.buffer = {}
	Recording.length = 0
	Recording.startTime = GetSystemTime()
	Recording.active = true
end

function StopRecording()
	Recording.active = false
	Recording.length = GetSystemTime() - Recording.startTime

	Recording.events = {}
	for _, event in ipairs(Recording.buffer) do
		table.insert(Recording.events, event)
	end

	Recording.playing = false
end

function RecordWait(duration)
	table.insert(Recording.buffer, {
		type = 'wait',
		duration = duration
	})
end

function PlaybackRecording()
	CreateThread(function()
		Recording.playing = true

		for _, event in ipairs(Recording.events) do
			if not Recording.playing then
				break
			end

			if event.type == 'noteOn' then
				NoteOn(event.channel, event.instrument, event.note, event.octave)

				SendNUIMessage({
					type = 'noteOn',
					channel = event.channel,
					note = event.note,
					octave = event.octave,
					distance = 0,
					sameRoom = true
				})
			elseif event.type == 'noteOff' then
				NoteOff(event.channel, event.note, event.octave)

				SendNUIMessage({
					type = 'noteOff',
					channel = event.channel,
					note = event.note,
					octave = event.octave
				})
			elseif event.type == 'wait' then
				Wait(event.duration)
			end
		end

		Recording.playing = false
	end)
end

function EraseRecording()
	Recording.active = false
	Recording.startTime = 0
	Recording.length = 0
	Recording.events = {}
	Recording.buffer = {}
	Recording.playing = false
end

RegisterCommand('instrument', function(source, args, raw)
	if args[1] == 'stop' then
		StopPlayingInstrument()
	else
		ShowUi()

		if args[1] then
			StartPlayingInstrument(args[1])
		end
	end
end)

RegisterNUICallback('init', function(data, cb)
	cb({
		maxVolume = Config.MaxVolume,
		baseOctave = Config.BaseOctave,
		minAttenuationFactor = Config.MinAttenuationFactor,
		maxAttenuationFactor = Config.MaxAttenuationFactor,
		minVolumeFactor = Config.MinVolumeFactor,
		maxVolumeFactor = Config.MaxVolumeFactor,
		soundfontUrl = Config.SoundfontUrl,
		instrumentsUrl = Config.InstrumentsUrl,
		instruments = GetInstrumentList()
	})
end)

RegisterNUICallback('noteOn', function(data, cb)
	NoteOn(data.channel, data.instrument, data.note, data.octave)
	cb({})
end)

RegisterNUICallback('noteOff', function(data, cb)
	NoteOff(data.channel, data.note, data.octave)
	cb({})
end)

RegisterNUICallback('closeUi', function(data, cb)
	HideUi()
	cb({})
end)

RegisterNUICallback('startRecording', function(data, cb)
	StartRecording()
	cb({})
end)

RegisterNUICallback('stopRecording', function(data, cb)
	StopRecording()
	cb({
		length = Recording.length
	})
end)

RegisterNUICallback('playbackRecording', function(data, cb)
	PlaybackRecording()
	cb({})
end)

RegisterNUICallback('eraseRecording', function(data, cb)
	EraseRecording()
	cb({})
end)

RegisterNUICallback('startPlayingInstrument', function(data, cb)
	StartPlayingInstrument(data.instrument)
	cb({})
end)

RegisterNUICallback('stopPlayingInstrument', function(data, cb)
	StopPlayingInstrument()
	cb({})
end)

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then
		return
	end

	if UiIsOpen then
		StopPlayingInstrument()
		HideUi()
	end
end)

AddEventHandler('instruments:noteOn', function(serverId, channel, instrument, note, octave)
	local player = GetPlayerFromServerId(serverId)

	if player == PlayerId() then
		return
	end

	local listener, listenerCoords = GetListenerInfo()
	local soundSource = GetPlayerPed(player)
	local distance = #(listenerCoords - GetEntityCoords(soundSource))

	if distance <= Config.MaxNoteDistance then
		SendNUIMessage({
			type = 'noteOn',
			channel = channel,
			instrument = instrument,
			note = note,
			octave = octave,
			distance = distance,
			sameRoom = IsInSameRoom(listener, soundSource)
		})
	end
end)

AddEventHandler('instruments:noteOff', function(serverId, channel, note, octave)
	local player = GetPlayerFromServerId(serverId)

	if player == PlayerId() then
		return
	end

	local listener, listenerCoords = GetListenerInfo()
	local soundSource = GetPlayerPed(player)
	local distance = #(listenerCoords - GetEntityCoords(soundSource))

	if distance <= Config.MaxNoteDistance then
		SendNUIMessage({
			type = 'noteOff',
			channel = channel,
			note = note,
			octave = octave
		})
	end
end)

AddEventHandler('instruments:showUi', ShowUi)
AddEventHandler('instruments:hideUi', HideUi)
AddEventHandler('instruments:toggleUi', ToggleUi)

function CreateInstrumentObject(prop)
	prop.handle = CreateObjectNoOffset(GetHashKey(prop.model), 0.0, 0.0, 0.0, true, false, false, false)
end

function AttachInstrumentObject(ped, prop)
	local bone = prop.bone

	if type(bone) == 'string' then
		bone = GetEntityBoneIndexByName(ped, bone)
	end

	AttachEntityToEntity(prop.handle, ped, bone, prop.position, prop.rotation, false, false, true, false, 0, true, false, false)
end

CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/instrument', 'Play an instrument', {
		{name = 'instrument', help = table.concat(GetInstrumentList(), ', ') .. ', or stop to stop playing an instrument'}
	})

	while true do
		Wait(250)

		if CurrentInstrument then
			local ped = PlayerPedId()
			local anim = GetAnimation(ped, CurrentInstrument)

			if not IsEntityPlayingAnim(ped, anim.dict, anim.name, anim.flag) then
				PlayAnimation(ped, anim)
			end

			if CurrentInstrument.props then
				for _, prop in ipairs(CurrentInstrument.props) do
					if not (prop.handle and DoesEntityExist(prop.handle)) then
						CreateInstrumentObject(prop)
						AttachInstrumentObject(ped, prop)
					elseif not IsEntityAttachedToEntity(prop.handle, ped) then
						AttachInstrumentObject(ped, prop)
					end
				end
			end
		end
	end
end)
