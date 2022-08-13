--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
-- Deletes the extra trains if more then 1 train spawned in
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function() Wait(5000)
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(500)
      local Count = TSC('DokusCore:Trains:TrainCount')
      if (Count ~= nil) then
        if (Count.TrainCount == 2) then
          for k,v in pairs(Trains) do
            if (v.TrainID == Count.TrainID) then
              DeleteVehicle(v.TrainID)
              TriggerServerEvent('DokusCore:Trains:SetSpawnedTrain', true, false, v.TrainID)
            end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
