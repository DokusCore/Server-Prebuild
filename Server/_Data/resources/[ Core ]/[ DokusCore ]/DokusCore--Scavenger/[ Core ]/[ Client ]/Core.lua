--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
-- Variables:
Blips, NPCs, Rocks = {}, {}, {}
Type = nil
InRangeBush = false
InRangeMining = false
BushCoords = nil
IsHarvesting = false
InRangeMining = false
SpawnedRocks = 0
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Prompt_Bush = nil
Group = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Scavenger) then
    while (not FrameReady()) do Wait(1000) end
    while (not UserInGame()) do Wait(1000) end
    for k,v in pairs(_Scavenger.Mining.Locations) do
      Tabi(Blips, SetBlip(v.Coords, 1480984695, 1.0, 'Mine'))
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Scavenger) then
    while true do Wait(500)
      while (not (InRangeMining)) do Wait(500)
        local PedID = PedID()
        local Coords = GetCoords(PedID)
        for k,v in pairs(_Scavenger.Mining.Locations) do
          local Dist = GetDistance(v.Coords)
          if ((Dist <= v.Range) and (not (InRangeMining))) then
            ResetPrompts()
            Type, InRangeMining = v.ID, true
            TriggerEvent('DokusCore:Scavenger:Check:NearMine', PedID)
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Scavenger) then
    while true do Wait(1)
      while (not (InRangeBush)) do Wait(500)
        local PedID = PedID()
        local Coords = GetCoords(PedID)
        for k,v in pairs(_Scavenger.BushHarvest.Types) do
          local Hash = GetHash(TS(v.Hash))
          local Near = GetObjAtCoords(Coords, 0.8, Hash, true)
          local OnMount, InVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID, true)
          if ((not (OnMount) and (not InVeh))) then
            if ((Near) and (not (InRangeBush)) and (not (InRangeMining))) then
              ResetPrompts()
              Type = v.ID
              IsHarvesting = false
              InRangeBush, BushCoords = true, Coords
              TriggerEvent('DokusCore:Scavenger:CheckNearBush', PedID)
              TriggerEvent('DokusCore:Scavenger:NearBush', PedID)
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
