--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function CloseMenu()
  MenuOpen = false
  TSC('DokusCore:Core:Hud:Toggle', true)
  SetNuiFocus(false, false)
  DisplayRadar(true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenMenu()
  TSC('DokusCore:Core:Hud:Toggle', false)
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
function Notify(txt, pos, time)
  TriggerEvent("pNotify:SendNotification", {
    text = "<height='40' width='40' style='float:left; margin-bottom:10px; margin-left:20px;' />"..txt,
    type = "success", timeout = time, layout = pos, queue = "right"
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetData() UserData = TSC('DokusCore:Core:GetCoreUserData') return UserData end
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
--   print("logging", Coords)
--   Cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Coords, 0.0, GetGameplayCamFov())
--   SetCamActive(Cam, true)
--   RenderScriptCams(true, true, 2000, true, false)
-- end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
