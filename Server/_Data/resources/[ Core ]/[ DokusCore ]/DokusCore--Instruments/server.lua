RegisterNetEvent('instruments:noteOn')
RegisterNetEvent('instruments:noteOff')

AddEventHandler('instruments:noteOn', function(channel, instrument, note, octave)
	TriggerClientEvent('instruments:noteOn', -1, source, channel, instrument, note, octave)
end)

AddEventHandler('instruments:noteOff', function(channel, note, octave)
	TriggerClientEvent('instruments:noteOff', -1, source, channel, note, octave)
end)
