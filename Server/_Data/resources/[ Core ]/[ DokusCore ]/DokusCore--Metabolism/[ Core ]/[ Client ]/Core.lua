--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Online = false
Steam, CharID, Temp = nil, 0, 0, nil
Health, Stamina, Hunger, Thirst = 0, 0, 0, 0
DamHunger, DamThirst, DamHealth = 0, 0, 0
ShowHud, VitalFlash = true, false
IsIdle, IsWalking, IsRunning, IsSprinting = false, false, false, false
Num = tonumber
Meta = _Metabolism
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Initialize User Data on user joining
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    Online = true
    local PedID  = PedID()
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Data.SteamID, Data.CharID
    local Data = TSC('DokusCore:Core:DBGet:Metabolism', { 'User', { Steam, CharID } }).Result[1]
    Health, Hunger, Thirst = Data.Health, Data.Hunger, Data.Thirst
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Determine if player is idle, walking, running or sprinting
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(500)
      while Online do Wait(500)
        local PedID  = PedID()
        local pHealth = GetEntityHealth(PedID)
        Health, Temp = pHealth, GetTemperatureAtCoords(GetCoords(PedID))
        if (Health <= 0) then TriggerEvent('DokusCore:Metabolism:Respawn') return end
        CalcTempDamage()
        local Control = IsControlPressed(0, _Keys["SHIFT"])
        local Walking, Running = IsPedWalking(PedID), IsPedRunning(PedID)
        if (not (Walking) and not (Running)) then IsIdle = true else IsIdle = false end
        if (Walking) then IsWalking = true else IsWalking = false end
        if (Running) then IsRunning = true else IsRunning = false end
        if ((Control) and (IsIdle)) then IsSprinting = true else IsSprinting = false end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Activate the vital flash is vitals are to low or temp is to high/low
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:ActVitalFlash', function()
  local Danger = Meta.Vitals.LoseWhen
  local DTemp  = Meta.Temp.Limit
  if (Hunger <= Danger) then DoVitalFlash() return end
  if (Thirst <= Danger) then DoVitalFlash() return end
  if (Temp <= DTemp.Min) then DoVitalFlash() return end
  if (Temp > DTemp.Max) then DoVitalFlash() return end
  VitalFlash = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Activate the vital flash is vitals are to low or temp is to high/low
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:CheckHealthDamage', function()
  if (Hunger <= 0) then DoHealthDamage() return end
  if (Thirst <= 0) then DoHealthDamage() return end
  HealthDamage = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Activate the vital flash is vitals are to low or temp is to high/low
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:HealthDamage', function()
  while Online do Wait(0)
    while HealthDamage do Wait(1000)
      local PedID  = PedID()
      Citizen.InvokeNative(0x697157CED63F18D4, PedID, Meta.Vitals.DPS, false, true, true)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Activate the right events on player movement
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      while Online do Wait(1000)
        TriggerEvent('DokusCore:Metabolism:ActVitalFlash')
        TriggerEvent('DokusCore:Metabolism:CheckHealthDamage')
        if ((IsIdle) and not (IsSprinting)) then TriggerEvent('DokusCore:Metabolism:Move:Idle') end
        if (IsWalking) then TriggerEvent('DokusCore:Metabolism:Move:Walking') end
        if (IsRunning) then TriggerEvent('DokusCore:Metabolism:Move:Running') end
        if ((IsIdle) and (IsSprinting)) then TriggerEvent('DokusCore:Metabolism:Move:Sprinting') end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Update server side script
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(5000)
      while Online do Wait(1000)
        TriggerServerEvent('DokusCore:Metabolism:UpdateVitals', { Steam, CharID, Health, Hunger, Thirst })
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Edit players vitals depending on what they are doing.
-- Depending on standing idle, walking, running, sprinting and the weather.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Move:Idle', function()
  Hunger = Num( ((Hunger - Meta.Hunger.Drain.Idle) - DamHunger) )
  Thirst = Num( ((Thirst - Meta.Thirst.Drain.Idle) - DamThirst) )
  if (Hunger <= 0) then Hunger = 0 end
  if (Thirst <= 0) then Thirst = 0 end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Move:Walking', function()
  Hunger = Num( ((Hunger - Meta.Hunger.Drain.Walking) - DamHunger) )
  Thirst = Num( ((Thirst - Meta.Thirst.Drain.Walking) - DamThirst) )
  if (Hunger <= 0) then Hunger = 0 end
  if (Thirst <= 0) then Thirst = 0 end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Move:Running', function()
  Hunger = Num( ((Hunger - Meta.Hunger.Drain.Running) - DamHunger) )
  Thirst = Num( ((Thirst - Meta.Thirst.Drain.Running) - DamThirst) )
  if (Hunger <= 0) then Hunger = 0 end
  if (Thirst <= 0) then Thirst = 0 end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Move:Sprinting', function()
  Hunger = Num( ((Hunger - Meta.Hunger.Drain.Sprinting) - DamHunger) )
  Thirst = Num( ((Thirst - Meta.Thirst.Drain.Sprinting) - DamThirst) )
  if (Hunger <= 0) then Hunger = 0 end
  if (Thirst <= 0) then Thirst = 0 end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Flash when vitals are in low and getting and player is in health risk
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:VitalFlash')
AddEventHandler('DokusCore:Metabolism:VitalFlash', function()
  while VitalFlash do Wait(2000) ShowHud = not ShowHud SendNUIMessage({ ShowHud }) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Heal:Health',  function() TriggerEvent('DokusCore:Metabolism:Edit:Health',  { 100 }) end)
RegisterNetEvent('DokusCore:Metabolism:Heal:Stamina', function() TriggerEvent('DokusCore:Metabolism:Edit:Stamina', { 100 }) end)
RegisterNetEvent('DokusCore:Metabolism:Heal:Hunger',  function() TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { 100 }) end)
RegisterNetEvent('DokusCore:Metabolism:Heal:Thirst',  function() TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { 100 }) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
