--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Steam, CharID  = nil, 0
local Health, Hunger, Thirst = 0, 0, 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Save players vitals to the database if player disconnects.
--------------------------------------------------------------------------------
AddEventHandler('playerDropped', function () TriggerEvent('DokusCore:Metabolism:SaveVitals') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Save players vitals to the database
RegisterServerEvent('DokusCore:Metabolism:SaveVitals')
AddEventHandler('DokusCore:Metabolism:SaveVitals', function()
  TriggerEvent('DokusCore:Core:DBSet:Metabolism', { 'User', 'All', { Steam, CharID, Health, Hunger, Thirst } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set the player values server side
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Metabolism:UpdateVitals')
AddEventHandler('DokusCore:Metabolism:UpdateVitals', function(Data)
  Steam, CharID = Data[1], Data[2]
  Health, Hunger, Thirst = Data[3], Data[4], Data[5]
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Save Users vitals when this resource restarts
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(r)
  if (GetCurrentResourceName() ~= r) then return end
  TriggerEvent('DokusCore:Metabolism:SaveVitals')
  Steam, CharID, Health, Hunger, Thirst = nil, 0, 0, 0, 0
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
