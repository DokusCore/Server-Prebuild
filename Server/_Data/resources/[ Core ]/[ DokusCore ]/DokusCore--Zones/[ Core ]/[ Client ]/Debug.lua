--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
Zones_Debug = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create all DokusZones
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Zones) then
    if (_Zones.Debug) then
      while not FrameReady() do Wait(1000) end
      while not UserInGame() do Wait(1000) end
      if (_Zoning == nil) then print("No Zoning Config to Debug!") return end
      for k,v in pairs(_Zoning) do
        Poly = DokusZones:Create(v.Vectors, v)
        Tabi(Zones_Debug, { Data = Poly, InUse = false })
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check in what zones the player is located
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Zones) then
    if (_Zones.Debug) then
      while not FrameReady() do Wait(1000) end
      while not UserInGame() do Wait(1000) end
      if (_Zoning == nil) then return end
      while true do Wait(500)
        local Coords = GetCoords(PedID())
        for k,v in pairs(Zones_Debug) do
          local InZone = v.Data:isPointInside(Coords)
          if ((InZone) and (not (Zones_Debug[k].InUse))) then
            Zones_Debug[k].InUse = true
            if (#v.Data.OnEnter.Event ~= 0) then
              if (Low(v.Data.OnEnter.Event[1]) == 'client') then
                print('You are in the zone')
              elseif (Low(v.Data.OnEnter.Event[1]) == 'server') then
                print("You just left the zone")
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
-- Check if the user left an active zone
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Zones) then
    if (_Zones.Debug) then
      while not FrameReady() do Wait(1000) end
      while not UserInGame() do Wait(1000) end
      if (_Zoning == nil) then return end
      while true do Wait(500)
        while (#Zones_Debug == 0) do Wait(1000) end
        local Coords = GetCoords(PedID())
        for k,v in pairs(Zones_Debug) do
          local InZone = v.Data:isPointInside(Coords)
          if (not (InZone)) then
            if (Zones_Debug[k].InUse) then
              Zones_Debug[k].InUse = false
              if (#v.Data.OnExit.Event ~= 0) then
                if (Low(v.Data.OnExit.Event[1]) == 'client') then
                  print('You left the zone')
                elseif (Low(v.Data.OnExit.Event[1]) == 'server') then
                  print('You left the zone')
                end
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
RegisterNetEvent('DokusCore:Zones:StartDebug', function()
  for k,v in pairs(Zones) do
    Poly = DokusZones:Create(v.Vectors, v)
    Tabi(Zones_Debug, { Data = Poly, InUse = false })
  end

  TriggerEvent("DokusCore:Zones:CheckInZone")
  TriggerEvent("DokusCore:Zones:CheckOutZone")
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





























RegisterNetEvent('TesterStart', function()
  NoteObjective('Zone', 'In the zone', 'Horn', 3000)
end)

RegisterNetEvent('TesterStop', function()
  NoteObjective('Zone', 'Out the zone', 'Horn', 3000)
end)
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
