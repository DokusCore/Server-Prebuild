--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
Blips = {}
local BPos = {
  { ID = 'Guarma Fishers Bar',     Hash = 935247438,  Coords = vector3(1365.9, -6521.1, 42.9) },
  { ID = 'Guarma Hideout',         Hash = -428972082, Coords = vector3(650.3, -7429.8, 179.1) },
  { ID = 'Gladiator Arena',        Hash = -184692826, Coords = vector3(1200.8, 720.3, 101.4)  },
  { ID = 'The Mexico Bridge',      Hash = 784218150,  Coords = vector3(-1307.7, -2658.3, 83.9)},
  { ID = 'The Hanging Bridge',     Hash = 784218150,  Coords = vector3(-6578.7, -3447.1, -31.1)},
}
--------------------------------------------------------------------------------
-- Set Blips on the map
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  for k,v in pairs(BPos) do
   Tabi(Blips, SetBlip(v.Coords, v.Hash, 1.0, v.ID))
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(Blips) do RemoveBlip(v)   end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
