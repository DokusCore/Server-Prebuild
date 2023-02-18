--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Horse:Call', function()
  local Call = _Stables.Horse.Call
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  if (Sync.HorseID == nil) then NoteObjective('System', 'You have no active horse at the moment!', 'Alert', 5000) return end
  local Dist = GetDistance(GetCoords(Sync.HorseID))
  if (Dist <= Call.Radius) then GoToEntity(Sync.HorseID, PedID(), -1, Call.Dist, Call.Speed) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Horse:Follow', function()
  local Follow = _Stables.Horse.Follow
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  if (Sync.HorseID == nil) then NoteObjective('System', 'You have no active horse at the moment!', 'Alert', 5000) return end
  local Dist = GetDistance(GetCoords(Sync.HorseID))
  if (Dist <= Follow.Radius) then
    if (not (IsFollowing)) then
      IsFollowing = true
      TaskFollowToOffsetOfEntity(Sync.HorseID, PedID(), 0.0, -1.5, 0.0, 1.0, -1, 3.0, true, 1, 0, 0, 1)
      while (IsFollowing) do Wait(1000) if (IsPedOnMount(PedID())) then IsFollowing = false end end
    elseif (IsFollowing) then
      IsFollowing = false
      ClearPedTasks(Sync.HorseID)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Horse:Flee', function()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  TaskAnimalFlee(MyActiveHorse, PedID(), -1)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Horse:Stay', function()
  local Stay = _Stables.Horse.Stay
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  if (Sync.HorseID == nil) then NoteObjective('System', 'You have no active horse at the moment!', 'Alert', 5000) return end
  local Dist = GetDistance(GetCoords(Sync.HorseID))
  if (Dist <= Stay.Radius) then
    if (not (IsHorseStaying)) then
      IsHorseStaying = true
      NoteObjective('Horse Interaction', "You've ordered your horse to stay at his position!", 'Horse', 5000)
      while (IsHorseStaying) do Wait(1000) if (IsPedOnMount(PedID())) then IsHorseStaying = false end end
    elseif (IsHorseStaying) then
      IsHorseStaying = false
      NoteObjective('Horse Interaction', "You've ordered your horse to be free!", 'Horse', 5000)
      ClearPedTasks(Sync.HorseID)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
