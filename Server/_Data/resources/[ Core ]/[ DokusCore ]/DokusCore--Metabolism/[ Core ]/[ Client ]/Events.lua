--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Event to trigger when user logs out.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:UserLoggedIn', function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  Online = true
  local PedID  = PedID()
  local Data = TCTCC('DokusCore:Core:GetCoreUserData')
  Steam, CharID = Data.Steam, Data.CharID
  local Data = TSC('DokusCore:Core:DBGet:Metabolism', { 'User', { Steam, CharID } }).Result[1]
  Health, Hunger, Thirst = Data.Health, Data.Hunger, Data.Thirst
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Event to trigger when user logs out.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Metabolism:UserLoggedOut', function()
  TriggerServerEvent('DokusCore:Metabolism:UpdateVitals', { Steam, CharID, Health, Hunger, Thirst })
  Wait(100) TriggerServerEvent('DokusCore:Metabolism:SaveVitals')
  Online = false
  Steam, CharID = nil, 0
  Health, Stamina, Hunger, Thirst = 0, 0, 0, 0
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
