--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SelectedChar', function(Data)
  if (Data.CharID == 1) then TransitionCamera(PedCam1, NPCs[1]) end
  if (Data.CharID == 2) then TransitionCamera(PedCam2, NPCs[2]) end
  if (Data.CharID == 3) then TransitionCamera(PedCam3, NPCs[3]) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('EnterWorld', function(Data)
  if (Data.CharID == nil) then return Error('NoCharSelected') end
  if (Data.CharID == 0)   then return Error('NoCharSelected') end
  SendNUIMessage({ Type = 'Hide', Time = 3000 }) Wait(3500)
  UIFadeOut(5000) Wait(5000) SetNuiFocus(false, false)
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { Data.CharID } })
  RenderScriptCams(false, false, 1, true, true)
  NetworkGhosting(PedID(), false)
  TriggerEvent('DokusCore:Spawner:User:Login')
  CreateLog('DokusCore', 'Join', 'User joined the server')
  
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  NPCs = {}

  Wait(5000)
  TriggerEvent('DokusCore:Core:MP:Music:MusicFade')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CreateCharacter', function(Data)
  SendNUIMessage({ Type = 'Hide', Time = 3000 })
  SetNuiFocus(false, false)
  Wait(1500) UIFadeOut(5000) Wait(5500)
  SetCameraActive('CampCam', false)
  SetCameraActive('PedCam1', false)
  SetCameraActive('PedCam2', false)
  SetCameraActive('PedCam3', false)
  CamPedsSet = false
  RenderScriptCams(false, false, 1, true, true)
  TriggerEvent('DokusCore:Skins:User:New', (#NPCs + 1))
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { (#NPCs + 1) } })
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  NPCs = {}
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
