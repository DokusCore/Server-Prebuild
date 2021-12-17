--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function CloseMenu()
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
function Notify(txt, pos, time)
  TriggerEvent("pNotify:SendNotification", {
    text = "<height='40' width='40' style='float:left; margin-bottom:10px; margin-left:20px;' />"..txt,
    type = "success", timeout = time, layout = pos, queue = "right"
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendVolumeWarning()
  if not (VolumeWarning) then
    VolumeWarning = true
    Notify('The volume of the music can be adjusted by your PCs volume mixer!')
    return
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function APWarning()
  AutoPlayWarning = true
  Notify('AutoPlay is now turned on! It will keep playing music until you stop it!', 'TopRight', 10000) Wait(11000)
  Notify('NOTE: The music list is containing copywrited music! Watch out if your streaming!', 'TopRight', 30000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetData() Data = TSC('DokusCore:Core:GetCoreUserData') return Data end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------












































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
