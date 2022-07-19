--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Event to trigger when user logs out.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:UserLoggedIn', function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local PedID  = PedID()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  Steam, CharID = Data.SteamID, Data.CharID
  local Data = TSC('DokusCore:Core:DBGet:Metabolism', { 'User', { Steam, CharID } }).Result[1]
  Health, Hunger, Thirst = Data.Health, Data.Hunger, Data.Thirst
  Online = true
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Event to trigger when user logs out.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:UserLoggedOut', function()
  local Data = { Steam, CharID, Health, Hunger, Thirst }
  TriggerServerEvent('DokusCore:Core:DBSet:Metabolism', { 'User', 'All', Data })
  Online, Steam, CharID = false, nil, 0
  Health, Stamina, Hunger, Thirst = 0, 0, 0, 0
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
  if (Hunger <= 0) then SetHealthDamage() return end
  if (Thirst <= 0) then SetHealthDamage() return end
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
RegisterNetEvent('DokusCore:Metabolism:Edit:Hunger', function(v)
  local Value  = (Hunger + tonumber(v[1]))
  if (Value > 100) then Value = 100 end
  if (Value < 0) then Value = 0 end
  Hunger = Round(tonumber(Value), 1)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Edit:Thirst', function(v)
  local Value  = (Thirst + tonumber(v[1]))
  if (Value > 100) then Value = 100 end
  if (Value < 0) then Value = 0 end
  Thirst = Round(tonumber(Value), 1)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Stamina: Can't be a decimal number
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Edit:Stamina', function(v)
  local PedID  = PedID()
  local Core  = GetAttributeCoreValue(PedID, 1)
  local Value = math.floor((Core + tonumber(v[1])))
  if (Value > 100) then Value = 100 end
  if (Value < 0) then Value = 0 end
  Citizen.InvokeNative(0xC6258F41D86676E0, PedID, 1, tonumber(Value))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Health: Can't be a decimal number
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Edit:Health', function(v)
  local PedID  = PedID()
  local Core   = GetAttributeCoreValue(PedID, 0)
  local Value  = math.floor((Core + tonumber(v[1])))
  if (Value > 100) then Value = 100 end
  if (Value < 0) then Value = 0 end
  Citizen.InvokeNative(0xC6258F41D86676E0, PedID, 0, Value)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Inner Gold Stamina: Value is a none decible and in seconds.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Set:InnerGold:Stamina', function(v)
  Citizen.InvokeNative(0x4AF5A4C7B9157D14, PedID(), 1, Round(v[1], 1), true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Outer Gold Stamina: Value is a none decible and in seconds.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Set:OuterGold:Stamina', function(v)
  Citizen.InvokeNative(0xF6A7C08DF2E28B28, PedID(), 1, Round(v[1], 1), true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Inner Gold Health: Value is a none decible and in seconds.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Set:InnerGold:Health', function(v)
  Citizen.InvokeNative(0x4AF5A4C7B9157D14, PedID(), 0, Round(v[1], 1), true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Outer Gold Health: Value is a none decible and in seconds.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Set:OuterGold:Health', function(v)
  Citizen.InvokeNative(0xF6A7C08DF2E28B28, PedID(), 0, Round(v[1], 1), true)
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
-- Pause Burps, Farts and stomach rumbling to it does not interrupt with the music
RegisterNetEvent('DokusCore:Metabolism:PPBurpsFartsStomach', function(Bool) PPBurpsFartsRumble = Bool end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:ShowHud', function(Bool)
  ShowHud = Bool
  SendNUIMessage({ Show = ShowHud })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
