--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
IdleHorsePos, IdleHorseCount = nil, 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Horse Idle loop check
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while true do Wait(1000)
    while (UserInGame()) do Wait(2500)
      local Mount = IsPedOnMount(PedID())
      local Sync = TCTCC('DokusCore:Sync:Get:UserData')
      if ((Sync.HorseActive) and (not (Mount))) then
        -- Set the horse coords is not yet set
        if (IdleHorsePos == nil) then IdleHorsePos = GetCoords(Sync.HorseID) break end
        -- Check if the coords have been changed
        local Dist = Vdist(IdleHorsePos, GetCoords(Sync.HorseID))
        -- Reset the idle counter when the horse has moved.
        if (Dist > 0.1) then IdleHorsePos, IdleHorseCount = nil, 0 break end
        -- When the horse is idle
        if (Dist <= 0.1) then
          IdleHorseCount = (IdleHorseCount + 1)
          if (IdleHorseCount >= 5) then
            ClearPedTasks(Sync.HorseID) Wait(2000)
            local C = GetOffsetFromEntityInWorldCoords(Sync.HorseID, Round(math.random(1, 10)), Round(math.random(1, 10)), 1.0)
            TaskGoToCoordAnyMeans(Sync.HorseID, C, 1.0, 0, 0, 786603, 0xbf800000)
          end
        end
      elseif ((Sync.HorseActive) and (Mount)) then
        IdleHorsePos, IdleHorseCount = nil, 0
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
