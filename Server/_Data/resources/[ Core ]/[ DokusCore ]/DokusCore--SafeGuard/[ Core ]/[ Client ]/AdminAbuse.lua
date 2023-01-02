--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local ShowText, Count = false, 0
RegisterNetEvent('DokusCore:SafeGuard:Admin:SpawnHorse', function()
  if (_SafeGuard.Admin.SpawnHorse.Enabled) then
    CreateLog('DokusCore', 'Horse Spawn', 'Admin spawned his horse via the admin menu')
    if (ShowText) then ShowText = false Wait(1000) Count = 0 ShowText = true end
    if (not (ShowText)) then ShowText = true end
    TriggerEvent('DokusCore:SafeGuard:Admin:Show:Horse:SpawnNote')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Admin:Show:Horse:SpawnNote', function()
  while ShowText do Wait(1)
    local sCoords = GetCoords(PedID())
    local Dist = GetDistance(sCoords)
    local Time = (_SafeGuard.Admin.SpawnHorse.Time.Seconds * 100)
    local Offset = _SafeGuard.Admin.SpawnHorse.OffsetZ
    if (Count < Time) then Count = (Count + 1) end
    if (Count >= Time) then ShowText = false Count = 0 return end
    if (Dist <= 100) then
      DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: Horse Spawned')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
