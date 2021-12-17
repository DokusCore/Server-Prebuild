--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ToggleMusic', function()
  local Steam = TSC('DokusCore:Core:GetCoreUserData').Steam
  local Music = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Steam } })
  if (Music.Result[1].Music == 1) then SetMusic = 0 end
  if (Music.Result[1].Music == 0) then SetMusic = 1 end
  TSC('DokusCore:Core:DBSet:Settings', { 'Music', { Steam, SetMusic } })
  AutoPlay = false AutoPlayWarning = false
  if (SetMusic == 0) then Notify('All in game music has turned off!', 'topCenter', 5000) end
  if (SetMusic == 1) then Notify('All in game music has turned on!', 'topCenter', 5000) end
  if (SetMusic == 0) then TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'None', 0.0) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('PlayMusic', function(Data)
  if (SetMusic == 0) then Notify("You've toggled music off in settings, unable to play music!") return end
  TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', Data.Song, Volume)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('AutoPlayMusic', function(Data)
  AutoPlay = true
  if (SetMusic == 0) then return Notify("You've toggled music off in settings, unable to play music!") end
  while AutoPlay do Wait(0)
    if (Data.Type == 'All') then
      local R = math.random(#AutoplayList.All)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.All[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.All[R].Time)
    end

    if (Data.Type == 'TheScore') then
      local R = math.random(#AutoplayList.TheScore)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.TheScore[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.TheScore[R].Time)
    end

    if (Data.Type == 'WesternRDR') then
      local R = math.random(#AutoplayList.WesternRDR)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.WesternRDR[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.WesternRDR[R].Time)
    end

    if (Data.Type == 'BobMarley') then
      local R = math.random(#AutoplayList.BobMarley)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.BobMarley[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.BobMarley[R].Time)
    end

    if (Data.Type == 'Others') then
      local R = math.random(#AutoplayList.Others)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.Others[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.Others[R].Time)
    end

  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetVolume', function(Data)
 Volume = Data.Vol Notify('Volume set to '..math.floor((Volume * 100))..'%', 'topCenter', 5000)
 Wait(5500) Notify('The volume will take effect on the next song!', 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
