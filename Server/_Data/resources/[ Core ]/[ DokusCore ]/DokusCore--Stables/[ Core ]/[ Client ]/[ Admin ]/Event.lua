--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Admin:SpawnHorse', function()
  -- Check if the admin already has a horse on the map.
  if (MyActiveHorse ~= nil) then
    local Coords = GetCoords(PedID())
    local Heading = GetEntityHeading(PedID())
    SetEntityCoords(MyActiveHorse, (Coords[1] + 1.0), (Coords[2] + 1.0), Coords[3])
    SetEntityHeading(MyActiveHorse, Heading)
    TriggerEvent('DokusCore:SafeGuard:Admin:SpawnHorse')
    return
  end

  -- If no horse is on the map at current.
  local Horses = {}
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'All', { Sync.SteamID, Sync.CharID } } }
  local Horse = TSC('DokusCore:Core:DBGet:Stables', Index)
  local Random = Horse.Result[ math.random(#Horse.Result) ]
  local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, true }
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'InUse', Index })
  local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, false }
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'IsStored', Index })
  DeleteEntity(MyActiveHorse) MyActiveHorse = nil
  local sHorse = SpawnHorse(GetHash(Random.Model), GetCoords(PedID()), 0.0)
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseActive', { true } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseID', { sHorse } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseName', { Horse.Name } })
  TriggerEvent('DokusCore:SafeGuard:Admin:SpawnHorse')
  MyActiveHorse = sHorse
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
