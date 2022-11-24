--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Get the closest interactable object near character
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Have to rethink on how to implement this option. For now we will just deploy the
-- objects and leave with without interactions. Will be added to a later stage
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(0)
      local PedID = PedID()
      for k,v in pairs(IntObjects) do
        local ID, Coords, Active = v.ID, v.Coords, v.Active
        local pCoords = GetCoords(PedID)
        local Dist = GetDistance(Coords)
        if ((Active) and (Dist > 2.5) and (Dist <= 6)) then DrawText3D(Coords.x, Coords.y, (Coords.z + 0.5), 300, MSG("Interactable").MSG) end
        if ((Active) and (Dist < 2.5)) then DrawText3D(Coords.x, Coords.y, (Coords.z + 0.5), 300, 'UNDER CONSTRUCTION') end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
