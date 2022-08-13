--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Guidance:GuideUp', function()
  local Hash = GetHashKey("WORLD_HUMAN_LEAN_BARREL")
  Citizen.InvokeNative(0x524B54361229154F, PedID(), Hash, 100000, true, false, false, false)
  Wait(10000)
  SendNUIMessage({ Action = 'SetLink', Link = 'https://dokuscore.com/pages/InGame/index.html'})
  Wait(200) SendNUIMessage({ Action = 'Show' }) SetNuiFocus(true, true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
