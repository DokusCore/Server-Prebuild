RegisterNetEvent("emotes:requestSharedEmote")
RegisterNetEvent("emotes:rejectSharedEmote")
RegisterNetEvent("emotes:acceptSharedEmote")
RegisterNetEvent("emotes:stopSharedEmote")

AddEventHandler("emotes:requestSharedEmote", function(player, emote)
	TriggerClientEvent("emotes:requestSharedEmote", player, source, emote)
end)

AddEventHandler("emotes:rejectSharedEmote", function(player, emote)
	TriggerClientEvent("emotes:rejectSharedEmote", player, source, emote)
end)

AddEventHandler("emotes:acceptSharedEmote", function(player, emote)
	TriggerClientEvent("emotes:acceptSharedEmote", player, source, emote)
end)

AddEventHandler("emotes:stopSharedEmote", function(player, emote)
	TriggerClientEvent("emotes:stopSharedEmote", player, source, emote)
end)
