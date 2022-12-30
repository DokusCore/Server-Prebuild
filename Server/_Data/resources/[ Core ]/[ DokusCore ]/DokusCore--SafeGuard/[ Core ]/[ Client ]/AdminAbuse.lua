--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local ShowText = false
RegisterNetEvent('DokusCore:SafeGuard:Admin:SpawnHorse', function()
  if (_SafeGuard.Admin.SpawnHorse.Enabled) then
    if (ShowText) then return end
    local Count = 0
    local Time = (_SafeGuard.Admin.SpawnHorse.Time.Seconds * 100)
    local Offset = _SafeGuard.Admin.SpawnHorse.OffsetZ
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local tData = TSC('DokusCore:Core:System:GetTimeDate')
    local Index = { Sync.SteamID, 'Horse Spawn', tData.Date, tData.Time, 'Admin spawned his horse via the admin menu' }
    TriggerServerEvent('DokusCore:Core:DBIns:Logs', { 'SafeGuard', Index })
    ShowText = true
    while true do Wait(1)
      local sCoords = GetCoords(PedID())
      local Dist = GetDistance(sCoords)
      if (Count < Time) then Count = (Count + 1) end
      if (Count >= Time) then ShowText = false return end
      if (Dist <= 100) then
        DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: Horse Spawned')
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
