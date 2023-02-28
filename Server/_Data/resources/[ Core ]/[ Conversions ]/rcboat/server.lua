RegisterNetEvent("rcboat:torpedoFired")
RegisterNetEvent("rcboat:torpedoReloaded")
RegisterNetEvent("rcboat:boatSunk")

AddEventHandler("rcboat:torpedoFired", function(rcBoatCoords, torpedoNetId)
	TriggerClientEvent("rcboat:torpedoFired", -1, rcBoatCoords, torpedoNetId)
end)

AddEventHandler("rcboat:torpedoReloaded", function(rcBoatCoords)
	TriggerClientEvent("rcboat:torpedoReloaded", -1, rcBoatCoords)
end)

AddEventHandler("rcboat:boatSunk", function(rcBoatCoords)
	TriggerClientEvent("rcboat:boatSunk", -1, rcBoatCoords)
end)
