--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
Trains, NPCs      = {}, {}
SpeedUp, SlowDown = false
Steam, CharID     = nil, 0
Vehicles          = _Trains.Vehicles
Passenger         = _Trains.Spawns.Passenger
Route             = _Trains.Route.Passenger
--------------------------------------------------------------------------------
-- Set the NPCs and Blips on the map
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_Trains.Blips) do SetBlip(v.Coords, -250506368, Radius, 'Train Station') end
    for k,v in pairs(_Trains.NPCs) do Tabi(NPCs, SpawnNPC(v.Hash, v.Coords)) end

    -- Add the user to the server online player array
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Data.SteamID, Data.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  for k,v in pairs(Trains) do DeleteVehicle(Trains[k].TrainID) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Spawn the Trains
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local rVeh = Vehicles[math.random(#Vehicles)]
    local CanSpawn = TSC('DokusCore:Trains:CanTrainSpawn')
    while not (CanSpawn) do Wait(1000) end
    if (CanSpawn) then
      for k,v in pairs(Passenger) do
        if not (Passenger[k].Spawned) then
          local Train = SpawnTrain(rVeh.Hash, v.Coords, v.heading)
          table.insert(Trains, {
            TrainID = Train,
            TrainStart = true,
            Coords = nil,
            Speed = 0,
            OnRoute = 0,
            Next = { Type = nil, Speed = 0, Force = 0, StopTime = 0 },
            Route = Route
          })

          Passenger[k].Spawned = true
          TriggerServerEvent('DokusCore:Trains:SetSpawnedTrain', true, false, Train)
          TriggerServerEvent('DokusCore:Trains:ActCooldown') Wait(5000)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Keep track of the train coords
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while (#Trains == 0) do Wait(1000) end
    while true do Wait(10)
      local Next = 0
      for k,v in pairs(Trains) do
        local Coords = GetEntityCoords(Trains[k].TrainID)
        Trains[k].Coords = Coords
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Keep track of the route the train is taking
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while (#Trains == 0) do Wait(1000) end
    while true do Wait(10)
      for i,r in pairs(Route) do
        for k,v in pairs(Trains) do
          while (Trains[k].TrainStart) do Wait(1000) end
          if (Trains[k].OnRoute == r.ID) then
            local Dist = GetDistanceEnt(r.Coords, Trains[k].Coords)
            if (Dist <= _Trains.ActRadius) then
              Trains[k].Next.Type     = r.Type
              Trains[k].Next.Speed    = r.Speed
              Trains[k].Next.Force    = r.Force
              Trains[k].Next.StopTime = r.Stop
            end
          elseif (Trains[k].OnRoute == #Route) then
            Trains[k].OnRoute = 1
            Trains[k].Next.Type = nil
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Move the train depending on its next instructions
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while (#Trains == 0)   do Wait(1000) end
    while true do Wait(10)
      for k,v in pairs(Trains) do
        while true do Wait(1000)

          -- print("logging", #Trains)

          -- Train first start up procedure.
          if (Trains[k].TrainStart) then
            print("Trains Spawned")
            local Inc = Round((_Trains.StartSpeed / _Trains.StartForce), 10)
            print("Speed Set")
            while ((Trains[k].TrainStart) and (Floor(Trains[k].Speed) < (Floor(_Trains.StartSpeed)))) do Wait(1)
              Trains[k].Speed = (Trains[k].Speed + Inc)
              SetTrainCruiseSpeed(Trains[k].TrainID, Trains[k].Speed)
              print("StartUp", Trains[k].Speed, Trains[k].OnRoute)
            end
            print("Startup Ended")
            Trains[k].TrainStart = false
            Trains[k].OnRoute = (Trains[k].OnRoute + 1)
          end

          -- Speed up the train
          local Next = Trains[k].Next
          if ((Trains[k].OnRoute ~= 0) and not (Trains[k].TrainStart) and (Next.Type ~= nil) and (Low(Next.Type) == 'speed')) then
            local Inc = Round((Next.Speed / Next.Force), 10)
            while (not (Trains[k].TrainStart) and (Trains[k].Speed) < (Next.Speed)) do Wait(1)
              Trains[k].Speed = (Trains[k].Speed + Inc)
              SetTrainCruiseSpeed(Trains[k].TrainID, Trains[k].Speed)
              print("Route - Speed", Trains[k].Speed, Trains[k].OnRoute)
            end
            Trains[k].OnRoute = (Trains[k].OnRoute + 1)
            Next.Type = nil
          end

          -- Speed up the train
          if ((Trains[k].OnRoute ~= 0) and not (Trains[k].TrainStart) and (Next.Type ~= nil) and (Low(Next.Type) == 'slow')) then
            local Inc = Round((Next.Speed / Next.Force), 10)
            while (not (Trains[k].TrainStart) and (Trains[k].Speed) > (Next.Speed)) do Wait(1)
              Trains[k].Speed = (Trains[k].Speed - Inc)
              SetTrainCruiseSpeed(Trains[k].TrainID, Trains[k].Speed)
              print("Route - Slow", Trains[k].Speed, Trains[k].OnRoute)
            end
            Trains[k].OnRoute = (Trains[k].OnRoute + 1)
            Next.Type = nil
          end

          -- Stop at a station
          if ((Trains[k].OnRoute ~= 0) and not (Trains[k].TrainStart) and (Next.Type ~= nil) and (Low(Next.Type) == 'station')) then
            local Inc = Round((Trains[k].Speed / Next.Force), 10)
            while (not (Trains[k].TrainStart) and (Trains[k].Speed) > (Next.Speed)) do Wait(1)
              Trains[k].Speed = (Trains[k].Speed - Inc)
              SetTrainCruiseSpeed(Trains[k].TrainID, Trains[k].Speed)
              print("Route - Station", Trains[k].Speed, Trains[k].OnRoute, Next.StopTime)
              if (Trains[k].Speed <= 0.2) then
                for i=0, Next.StopTime do
                  print("Waiting ", i)
                  Trains[k].Speed = 0
                  SetTrainCruiseSpeed(Trains[k].TrainID, 0.0)
                  SetTrainSpeed(Trains[k].TrainID, 0.0)
                  Wait(1000)
                end
                Next.Type = nil
                Trains[k].TrainStart = true
              end
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
