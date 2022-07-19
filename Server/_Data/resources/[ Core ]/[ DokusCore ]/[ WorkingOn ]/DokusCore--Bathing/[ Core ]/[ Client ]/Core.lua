--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
SteamID, CharID = nil, nil
Loc, InArea, InRange = nil, false, false
Blips, Camera = {}, {}
CounterNPCs, ProstNPCs = {}, {}
TakingABath = false
--------------------------------------------------------------------------------
-- Initialize the script and set users current values
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Bathing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Data.SteamID, Data.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs, and lock the doors!
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Bathing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_Bathing.Doors) do SetDoorsLocked(v.Hash) end
    for k,v in pairs(_Bathing.Zones) do
      Tabi(Blips, SetBlip(v.Coords, -304640465, 1.0, 'Bathing House'))
      Tabi(CounterNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading))
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check if the player is in the area of the bathing house. ( Resource Stress Releave )
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Bathing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      while ((true) and not (InRange)) do Wait(1)
        for k,v in pairs(_Bathing.Zones) do
          local Dist = GetDistance(v.Coords)
          local Close = ((Loc == nil) and (Dist <= v.InArea))
          local IsInArea = (Dist <= v.InArea)
          local IsOutArea = (Dist > v.InArea)
          if (Close) then Loc = v.ID end
          if ((IsInArea) and not (InArea)) then InArea = true end
          if ((IsOutArea) and (InArea)) then InArea = false ResetData() end
        end Wait(3000)
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs, and lock the doors!
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Bathing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(3000)
      while InArea do Wait(1)
        for k,v in pairs(_Bathing.Zones) do
          if (Low(v.ID) == Low(Loc)) then
            local Dist = GetDistance(v.Coords)
            local Close = ((Loc == nil) and (Dist <= v.InRange))
            local IsInRange = (Dist <= v.InRange)
            local IsOutRange = (Dist > v.InRange)
            if (Close) then Loc = v.ID end
            if ((IsOutRange) and (InRange)) then InRange = false ResetData() end
            if ((IsInRange) and not (InRange)) then
              InRange = true
              TriggerEvent('DokusCore:Bathing:StartCounter')
            end
          end
        end Wait(1000)
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------













--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
