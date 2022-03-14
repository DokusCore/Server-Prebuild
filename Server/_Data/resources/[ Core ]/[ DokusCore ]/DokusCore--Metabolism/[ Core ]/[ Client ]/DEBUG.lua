--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- WILL BE REMOVED ONCE FURTHER IN DEVELOPMENT
--------------------------------------------------------------------------------
RegisterCommand('heal', function()
  TriggerEvent('DokusCore:Metabolism:Edit:Hunger',  { 100 })
  TriggerEvent('DokusCore:Metabolism:Edit:Thirst',  { 100 })
  TriggerEvent('DokusCore:Metabolism:Edit:Health',  { 100 })
  TriggerEvent('DokusCore:Metabolism:Edit:Stamina', { 100 })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterCommand('gold', function(s,a,r)
  TriggerEvent('DokusCore:Metabolism:Set:InnerGold:Stamina',  { a[1] })
  TriggerEvent('DokusCore:Metabolism:Set:OuterGold:Stamina',  { a[1] })
  TriggerEvent('DokusCore:Metabolism:Set:InnerGold:Health',   { a[1] })
  TriggerEvent('DokusCore:Metabolism:Set:OuterGold:Health',  { a[1] })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Reset the vitals after death
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:Respawn', function()
  local PedID  = PedID()
  Hunger, Thirst = (Hunger - Hunger), (Thirst - Thirst)
  TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { -Hunger })
  TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { -Thirst }) Wait(100)
  TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { 50 })
  TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { 50 }) Wait(5000)
  local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
  if (User.Skin == '--') then return Notify("You've no skin to load! Please create a skin first with /skin menu") end
  local Skin = Decoded(User.Skin)
  TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
