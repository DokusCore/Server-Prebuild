--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local Show_SpawnHorse = false
local Show_Teleport   = false
local Show_GodMode    = false
local Show_NoClip     = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local cTel, cHorseSp  = 0, 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Anti:AdminAbuse', function(Type)
  if (Low(Type) == 'teleport') then
    if (_SafeGuard.Admin.Teleport.Enabled) then
      if (Show_Teleport) then Show_Teleport = false Wait(1000) cTel = 0 Show_Teleport = true end
      if (not (Show_Teleport)) then Show_Teleport = true end
      TriggerEvent('DokusCore:SafeGuard:Admin:ShowNote:Teleport')
    end
  end

  if (Low(Type) == 'horsespawn') then
    if (_SafeGuard.Admin.SpawnHorse.Enabled) then
      CreateLog('DokusCore', 'Horse Spawn', 'Admin spawned his horse via the admin menu')
      if (Show_SpawnHorse) then Show_SpawnHorse = false Wait(1000) cHorseSp = 0 Show_SpawnHorse = true end
      if (not (Show_SpawnHorse)) then Show_SpawnHorse = true end
      TriggerEvent('DokusCore:SafeGuard:Admin:ShowNote:HorseSpawn')
    end
  end

  if (Low(Type) == 'godmode') then
    if (_SafeGuard.Admin.GodMode.Enabled) then
      if (not (Show_GodMode)) then CreateLog('DokusCore', 'God Mode', 'Admin has enabled god mode') end
      if (Show_GodMode) then CreateLog('DokusCore', 'God Mode', 'Admin has disabled god mode') end
      if (not (Show_GodMode)) then Show_GodMode = true else Show_GodMode = false end
      TriggerEvent('DokusCore:SafeGuard:Admin:ShowNote:GodMode')
    end
  end

  if (Low(Type) == 'noclip') then
    if (_SafeGuard.Admin.NoClip.Enabled) then
      if (not (Show_NoClip)) then CreateLog('DokusCore', 'NoClip', 'Admin has enabled NoClip') end
      if (Show_NoClip) then CreateLog('DokusCore', 'NoClip', 'Admin has disabled NoClip') end
      if (not (Show_NoClip)) then Show_NoClip = true else Show_NoClip = false end
      TriggerEvent('DokusCore:SafeGuard:Admin:ShowNote:NoClip')
    end
  end

  if (Low(Type) == 'deletevehicle') then
    if (_SafeGuard.Admin.DeleteVehicle.Enabled) then
      CreateLog('DokusCore', 'Delete Vehicle', 'An Admin has deleted a horse or vehicle')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Admin:ShowNote:HorseSpawn', function()
  while ((Show_SpawnHorse) and (InGame)) do Wait(1)
    local sCoords = GetCoords(PedID())
    local Dist = GetDistance(sCoords)
    local Time = (_SafeGuard.Admin.SpawnHorse.Time.Seconds * 100)
    local Offset = _SafeGuard.Admin.SpawnHorse.OffsetZ
    if (cHorseSp < Time) then cHorseSp = (cHorseSp + 1) end
    if (cHorseSp >= Time) then Show_SpawnHorse = false cHorseSp = 0 return end
    if (Dist <= 100) then
      DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: Horse Spawned')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Admin:ShowNote:Teleport', function()
  while ((Show_Teleport) and (InGame)) do Wait(1)
    local sCoords = GetCoords(PedID())
    local Dist = GetDistance(sCoords)
    local Time = (_SafeGuard.Admin.Teleport.Time.Seconds * 100)
    local Offset = _SafeGuard.Admin.Teleport.OffsetZ
    if (cTel < Time) then cTel = (cTel + 1) end
    if (cTel >= Time) then Show_Teleport = false cTel = 0 return end
    if (Dist <= 100) then
      DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: Teleported')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Admin:ShowNote:GodMode', function()
  while ((Show_GodMode) and (InGame)) do Wait(1)
    local sCoords = GetCoords(PedID())
    local Dist = GetDistance(sCoords)
    local Offset = _SafeGuard.Admin.GodMode.OffsetZ
    if (Dist <= 100) then
      DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: GodMode Enabled')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SafeGuard:Admin:ShowNote:NoClip', function()
  while ((Show_NoClip) and (InGame)) do Wait(1)
    local sCoords = GetCoords(PedID())
    local Dist = GetDistance(sCoords)
    local Offset = _SafeGuard.Admin.NoClip.OffsetZ
    if (Dist <= 100) then
      DrawText3D(sCoords.x, sCoords.y, (sCoords.z - Offset), 225, 'Admin: NoClip Enabled')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
