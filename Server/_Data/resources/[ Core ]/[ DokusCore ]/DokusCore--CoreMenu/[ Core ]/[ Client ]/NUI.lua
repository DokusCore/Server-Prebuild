--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Close', function() ResetAllMenus() CloseMenu() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoNextButton', function() NoteObjective(SYS("System").MSG, MSG("NoNextPage").MSG, 'Horn', Floor(MSG("NoNextPage").Time * 1000)) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoBackButton', function() NoteObjective(SYS("System").MSG, MSG("NoBackPage").MSG, 'Horn', Floor(MSG("NoNextPage").Time * 1000)) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ShowDiscord', function() TriggerEvent('DokusCore:Core:Commands:Discord') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('GuideUp', function() TriggerEvent('DokusCore:Guidance:GuideUp') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Teleport', function(Data)
  if (Data.Option == 'TPM') then TriggerEvent('DokusCore:Core:Admin:Commands:TPM') CloseMenu() return end
  if (Data.Option == 'TTC') then TriggerEvent('DokusCore:Core:Admin:Commands:TeleportTC') CloseMenu() return end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SyncUsableItems', function(Data) TriggerEvent('DokusCore:UsableItems:Sync:Items') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SyncStoreItems', function(Data) TriggerEvent('DokusCore:Stores:ReSyncStoreItems') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('WeatherSyncMenu', function(Data) TriggerServerEvent('DokusCore:WeatherSync:OpenMenu') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('GodMode', function() TriggerEvent('DokusCore:Core:Admin:Commands:GodMode') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SpawnHorse', function() TriggerEvent('DokusCore:Stables:Admin:SpawnHorse') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ChangeLanguage', function(Data)
  Language = TS(Data.Option)
  TriggerEvent('DokusCore:Core:Commands:SetLanguage', TS(Data.Option))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SaveCoords', function()
  local Pos = GetCoords(PedID())
  local Coords = Encoded(Pos)
  if (CharID == 0) then return RestartError() end
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Sync.SteamID, Sync.CharID, Coords } })
  NoteObjective(SYS("System").MSG, MSG("CoordsSave").MSG, 'Check', Floor(MSG("CoordsSave").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SkinMenu', function(Data)
  if (Data.Option == 'OpenMenu') then
    -- TriggerEvent('DokusCore:Skins:Open:Menu')
    NoteObjective("System", "This function is currently unavailable", 'Horn', 5000)
  elseif (Data.Option == 'LoadSkin') then
    if (CharID == 0) then return RestartError() end
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
    if (User.Skin == '--') then return NoteObjective(MSG("Error").MSG, MSG("ErrSkin").MSG, 'Alert', Floor(MSG("ErrSkin").Time * 1000)) end
    TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
    TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  CloseMenu()
  local Pos = GetCoords(PedID())
  local Coords = Encoded(Pos)
  if (CharID == 0) then return RestartError() end
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { SteamID, CharID, Coords } })
  SendNUIMessage({ Action = 'CloseMenu' })
  NoteObjective(MSG("LogOut").MSG, MSG("LogOutCoords").MSG, 'Horn', Floor(MSG("LogOutCoords").Time * 1000))
  TriggerEvent('DokusCore:Characters:BackToCamp')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ToggleMusic', function()
  local Music = TSC('DokusCore:Core:DBGet:Settings', { 'User', { SteamID } })
  if (Music.Result[1].Music == 1) then SetMusic = 0 end
  if (Music.Result[1].Music == 0) then SetMusic = 1 end
  TriggerServerEvent('DokusCore:Core:DBSet:Settings', { 'Music', { SteamID, SetMusic } })
  SetAutoPlay = false AutoPlayWarning = false
  if (SetMusic == 0) then NoteObjective(SYS("System").MSG, MSG("MusicOn").MSG, 'Horn', Floor(MSG("MusicOn").Time * 1000)) end
  if (SetMusic == 1) then NoteObjective(SYS("System").MSG, MSG("MusicOff").MSG, 'Horn', Floor(MSG("MusicOff").Time * 1000)) end
  if (SetMusic == 0) then TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'None', 0.0) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('StopMusic', function() TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'None', 0.0) SetAutoPlay = false AutoPlayWarning = false end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('PlayMusic', function(Data)
  if (SetMusic == 0) then NoteObjective(SYS("System").MSG, MSG("MusicUnable").MSG, 'Alert', Floor(MSG("MusicUnable").Time * 1000)) return end
  TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', Data.Option, SetVolume)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetVolume', function(Data)
 SetVolume = Data.Option
 TriggerServerEvent('DokusCore:Core:DBSet:Settings', { 'Volume', { SteamID, SetVolume } })
 NoteObjective(SYS("System").MSG, MSG("VolSet").MSG .. Floor((SetVolume * 100)), 'Check', Floor(MSG("VolSet").Time * 1000))
 NoteObjective(SYS("System").MSG, MSG("VolSet2").MSG, 'Alert', Floor(MSG("VolSet2").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DelCharacter', function(Data)
  if (Data.Option) then
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'All', { Sync.SteamID } })
    if (User.Exist) then
      if (#User.Result <= 1) then
        NoteObjective(SYS("System").MSG, "You can't delete your last character, please create a new one first!", "Horn", 7000)
        return
      else
        NoteObjective(SYS("System").MSG, MSG("CharDel").MSG, "Horn", Floor(MSG("CharDel").Time * 1000))
        TriggerServerEvent('DokusCore:Core:DBDel:Characters', { 'User', 'Single', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Banks', { 'User', 'Single', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'All', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Metabolism', { 'User', 'Single', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Outfits', { 'User', 'Single', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Boats', { 'User', 'All', 'Char', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Stables', { 'User', 'All', 'Char', { SteamID, CharID } })
        TriggerServerEvent('DokusCore:Core:DBDel:Weapons', { 'User', 'All', 'Char', { SteamID, CharID } })

        NoteObjective(SYS("System").MSG, MSG("DelDone").MSG, "Horn", Floor(MSG("DelDone").Time * 1000))
        SetVisible(PedID(), false)
        SetInvincible(PedID(), true)
        TriggerEvent('DokusCore:Characters:BackToCamp')
      end
    end
  else
    SendNUIMessage({ Action = 'SetMenu',   Menu = Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.CharacterMenu  })
    SendNUIMessage({ Action = 'OpenMenu' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DelCharComfirm', function(Data)
  NoteObjective("WARNING", "You're going to delete your character, this also deletes everything associated with this character!", "Horn", 7000)
  NoteObjective("WARNING", "Are you absolutely sure?", "Horn", 5000)
  IsAnyMenuOpen = true
  SetNuiFocus(true, true)
  SendNUIMessage({ Action = 'SetMenu',   Menu = 'DelCharacter' })
  SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.DelCharacter  })
  SendNUIMessage({ Action = 'OpenMenu' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
