--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
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


















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
