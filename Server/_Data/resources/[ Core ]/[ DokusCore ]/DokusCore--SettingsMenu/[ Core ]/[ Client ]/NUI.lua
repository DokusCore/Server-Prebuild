--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Close', function() CloseMenu() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetMenu', function(Data) InMenu = Data.Menu end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenInventory', function() TriggerEvent('DokusCore:Inventory:OpenInventory') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('StopMusic', function() TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'None', 0.0) AutoPlay = false AutoPlayWarning = false end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoNextButton', function() Notify("No next page at the moment", 'topCenter', 5000) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoBackButton', function() Notify("No back page at the moment", 'topCenter', 5000) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenMenu', function(Data)
  if (Data.Menu == 'MainMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'MainMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.MainMenu[1] })
  elseif (Data.Menu == 'SettingsMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'SettingsMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.SettingsMenu[1] })
  elseif (Data.Menu == 'FunctionsMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'FunctionsMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.FunctionsMenu[1] })
  elseif (Data.Menu == 'MusicMenu') then
    SendVolumeWarning()
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'MusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.MusicMenu[1] })
  elseif (Data.Menu == 'AutoPlay') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AutoPlay' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.AutoPlay[1] })
  elseif (Data.Menu == 'AutoPlaylistMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AutoPlaylistMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.AutoPlaylistMenu[1] })
  elseif (Data.Menu == 'Playlist') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Playlist' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.Playlist[1] })
  elseif (Data.Menu == 'ModernMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.ModernMusicMenu[1] })
  elseif (Data.Menu == 'ModernMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.ModernMusicMenu[1] })
  elseif (Data.Menu == 'WesternMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.WesternMusicMenu[1] })
  end

  -- Language Menus
  if (Data.Menu == 'LangList1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'LangList1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.LangList1[1] })
  elseif (Data.Menu == 'LangList2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'LangList2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.LangList2[1] })
  end

    -- Music Menu's -- Western
  if (Data.Menu == 'WesternRDR1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.WesternRDR1[1] })
  elseif (Data.Menu == 'WesternRDR2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.WesternRDR2[1] })
  elseif (Data.Menu == 'WesternRDR3') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR3' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.WesternRDR3[1] })
  end

  -- Music Menu's -- Modern
  if (Data.Menu == 'BobMarley') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'BobMarley' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.BobMarley[1] })
  elseif (Data.Menu == 'TheScore1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'TheScore1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.TheScore1[1] })
  elseif (Data.Menu == 'ModernOtherMusic') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernOtherMusic' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.ModernOtherMusic[1] })
  end

  -- Volume Menu
  if (Data.Menu == 'Volume') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.Volume[1] })
  elseif (Data.Menu == 'Volume2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.Volume2[1] })
  elseif (Data.Menu == 'Volume3') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume3' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.Volume3[1] })
  elseif (Data.Menu == 'Volume4') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume4' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = _DokusMenus.Volume4[1] })
  end
end)
--------------------------------------------------------------------------------
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
      local R = math.random(#_DokusMenus.AutoplayList.All)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', _DokusMenus.AutoplayList.All[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(_DokusMenus.AutoplayList.All[R].Time)
    end

    if (Data.Type == 'TheScore') then
      local R = math.random(#_DokusMenus.AutoplayList.TheScore)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', _DokusMenus.AutoplayList.TheScore[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(_DokusMenus.AutoplayList.TheScore[R].Time)
    end

    if (Data.Type == 'WesternRDR') then
      local R = math.random(#_DokusMenus.AutoplayList.WesternRDR)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', _DokusMenus.AutoplayList.WesternRDR[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(_DokusMenus.AutoplayList.WesternRDR[R].Time)
    end

    if (Data.Type == 'BobMarley') then
      local R = math.random(#_DokusMenus.AutoplayList.BobMarley)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', _DokusMenus.AutoplayList.BobMarley[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(_DokusMenus.AutoplayList.BobMarley[R].Time)
    end

    if (Data.Type == 'Others') then
      local R = math.random(#_DokusMenus.AutoplayList.Others)
      TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', _DokusMenus.AutoplayList.Others[R].Song, Volume)
      if not (AutoPlayWarning) then APWarning() end
      Wait(_DokusMenus.AutoplayList.Others[R].Time)
    end

  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ChangeLanguage', function(Data)
  Language = Data.Lang
  local Steam = TSC('DokusCore:Core:GetCoreUserData').Steam
  TSC('DokusCore:Core:DBSet:Settings', { 'Language', { Steam, Language } })
  Notify("You'r language has been set to [ "..Language.." ]")
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetVolume', function(Data)
 Volume = Data.Vol Notify('Volume set to '..math.floor((Volume * 100))..'%', 'topCenter', 5000)
 Wait(5500) Notify('The volume will take effect on the next song!', 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  Notify('Logging Out, and saving coords')
  TriggerEvent('DokusCore:MultiChar:Logout')
  SendNUIMessage({ Action = 'CloseMenu' }) CloseMenu()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SaveCoords', function()
  local PedID = PlayerPedId()
  local Coords = GetEntityCoords(PedID)
  local Encoded = json.encode(Coords)
  local User = TSC('DokusCore:Core:GetCoreUserData')
  TSC('DokusCore:Core:DBSet:Characters', { 'Coords', { User.Steam, User.CharID, Encoded } })
  Notify("You've saved your coordinates!", 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
