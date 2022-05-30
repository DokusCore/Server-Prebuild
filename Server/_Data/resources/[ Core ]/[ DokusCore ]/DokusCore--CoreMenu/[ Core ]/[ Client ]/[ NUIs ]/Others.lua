--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Close', function() CloseMenu() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetMenu', function(Data) InMenu = Data.Menu end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoNextButton', function() NoteObjective("Core System", "No next page at the moment", 'Alert', 5000) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoBackButton', function() NoteObjective("Core System", "No back page at the moment", 'Alert', 5000) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenInventory', function()
  -- Notify("UNDER CONSTRUCTION", 'topCenter')
  TriggerEvent('DokusCore:Inventory:OpenInventory')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Clicks = 0
local ClickTC = 0
local CCRunning = false
RegisterNUICallback('Cooldown', function()
  Clicks = (Clicks + 1)
  if not (CCRunning) then
    CCRunning = true
    TriggerEvent('DokusCore:CoreMenu:AntiClickAbuse')
  end
end)

RegisterNetEvent('DokusCore:CoreMenu:AntiClickAbuse')
AddEventHandler('DokusCore:CoreMenu:AntiClickAbuse', function()
  while CCRunning do Wait(100)
    ClickTC = (ClickTC + 1)
    if (ClickTC >= 10) then ClickTC = 0 CCRunning = false Clicks = 0 end
    if ((ClickTC < 10) and (Clicks >= 5)) then
      CCRunning = false
      local Player = GetPlayerServerId(PlayerId(-1))
      TriggerServerEvent('DokusCore:Core:KickPlayer', { Player, ' [ AUTO KICK ]: Do not spawm DokusCore Menu!' })
      return
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
