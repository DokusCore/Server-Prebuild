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
    TriggerEvent('DokusCore:SafeGuard:Anti:AdminAbuse', 'HorseSpawn')
    return
  end

  -- If no horse is on the map at current.
  local Horses = {}
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'All', { Sync.SteamID, Sync.CharID } } }
  local Horse = TSC('DokusCore:Core:DBGet:Stables', Index)

  -- When the admin owns horses.
  if (Horse.Exist) then
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
    TriggerEvent('DokusCore:SafeGuard:Anti:AdminAbuse', 'HorseSpawn')
    MyActiveHorse = sHorse
  end

  -- When the admin does not own a horse, spawn a random
  if (not (Horse.Exist)) then
    TriggerEvent('DokusCore:SafeGuard:Anti:AdminAbuse', 'HorseSpawn')
    local sHorse = SpawnHorse(GetHash('A_C_Horse_Mustang_WildBay'), GetCoords(PedID()), 0.0)
    MyActiveHorse = sHorse
    IsDefAdminHorse = true
    TaskMountAnimal(PedID(), MyActiveHorse, 2000, -1, 1.0, 1, 0, 0) Wait(2000)
    TriggerEvent('DokusCore:Stables:Admin:Horse:DefaultDespawn')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Admin:Horse:DefaultDespawn', function()
  while (IsDefAdminHorse) do Wait(500)
    local Mount = IsPedOnMount(PedID())
    if (not (Mount)) then
      DeleteEntity(MyActiveHorse)
      MyActiveHorse = nil
      IsDefAdminHorse = false
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
