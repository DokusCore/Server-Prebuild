--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('StopMusic', function() TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'None', 0.0) SetAutoPlay = false AutoPlayWarning = false end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('PlayMusic', function(Data)
  if (SetMusic == 0) then NoteObjective("System Settings", "You've toggled music off in settings, unable to play music!", 'Alert', 5000) return end
  TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', Data.Option, SetVolume)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('AutoPlayMusic', function(Data)
  SetAutoPlay = true
  if (SetMusic == 0) then return NoteObjective("System Settings", "You've toggled music off in settings, unable to play music!", 'Alert', 5000) end
  while SetAutoPlay do Wait(0)
    if (Data.Option == 'All') then
      local R = math.random(#AutoplayList.All)
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', AutoplayList.All[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.All[R].Time)
    end

    if (Data.Option == 'TheScore') then
      local R = math.random(#AutoplayList.TheScore)
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', AutoplayList.TheScore[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.TheScore[R].Time)
    end

    if (Data.Option == 'WesternRDR') then
      local R = math.random(#AutoplayList.WesternRDR)
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', AutoplayList.WesternRDR[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.WesternRDR[R].Time)
    end

    if (Data.Option == 'BobMarley') then
      local R = math.random(#AutoplayList.BobMarley)
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', AutoplayList.BobMarley[R].Song, SetVolume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(AutoplayList.BobMarley[R].Time)
    end

    if (Data.Option == 'Others') then
      local R = math.random(#AutoplayList.Others)
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', AutoplayList.Others[R].Song, SetVolume)
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
 NoteObjective("Music Settings", 'Volume set to '..math.floor((SetVolume * 100))..'%', 'Check', 5000)
 NoteObjective("Music Settings", 'The volume will take effect on the next song!', 'Alert', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
