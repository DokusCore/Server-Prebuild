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
PPBurpsFartsRumble = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Initialize User Data on user joining
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local PedID  = PedID()
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Data.SteamID, Data.CharID
    local Data = TSC('DokusCore:Core:DBGet:Metabolism', { 'User', { Steam, CharID } }).Result[1]
    Health, Hunger, Thirst = Data.Health, Data.Hunger, Data.Thirst
    Online = true
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
        local Control = IsControlPressed(0, _Keys["SHIFT"])
        local Walking, Running = IsPedWalking(PedID), IsPedRunning(PedID)
        local MHorse = Citizen.InvokeNative(0x95CBC65780DE7EB1, PedID, true)
        if (MHorse) then IsIdle, IsWalking, IsRunning, IsSprinting = true, false, false, false else
          if (not (Walking) and not (Running)) then IsIdle = true else IsIdle = false end
          if (Walking) then IsWalking = true else IsWalking = false end
          if (Running) then IsRunning = true else IsRunning = false end
          if ((Control) and (IsIdle)) then IsSprinting = true else IsSprinting = false end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Calculate the environment temperate
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(100)
      while Online do Wait(1)
        local PedID  = PedID()
        local Coords = GetCoords(PedID)
        Health = GetEntityHealth(PedID)
        Temp = GetTemperature(Coords)
        CalcTempDamage()
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Look for when the player dies
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      while Online do Wait(1000)
        if (Health <= 0) then
          TriggerEvent('DokusCore:Metabolism:Respawn')
          Wait(5000)
        end
      end
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
-- Send out warnings when the player vitals are getting low.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Metabolism) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      while Online do Wait(1000)
        if not (PPBurpsFartsRumble) then
          if (Hunger <= 20) then SendHungerWarning() end
          if (Thirst <= 20) then SendThirstWarning() end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Send out random farts, just for the fun and hec of it :P
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Metabolism) then
    if (Meta.Farting.Enabled) then
      while not FrameReady() do Wait(1000) end
      while not UserInGame() do Wait(1000) end
      while true do Wait(1000)
        while Online do Wait(Meta.Farting.Frequention * 1000)
          if not (PPBurpsFartsRumble) then
            local Random = math.random(1, 10)
            if (Random == 5) then DoFarting() end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Send out random burps, just for the fun and hec of it :P
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Metabolism) then
    if (Meta.Burping.Enabled) then
      while not FrameReady() do Wait(1000) end
      while not UserInGame() do Wait(1000) end
      while true do Wait(1000)
        while Online do Wait(Meta.Burping.Frequention * 1000)
          if not (PPBurpsFartsRumble) then
            local Random = math.random(1, 10)
            if (Random == 5) then DoBurps() end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
