--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------
local AliveNPCs = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Show Map Blips
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Telegrams) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_Telegrams.NPCs) do SetBlip(v.Coords, 1861010125, Radius, 'Post Office') end
    for k,v in pairs(_Telegrams.NPCs) do Tabi(AliveNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading)) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(AliveNPCs) do DeleteEntity(v) end
end)




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
