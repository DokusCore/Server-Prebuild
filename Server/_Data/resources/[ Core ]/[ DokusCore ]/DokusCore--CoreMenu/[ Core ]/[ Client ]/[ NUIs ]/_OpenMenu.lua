--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenMenu', function(Data)
  if (Data.Menu == 'MainMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'MainMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = MainMenu[1] })
  elseif (Data.Menu == 'SettingsMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'SettingsMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = SettingsMenu[1] })
  elseif (Data.Menu == 'FunctionsMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'FunctionsMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = FunctionsMenu[1] })
  elseif (Data.Menu == 'InfoMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'InfoMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = InfoMenu[1] })
  elseif (Data.Menu == 'SkinMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'SkinMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = SkinMenu[1] })
  elseif (Data.Menu == 'MusicMenu') then
    -- SendVolumeWarning()
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'MusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = MusicMenu[1] })
  elseif (Data.Menu == 'AutoPlay') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AutoPlay' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = AutoPlay[1] })
  elseif (Data.Menu == 'AutoPlaylistMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AutoPlaylistMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = AutoPlaylistMenu[1] })
  elseif (Data.Menu == 'Playlist') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Playlist' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = Playlist[1] })
  elseif (Data.Menu == 'ModernMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = ModernMusicMenu[1] })
  elseif (Data.Menu == 'ModernMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = ModernMusicMenu[1] })
  elseif (Data.Menu == 'WesternMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternMusicMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = WesternMusicMenu[1] })
  end
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- Resync on DokusCore restart
  --------------------------------------------------------------------------------
  -- Admin Menu
  if (Data.Menu == 'AdminMenu') then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    local IsAdmin = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Data.SteamID, Data.CharID }}).Result[1].Group
    if (string.lower(IsAdmin) == 'user') then return Notify("ERROR: Unable to open this menu, you're not a admin!") end
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AdminMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = AdminMenu[1] })
  elseif (Data.Menu == 'TeleportMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'TeleportMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = TeleportMenu[1] })
  elseif (Data.Menu == 'AdminSelfActionsMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AdminSelfActionsMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = AdminSelfActionsMenu[1] })
  elseif (Data.Menu == 'AdminMetamolismMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'AdminMetamolismMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = AdminMetamolismMenu[1] })
  elseif (Data.Menu == 'ModuleSyncMenu') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModuleSyncMenu' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = ModuleSyncMenu[1] })
  end

  -- Language Menus
  if (Data.Menu == 'LangList1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'LangList1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = LangList1[1] })
  elseif (Data.Menu == 'LangList2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'LangList2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = LangList2[1] })
  end

    -- Music Menu's -- Western
  if (Data.Menu == 'WesternRDR1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = WesternRDR1[1] })
  elseif (Data.Menu == 'WesternRDR2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = WesternRDR2[1] })
  elseif (Data.Menu == 'WesternRDR3') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'WesternRDR3' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = WesternRDR3[1] })
  end

  -- Music Menu's -- Modern
  if (Data.Menu == 'BobMarley') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'BobMarley' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = BobMarley[1] })
  elseif (Data.Menu == 'TheScore1') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'TheScore1' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = TheScore1[1] })
  elseif (Data.Menu == 'ModernOtherMusic') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'ModernOtherMusic' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = ModernOtherMusic[1] })
  end

  -- Volume Menu
  if (Data.Menu == 'Volume') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = Volume[1] })
  elseif (Data.Menu == 'Volume2') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume2' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = Volume2[1] })
  elseif (Data.Menu == 'Volume3') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume3' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = Volume3[1] })
  elseif (Data.Menu == 'Volume4') then
    SendNUIMessage({ Action = 'SetMenu',  Menu = 'Volume4' })
    SendNUIMessage({ Action = 'OpenMenu', Menu = Volume4[1] })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
