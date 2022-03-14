--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function CloseMenu()
  MenuOpen = false
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', true)
  SetNuiFocus(false, false)
  DisplayRadar(true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenMenu()
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', false)
  SetNuiFocus(true, true)
  DisplayRadar(false)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Menu(Name, Menus, Dialog, TitleName)
  SendNUIMessage({ Action = 'SetMenu',  Menu = Name }) OpenMenu()
  SendNUIMessage({ Action = 'OpenMenu', Menu = Menus, Dialog = Dialog, TitleName = TitleName })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetData() UserData = TCTCC('DokusCore:Core:GetCoreUserData') return UserData end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- function EndCam()
-- 	ClearFocus()
-- 	RenderScriptCams(false, true, 2000, true, false)
-- 	DestroyCam(Cam, false)
-- 	Cam = nil
-- end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- function StartCam(Coords)
--   Cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Coords, 0.0, GetGameplayCamFov())
--   SetCamActive(Cam, true)
--   RenderScriptCams(true, true, 2000, true, false)
-- end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
