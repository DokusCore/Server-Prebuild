RegisterNetEvent('instruments:noteOn')
RegisterNetEvent('instruments:noteOff')

AddEventHandler('instruments:noteOn', function(channel, instrument, note, octave)
	TriggerClientEvent('instruments:noteOn', -1, source, channel, instrument, note, octave)
end)

AddEventHandler('instruments:noteOff', function(channel, note, octave)
	TriggerClientEvent('instruments:noteOff', -1, source, channel, note, octave)
end)

CreateThread(function()
  local Name = GetCurrentResourceName()
  local Version = GetResourceMetadata(Name, 'version')
  TriggerEvent('DokusCore:Sync:Modules:Version', { Name, { Version } })
end)
--------------------------------------------------------------------------------``
--------------------------------------------------------------------------------
