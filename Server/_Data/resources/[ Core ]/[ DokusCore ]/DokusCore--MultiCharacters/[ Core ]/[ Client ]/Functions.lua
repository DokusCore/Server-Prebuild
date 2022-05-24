--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ToggleMenu(bool)
  UIFocus(bool, bool)
  SendNUIMessage({action = "ui", toggle = bool})
  skyCam(bool)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function skyCam(bool)
  if bool then
    DoScreenFadeIn(1000)
    SetTimecycleModifier('hud_def_blur')
    SetTimecycleModifierStrength(1.0)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", - 2308.48, 379.17, 174.46, 0.0, 0.0, 333.5, 60.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
  else
    SetTimecycleModifier('default')
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    RenderScriptCams(false, false, 1, true, true)
    FreezeEntityPosition(GetPlayerPed(-1), false)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function IsError(Reason)
  if (Reason == 'FirstNameIsEmpty') then Notify('ERROR: The first name parameter is empty, please create your character again!', 'TopRight', 10000) end
  if (Reason == 'LastNameIsEmpty') then Notify('ERROR: The last name parameter is empty, please create your character again!', 'TopRight', 10000) end
  if (Reason == 'NatIsEmpty') then Notify('ERROR: The nationality parameter is empty, please create your character again!', 'TopRight', 10000) end
  if (Reason == 'BirthIsEmpty') then Notify('ERROR: The Birthdate parameter is empty, please create your character again!', 'TopRight', 10000) end
  if (Reason == 'NameError') then Notify('ERROR: You have a number in your name. Numbers are not suppose to be in your name. Please create your character again!', 'TopRight', 10000) end
  if (Reason == 'NatError') then Notify('ERROR: You have a number in your nationality. Numbers are not suppose to be in your nationality. Please create your character again!', 'TopRight', 10000) end
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Logout()
  local PedID = PedID()
  local Pos = GetCoords(PedID)
  local Coords = Encoded(Pos)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Steam, UserID, Coords } })
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', false)
  SetVisible(PedID, false)
  SetFreeze(PedID, true)

  -- Open MultiCharacters login screen
  TriggerEvent('DokusCore:MultiChar:ChooseChar')

  -- Reset the DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { 0 } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { false } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName', { nil } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharMoney', { 0 } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharGold', { 0 } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankMoney', { nil } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankGold', { nil } })
  TriggerEvent('DokusCore:CoreMenu:SetData',  { 'Logout' })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive', { false } })

  -- Reset Plugin Data
  TriggerEvent('DokusCore:Metabolism:UserLoggedOut')
  TriggerEvent('DokusCore:Inventory:User:Logout')

  -- Disable Radar and reset CharID
  DisplayRadar(false)
  UserID = 0
end























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
