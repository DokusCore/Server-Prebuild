--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Please do not remove this from this plugin. This is to take in memory one of
-- the greatest and much beloved roleplayers of RedM. We honor him by adding a
-- gravetone at Rhodes Chirch. When close you can start to watch the memorial
-- video that was made by the community he was in. We truely appreciate it if
-- this keeps left untouched.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  local BCoords = vector3(1286.5, -1232.0, 80.9)
  SetBlip(BCoords, 350569997, 1.0, "Pastor's Memorial Church")
  while true do Wait(3000)
    local PedID = PlayerPedId()
    local pCoords = GetEntityCoords(PedID)
    local Dist = Vdist(pCoords, BCoords)
    if ((Dist <= 5) and not (IsMemSongPlaying)) then PlayMemorialSong(BCoords) end
    if ((Dist > 5) and (IsMemSongPlaying)) then StopMemorialSong(BCoords) end
    if ((Dist <= 5) and not (DrawMemtext)) then DrawMemtext = true TriggerEvent('DokusCore:Guidance:DrawMemText', PedID) end
    if ((Dist > 5) and (DrawMemtext)) then DrawMemtext = false end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Guidance:DrawMemText', function(PedID)
  while DrawMemtext do Wait(1)
    local Control = IsControlJustPressed(0, _ActionKey)
    DrawText3D(1286.9, -1233.9, 81.0, 255,  'In Memorial of Pastor')
    DrawText3D(1286.9, -1233.9, 80.88, 255, 'For always in our memories')
    DrawText3D(1286.9, -1233.9, 80.76, 255, '20th May 2022 - Age 39')
    DrawText3D(1286.9, -1233.9, 80.64, 255, 'Rest well our friend')
    DrawText3D(1286.9, -1233.9, 80.52, 255, 'Press LALT to view the video')
    if (Control) then
      SendNUIMessage({ Action = 'SetLink', Link = 'https://dokuscore.com/pages/Pastor/MP4s/Pastor.mp4' })
      Wait(200) SendNUIMessage({ Action = 'Show' }) SetNuiFocus(true, true)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('close', function()
  local PedID = PedID()
  ClearPedTasks(PedID)
  SetNuiFocus(false, false) Wait(3500)
  ClearPedTasksImmediately(PedID)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
