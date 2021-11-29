--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
PlayerID = 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for user to connect to the servers
--------------------------------------------------------------------------------
CreateThread(function()
  while true do Wait(0)
    local Network = NetworkIsSessionStarted()
    SetInvisible(false, true)
    TSC('DokusCore:Core:Hud:Toggle', false)
    if Network then	TriggerEvent('DokusCore:MultiChar:ChooseChar') return end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Choose your character
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:MultiChar:ChooseChar')
AddEventHandler('DokusCore:MultiChar:ChooseChar', function()
  local PedID = PlayerPedId()
  local GetPed = GetPlayerPed(-1)
  SetNuiFocus(false, false)
  DoScreenFadeOut(1500) Wait(2000)
  SetEntityVisible(PedID, false)
  FreezeEntityPosition(PedID, true)
  SetEntityCoords(PedID, -355.6, 790.0, 100.2) Wait(1500)
  ShutdownLoadingScreenNui()
  ShutdownLoadingScreen() Wait(1)
  ShutdownLoadingScreenNui()
  ShutdownLoadingScreen()
  ToggleMenu(true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterCommand('logout', function(source, args, rawCommand)
  local PedID = PlayerPedId()
  local Coords = GetEntityCoords(PedID)
  local Encoded = json.encode(Coords)
  local User = TSC('DokusCore:Core:GetCoreUserData')
  TSC('DokusCore:Core:DBSet:Characters', { 'Coords', { User.Steam, PlayerID, Encoded } })
  TSC('DokusCore:Core:Hud:Toggle', false)
  SetEntityVisible(PedID, false)
  FreezeEntityPosition(PedID, true)
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
  TSC('DokusCore:Core:SetCoreUserData', { 'CharID', { 0 } })
  PlayerID = 0
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Register client callback to fetch the current CharID when the Core restarts
--------------------------------------------------------------------------------
RCC('DokusCore:MultiChar:SyncCharID', function(args) return PlayerID end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------









--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
