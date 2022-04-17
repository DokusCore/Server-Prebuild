--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Play the trumpet like a boss!
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local IsPlaying = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokuCore:ScriptBundle:Trumpet:Play', function(Data)
  IsPlaying = true
  local PedID  = PedID()
  local Coords = GetCoords(PedID)
  local Hash   = GetHashKey(Data[1])
  TaskStartScenarioInPlace(PedID, Hash, -1, true, false, false, false)
  TriggerEvent('DokuCore:ScriptBundle:Trumpet:WaitToStop', PedID)
  Notify("You can stop playing by pressing Backspace - Spacebar or X")
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokuCore:ScriptBundle:Trumpet:WaitToStop', function(PedID)
  while IsPlaying do Wait(1)
    local C1 = IsControlJustPressed(0, _Keys['BACKSPACE'])
    local C2 = IsControlJustPressed(0, _Keys['SPACEBAR'])
    local C3 = IsControlJustPressed(0, _Keys['X'])
    if ((C1) or (C2) or (C3)) then
			ClearPedTasks(PedID) Wait(1500)
      ClearPedTasksImmediately(PedID)
      IsPlaying = false
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
