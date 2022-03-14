--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Steam, UserID = nil, 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do print("Frame not ready") Wait(1000) end
  local Data = TCTCC('DokusCore:Core:GetCoreUserData')
  Steam = Data.Steam
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
RegisterCommand('logout', function(source, args, rawCommand)
  local PedID = PedID()
  local Pos = GetCoords(PedID)
  local Coords = Encoded(Pos)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Steam, UserID, Coords } })
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', false)
  SetVisible(PedID, false)
  SetFreeze(PedID, true)
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
  TriggerEvent('DokusCore:Core:SetCoreUserData', { 'CharID', { 0 } })
  TriggerEvent('DokusCore:Core:SetCoreUserData', { 'UserInGame', { false } })
  TriggerEvent('DokusCore:CoreMenu:SetData', { 'Logout' })
  TriggerEvent('DokusCore:Metabolism:UserLoggedOut')
  UserID = 0
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:MultiChar:Logout')
AddEventHandler('DokusCore:MultiChar:Logout', function()
  local PedID = PedID()
  local Pos = GetCoords(PedID)
  local Coords = Encoded(Pos)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Steam, UserID, Coords } })
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', false)
  SetVisible(PedID, false)
  SetFreeze(PedID, true)
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
  TriggerEvent('DokusCore:Core:SetCoreUserData', { 'CharID', { 0 } })
  TriggerEvent('DokusCore:Core:SetCoreUserData', { 'UserInGame', { false } })
  TriggerEvent('DokusCore:CoreMenu:SetData', { 'Logout' })
  TriggerEvent('DokusCore:Metabolism:UserLoggedOut')
  UserID = 0
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStart', function(R)
  if (R == 'DokusCore') then
    while not FrameReady() do Wait(1000) end
    print('^2[ System ]: ^0'.."^3FrameWork Restart Detected^0")
    print('^2[ System ]: ^0'.."^3Going to sync UserID with the Core^0")
    TriggerEvent('DokusCore:Core:SyncCharID', UserID)
    TriggerEvent('DokusCore:Core:SetCoreUserData', { 'UserInGame', { true } })
    -- TriggerEvent('DokusCore:Core:Hud:Toggle', true)
    -- TriggerEvent('DokusCore:Core:Hud:Update', { 'User' })
  elseif (R == 'DokusCore--MultiCharacters') then
    TriggerEvent('DokusCore:Core:SetCoreUserData', { 'UserInGame', { false } })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
