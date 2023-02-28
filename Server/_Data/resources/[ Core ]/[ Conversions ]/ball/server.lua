RegisterNetEvent("ball:hit")

AddEventHandler("ball:hit", function(player, ped, velocity)
	TriggerClientEvent("ball:hit", player, ped, velocity)
end)
