--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Play random scenarios depending where you are on the map
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScriptBundle:Start:Scenario', function(Data)
  local PedID = PedID()
  local Coords = GetCoords(PedID)
  Citizen.InvokeNative(0x322BFDEA666E2B0E, PedID, Coords, 20.0, -1, 1, 1, 1, 1)
  -- NoteObjective('System', "You can stop the scenario via [ /scenario stop ]", 'Horn', 5000)
  Notify("You can stop the scenario via typing [ /scenario stop ] in the chat", 'BottomCenter', 10000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
