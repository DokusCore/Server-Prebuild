--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokusCore:Core:GetCoreData')
  return Data.FrameReady
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
























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
