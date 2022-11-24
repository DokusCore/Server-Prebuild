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
  TriggerEvent('DokusCore:Metabolism:Set:OuterGold:Health',   { a[1] })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Reset the vitals after death
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
