--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ToggleMusic', function()
  local Music = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Steam } })
  if (Music.Result[1].Music == 1) then SetMusic = 0 end
  if (Music.Result[1].Music == 0) then SetMusic = 1 end
  TriggerServerEvent('DokusCore:Core:DBSet:Settings', { 'Music', { Steam, SetMusic } })
  SetAutoPlay = false AutoPlayWarning = false
  if (SetMusic == 0) then Notify('All in game music has turned off!', 'topCenter', 5000) end
  if (SetMusic == 1) then Notify('All in game music has turned on!', 'topCenter', 5000) end
  if (SetMusic == 0) then TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'None', 0.0) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
