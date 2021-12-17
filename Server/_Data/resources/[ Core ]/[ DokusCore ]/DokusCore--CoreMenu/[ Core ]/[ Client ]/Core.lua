--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Data = nil
InMenu = ''
SetMusic = 0
Volume = 0.3
AutoPlay = false
AutoPlayWarning = false
Language = ''
VolumeWarning = false
VolumeCooldown = 60
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  Notify('Setting Menu Loading....', 'topCenter', 2500) Wait(3000)
  Notify('Setting Menu Initialized!', 'topCenter', 3000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function() Wait(3000)
  if (_Modules.SettingsMenu) then
    while true do Wait(0)
      local Control = IsControlJustReleased(0, _Keys['TAB'])
      if (Control) then
        InMenu = 'MainMenu'
        local Menu = MainMenu[1].MenuName
        SendNUIMessage({ Action = 'SetMenu',  Menu = Menu }) OpenMenu()
        SendNUIMessage({ Action = 'OpenMenu', Menu = MainMenu[1] })
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.SettingsMenu) then
    while true do Wait(2000)
      while (VolumeWarning) do Wait(1000)
        VolumeCooldown = (VolumeCooldown - 1)
        if (VolumeCooldown <= 0) then
          VolumeCooldown = 20
          VolumeWarning = false
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Needs a Fix -- this only needs to be called as soon as the player has
-- chosen his/her character from the multi character plugin
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.SettingsMenu) then
    while true do Wait(1000)
      while (Data == nil) do Wait(1000) GetData() end
      while (Data.CharID == 0) do Wait(1000) GetData() end
      local Steam = TSC('DokusCore:Core:GetCoreUserData').Steam
      local Data = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Steam }})
      SetMusic = Data.Result[1].Music
      Language = Data.Result[1].Language
      Notify('Setting menu is synced with the database information!')
      return
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
