--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('StopMusic', function() TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'None', 0.0) SetAutoPlay = false AutoPlayWarning = false end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('PlayMusic', function(Data)
  if (SetMusic == 0) then Notify("You've toggled music off in settings, unable to play music!") return end
  TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', Data.Option, SetVolume)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('AutoPlayMusic', function(Data)
  SetAutoPlay = true
  if (SetMusic == 0) then return Notify("You've toggled music off in settings, unable to play music!") end
  while SetAutoPlay do Wait(0)
    if (Data.Option == 'All') then
      local R = math.random(#AutoplayList.All)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.All[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.All[R].Time)
    end

    if (Data.Option == 'TheScore') then
      local R = math.random(#AutoplayList.TheScore)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.TheScore[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.TheScore[R].Time)
    end

    if (Data.Option == 'WesternRDR') then
      local R = math.random(#AutoplayList.WesternRDR)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.WesternRDR[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.WesternRDR[R].Time)
    end

    if (Data.Option == 'BobMarley') then
      local R = math.random(#AutoplayList.BobMarley)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.BobMarley[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.BobMarley[R].Time)
    end

    if (Data.Option == 'Others') then
      local R = math.random(#AutoplayList.Others)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', AutoplayList.Others[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.Others[R].Time)
    end

  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetVolume', function(Data)
 SetVolume = Data.Option
 TriggerServerEvent('DokusCore:Core:DBSet:Settings', { 'Volume', { Steam, SetVolume } })
 Notify('Volume set to '..math.floor((SetVolume * 100))..'%', 'topCenter', 5000)
 Wait(5500) Notify('The volume will take effect on the next song!', 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
