--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Steam, CharID, InMenu = nil, 0, ''
SetMusic, SetVolume = 0, 0.3
SetAutoPlay, AutoPlayWarning = false, false
Language = ''
local Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set Users SteamID
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.SettingsMenu) then
    Notify('Setting Menu Loading....', 'topCenter', 2500)
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Core:GetCoreUserData')
    Steam, CharID = Data.Steam, Data.CharID
    local Data = TSC('DokusCore:Core:DBGet:Settings', { 'User', { Steam } })
    if (Data.Exist) then
      local Result = Data.Result[1]
      SetVolume = Result.Volume
      Language = Result.Language
      SetMusic = Result.Music
    end
  end
  Notify('Setting Menu Initialized!', 'topCenter', 3000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function() Wait(3000)
  if (_Modules.SettingsMenu) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
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
RegisterNetEvent('DokusCore:CoreMenu:SetData')
AddEventHandler('DokusCore:CoreMenu:SetData', function(Data)
  if (Low(Data[1]) == 'logout') then
    CharID = 0
    Notify('SettingsMenu: User Data Reset due to being logged out')
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Core:GetCoreUserData')
    Steam, CharID = Data.Steam, Data.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
