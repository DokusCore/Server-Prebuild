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
  Cinema(true)
  local PedID  = PedID()
  local Hash   = GetHashKey(Data[1])
  TaskStartScenarioInPlace(PedID, Hash, -1, true, false, false, false)
  TriggerEvent('DokuCore:ScriptBundle:Trumpet:WaitToStop', PedID)
  NoteObjective(SYS("System").MSG, MSG("StopTrumpet").MSG, "Horn", Floor(MSG("StopTrumpet").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokuCore:ScriptBundle:Trumpet:WaitToStop', function(PedID)
  while IsPlaying do Wait(1)
    local C1 = IsControlJustPressed(0, _Keys['BACKSPACE'])
    local C2 = IsControlJustPressed(0, _Keys['SPACEBAR'])
    local C3 = IsControlJustPressed(0, _Keys['X'])
    if ((C1) or (C2) or (C3)) then
      Cinema(false)
			ClearPedTasks(PedID) Wait(1500)
      ClearPedTasksImmediately(PedID)
      IsPlaying = false
      NoteObjective(SYS("System").MSG, MSG("TrumpWarning").MSG, 'Horn', Floor(MSG("TrumpWarning").Time * 1000))
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
