--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Characters:Start', function()
  local CharData = SetCharData()
  if (SkipCamp(CharData)) then return end
  PlaySong() DisplayRadar(false)
  if (not (CamCampSet)) then SetCampCamera() end
  SendPedToCamp(PedID())
  SetNuiFocus(true, true)
  SpawnPlayerPeds(CharData) Wait(4000)
  LoadAllPlayerPedSkins(CharData) Wait(5000)
  TriggerEvent('DokusCore:Clothing:NPC:Load:Clothing', NPCs, CharData)
  NetworkGhosting(PedID(), true)
  UIFadeIn(5000)
  TriggerEvent('DokusCore:Characters:SendWaring')
  WalkPlayerPedsToPosition()
  TaskPlayerPedsToScenario()
  if (not (CamPedsSet)) then CreatePedCams() end
  SendNUIMessage({ Type = 'Hide', Time = 500 }) Wait(500)
  SendNUIMessage({ Type = 'Show', Time = 1500 })
  SendNUIMessage({ Type = 'Load', Data = CharData })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Characters:BackToCamp', function()
  ActivateCampCam() ResetTheCampForNewChar()
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


























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  DisplayHud(true) DisplayRadar(true)
  SetCameraActive('CampCam', false) SetCameraActive('PedCam1', false)
  SetCameraActive('PedCam2', false) SetCameraActive('PedCam3', false)
  DestroyCam(CampCam) DestroyCam(PedCam1.Cam) DestroyCam(PedCam2.Cam) DestroyCam(PedCam3.Cam)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
