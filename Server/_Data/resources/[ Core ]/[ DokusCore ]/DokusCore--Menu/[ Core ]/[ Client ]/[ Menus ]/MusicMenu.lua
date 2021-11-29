--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ToggleMusic', function()
  local Steam = TSC('DokusCore:Core:GetCoreUserData').Steam
  local Music = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Steam } })
  if (Music.Result[1].Music == 1) then SetMusic = 0 end
  if (Music.Result[1].Music == 0) then SetMusic = 1 end
  TSC('DokusCore:Core:DBSet:Settings', { 'Music', { Steam, SetMusic } })

  if (SetMusic == 0) then Notify('All in game music has turned off!', 'topCenter', 5000) end
  if (SetMusic == 1) then Notify('All in game music has turned on!', 'topCenter', 5000) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
