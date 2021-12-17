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
local Clicks = 0
local ClickTC = 0
local CCRunning = false
RegisterNUICallback('Cooldown', function()
  Clicks = (Clicks + 1)
  if not (CCRunning) then CCRunning = true TriggerEvent('DokusCore:CoreMenu:AntiClickAbuse') end
end)

RegisterNetEvent('DokusCore:CoreMenu:AntiClickAbuse')
AddEventHandler('DokusCore:CoreMenu:AntiClickAbuse', function()
  while CCRunning do Wait(100)
    ClickTC = (ClickTC + 1)
    if (ClickTC >= 10) then ClickTC = 0 CCRunning = false Clicks = 0 end
    if ((ClickTC < 10) and (Clicks >= 5)) then
       TSC('DokusCore:Core:KickPlayer', { GetPlayerServerId(PlayerId(-1)), ' [ AUTO KICK ]: Do not spawm DokusCore Menu!' })
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
