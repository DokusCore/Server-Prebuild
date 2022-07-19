--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Characters:Start', function()
  local CharData = SetCharData()
  if (SkipCamp(CharData)) then return end
  PlaySong() DisplayRadar(false) --DisplayHud(false)
  if (not (CamCampSet)) then SetCampCamera() end
  SetNuiFocus(true, true)
  SpawnPlayerPeds(CharData)
  LoadAllPlayerPedSkins(CharData)
  NetworkGhosting(PedID(), true)
  SendPedToCamp(PedID())
  UIFadeIn(5000)
  TriggerEvent('DokusCore:Characters:SendWaring')
  WalkPlayerPedsToPosition()
  -- SendNUIMessage({ Type = 'Reload' }) Wait(500)
  -- SendNUIMessage({ Type = 'Show',   Time = 3000 })
  TaskPlayerPedsToScenario()
  if (not (CamPedsSet)) then CreatePedCams() Wait(8000) end
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
RegisterNetEvent('DokusCore:Characters:SendWaring', function()
    DisplayHud(true)
    NoteObjective('WARNING', 'Only make 1 character per server login! Making a 2nd character on the same login will break the skin creator!', 'Horn', 10000)
    NoteObjective('WARNING', 'We are investigating the issue and patch it in a later version!', 'Horn', 7000) Wait(1000)
    DisplayHud(false)
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
