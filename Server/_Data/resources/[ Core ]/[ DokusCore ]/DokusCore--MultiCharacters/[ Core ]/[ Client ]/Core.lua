--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Steam, UserID = nil, 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  Steam = Data.SteamID
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.MultiCharacters) then
    while true do Wait(0)
      local Network = NetworkIsSessionStarted()
      local PedID = PedID()
      SetVisible(PedID, Visible)
      SetFreeze(PedID, Freeze)
      -- TriggerEvent('DokusCore:Core:Hud:Toggle', false)
      if Network then	TriggerEvent('DokusCore:MultiChar:ChooseChar') return end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:MultiChar:ChooseChar')
AddEventHandler('DokusCore:MultiChar:ChooseChar', function()
  UserID = 0
  TriggerEvent('DokusCore:Core:SyncCharID', UserID)
  local PedID = PedID()
  local GetPed = GetPed(-1)
  UIFocus(false, false)
  UIFadeOut(1500) Wait(2000)
  SetVisible(PedID, false)
  SetFreeze(PedID, true)
  SetCoords(PedID, -355.6, 790.0, 100.2) Wait(1500)
  ShutdownLoadingScreenNui()
  ShutdownLoadingScreen() Wait(1)
  ShutdownLoadingScreenNui()
  ShutdownLoadingScreen()
  ToggleMenu(true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterCommand('logout', function(source, args, rawCommand) Logout() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:MultiChar:Logout', function() Logout() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStart', function(R)
  if (GetCurrentResourceName() == R) then
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { false } })
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { 0 } })
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive', { false } })
    TriggerEvent('DokusCore:CoreMenu:SetData',  { 'Logout' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- DEPRECATED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- AddEventHandler('onResourceStart', function(R)
--   if (R == 'DokusCore') then
--     while not FrameReady() do Wait(1000) end
--     print('^2[ System ]: ^0'.."^3FrameWork Restart Detected^0")
--     print('^2[ System ]: ^0'.."^3Going to sync UserID with the Core^0")
--     TriggerEvent('DokusCore:Core:SyncCharID', UserID)
--     TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true } })
--     -- TriggerEvent('DokusCore:Core:Hud:Toggle', true)
--     -- TriggerEvent('DokusCore:Core:Hud:Update', { 'User' })
--   elseif (R == 'DokusCore--MultiCharacters') then
--     TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { false } })
--   end
-- end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
