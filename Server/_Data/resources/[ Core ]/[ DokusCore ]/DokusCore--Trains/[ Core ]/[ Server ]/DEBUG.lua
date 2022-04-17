--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
--[[

The code in this debug file will be removed as soon the new system is in place.
This code at this time just revents more then 1 train to be spawned in until the
script is expanded for multiple trains on the track.

]]
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
System   = '^5[ DokusCore ]^2[ System ]: ^0'
Error    = '^5[ DokusCore ]^1[ Error ]: ^0'
Trains = {}
Data = {}
IsHost = false
TrainCount, Cooldown, CoolCount = 0, false, 0
Train = _Trains.Trains.Passenger
SpawnDelay = (Train.SpawnDelay * 60)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (Train.Amount > 1) then
    print(Error..'----------------------------------------------------------------')
    print(Error..'You can not spawn more then 1 train at this moment!!')
    print(Error.."Please set the train amount back to 1 and restart the script")
    print(Error..'----------------------------------------------------------------')
  end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Trains:ActCooldown')
AddEventHandler('DokusCore:Trains:ActCooldown', function()
  Cooldown = true
  while Cooldown do
    CoolCount = (CoolCount + 1)
    if (SpawnDelay >= CoolCount) then
      CoolCount, Cooldown = 0, false
      return
    end
     Wait(1000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Trains:SetSpawnedTrain')
AddEventHandler('DokusCore:Trains:SetSpawnedTrain', function(Plus, Minus, TrainID)
  if (Plus) then TrainCount = (TrainCount + 1) end
  if ((Plus) and not (IsHost)) then IsHost = true table.insert(Data, TrainID) end
  if (Minus) then TrainCount = (TrainCount - 1) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Trains:CanTrainSpawn', function(source, args)
  local CanSpawn = false
  if (Cooldown) then CanSpawn = false end
  if not (Cooldown) then
    if (TrainCount < Train.Amount) then
      if (CoolCount < SpawnDelay) then
        if not (IsHost) then
          CanSpawn = true else CanSpawn = false
        end
      end
    end
  end return CanSpawn
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Trains:TrainCount', function(source, args)
  if (#Data == 0) then return end
  local C = Data[math.random(#Data)]
  return { TrainCount = TrainCount, TrainID = C }
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Trains:UpdateTrainRoute')
AddEventHandler('DokusCore:Trains:UpdateTrainRoute', function(Data)
  Trains = Data
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Trains:GetTrainRoute', function(source, args)
  if (#Trains == 0) then return end
  return Trains
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
