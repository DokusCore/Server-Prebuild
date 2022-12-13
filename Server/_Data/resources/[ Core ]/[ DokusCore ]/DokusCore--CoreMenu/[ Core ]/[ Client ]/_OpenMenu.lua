--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenMenu', function(Data)
  if (Data.Menu == 'UserMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.UserMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'InfoMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.InfoMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'AdminMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.AdminMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'TeleportMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.TeleportMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'ModuleSyncMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.ModuleSyncMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'CharacterMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.CharacterMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'SkinMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.SkinMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'SettingsMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.SettingsMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'LangList1') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.LangList1 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'LangList2') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.LangList2 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'LangList3') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.LangList3 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'MusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.MusicMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'Playlist') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.Playlist })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'ModernMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.ModernMusicMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'WesternMusicMenu') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.WesternMusicMenu })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'Volume') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.Volume })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'Volume2') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.Volume2 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'Volume3') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.Volume3 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'Volume4') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.Volume4 })
    SendNUIMessage({ Action = 'OpenMenu' })
  end

  -- Music Lists
  if (Data.Menu == 'BobMarley') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Modern.BobMarley })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'TheScore') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Modern.TheScore })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'ModernOtherMusic') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Modern.ModernOtherMusic })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'WesternRDR1') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Western.WesternRDR1 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'WesternRDR2') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Western.WesternRDR2 })
    SendNUIMessage({ Action = 'OpenMenu' })
  elseif (Data.Menu == 'WesternRDR3') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMusic.Music.Western.WesternRDR3 })
    SendNUIMessage({ Action = 'OpenMenu' })
  end

  -- Character Deletion
  if (Data.Menu == 'DelCharacter') then
    SendNUIMessage({ Action = 'SetMenu',   Menu = Data.Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.DelCharacter })
    SendNUIMessage({ Action = 'OpenMenu' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
