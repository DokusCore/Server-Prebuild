--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Close', function() ResetAllMenus() CloseMenu() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoNextButton', function() NoteObjective("System", "No next page at the moment", 'Horn', 5000) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoBackButton', function() NoteObjective("System", "No back page at the moment", 'Horn', 5000) end)
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
RegisterNUICallback('SyncUsableItems', function(Data) TriggerEvent('DokusCore:UsableItems:Sync') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SyncStoreItems', function(Data) TriggerEvent('DokusCore:Stores:ReSyncStoreItems') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('WeatherSyncMenu', function(Data) TriggerServerEvent('DokusCore:WeatherSync:OpenMenu') end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ChangeLanguage', function(Data) return TriggerEvent('DokusCore:Core:Commands:SetLanguage', Data.Option) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SaveCoords', function()
  local Pos = GetCoords(PedID())
  local Coords = Encoded(Pos)
  if (CharID == 0) then return RestartError() end
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { SteamID, CharID, Coords } })
  NoteObjective("System", "You've saved your coordinates!", 'Check', 5000)
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
    if (User.Skin == '--') then return NoteObjective("Error", "You've no skin to load! Please create a skin first with /skin menu", 'Alert', 5000) end
    TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
    TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  CloseMenu()
  SendNUIMessage({ Action = 'CloseMenu' })
  NoteObjective("Logging Out", 'Logging Out, and saving coords', 'Horn', 5000)
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
  if (SetMusic == 0) then NoteObjective('System', 'All in game music has turned off!', 'Success', 5000) end
  if (SetMusic == 1) then NoteObjective('System', 'All in game music has turned on!', 'Success', 5000) end
  if (SetMusic == 0) then TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'None', 0.0) end
end)
--------------------------------------------------------------------------------
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
RegisterNUICallback('SetVolume', function(Data)
 SetVolume = Data.Option
 TriggerServerEvent('DokusCore:Core:DBSet:Settings', { 'Volume', { SteamID, SetVolume } })
 NoteObjective("Music Settings", 'Volume set to '..math.floor((SetVolume * 100))..'%', 'Check', 5000)
 NoteObjective("Music Settings", 'The volume will take effect on the next song!', 'Alert', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DelCharacter', function(Data)
  if (Data.Option) then
    NoteObjective("System", "Character deletion in progress", "Horn", 1500)
    TriggerServerEvent('DokusCore:Core:DBDel:Characters', { 'User', 'Single', { SteamID, CharID } })
    NoteObjective("System", "Character Table Data Deleted", "Check", 1500)
    TriggerServerEvent('DokusCore:Core:DBDel:Banks', { 'User', 'Single', { SteamID, CharID } })
    NoteObjective("System", "Character Bank Accounts Deleted", "Check", 1500)
    TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'All', { SteamID, CharID } })
    NoteObjective("System", "Character Inventories Deleted", "Check", 1500)
    TriggerServerEvent('DokusCore:Core:DBDel:Metabolism', { 'User', 'Single', { SteamID, CharID } })
    NoteObjective("System", "Character Metabolism Deleted", "Check", 1500)
    NoteObjective("System", "All character information is purged, we are bringing you back to the character selection menu", "Horn", 10000)
    SetVisible(PedID(), false)
    SetInvincible(PedID(), true)
    TriggerEvent('DokusCore:Characters:BackToCamp')
  else
    SendNUIMessage({ Action = 'SetMenu',   Menu = Menu })
    SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.CharacterMenu  })
    SendNUIMessage({ Action = 'OpenMenu' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DelCharComfirm', function(Data)
  NoteObjective("System", "This feature is currently in development!", "Horn", 5000)
  -- NoteObjective("WARNING", "You're going to delete your character, this also deletes everything associated with this character!", "Horn", 7000)
  -- NoteObjective("WARNING", "Are you absolutely sure?", "Horn", 5000)
  -- IsAnyMenuOpen = true
  -- SetNuiFocus(true, true)
  -- SendNUIMessage({ Action = 'SetMenu',   Menu = 'DelCharacter' })
  -- SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.DelCharacter  })
  -- SendNUIMessage({ Action = 'OpenMenu' })
  IsAnyMenuOpen = true
  SetNuiFocus(true, true)
  SendNUIMessage({ Action = 'SetMenu',   Menu = 'CharacterMenu' })
  SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.CharacterMenu  })
  SendNUIMessage({ Action = 'OpenMenu' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
