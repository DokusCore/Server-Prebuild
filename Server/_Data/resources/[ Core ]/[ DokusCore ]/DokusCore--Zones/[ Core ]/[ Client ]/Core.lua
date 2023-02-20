--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
Zones = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (not (_Zones.Debug)) then TriggerServerEvent('DokusCore:Zones:SaveZones') end
  if (_Zones.Debug) then TriggerEvent('DokusCore:Zones:StartDebug') end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Zones:StoreZones', function()
  for k,v in pairs(_Zoning) do
    if ((Low(v.Type) == 'zone') or (Low(v.Type) == 'npc')) then
      if (v.OnExit == nil)  then return Error('NoOnEnterEvent') end
      if (v.OnEnter == nil) then return Error('NoOnEnterEvent') end
      if (v.Vectors == nil) then return Error('NoVectorsEvent') end

      Type = v.Type
      Name = v.Name or nil
      City = v.City or nil
      GD = TN(v.GD) or 30
      Poly = ((v.Poly == 1) and true or false)
      Grid = ((v.Grid == 1) and true or false)
      MinZ = TN(v.MinZ) or nil
      MaxZ = TN(v.MaxZ) or nil
      OnEnter = nil
      OnExit = nil

      -- Put all vectors in a string
      local Vectors = nil
      if (#v.Vectors > 0) then
        local VecTable = {}
        for i = 1, #v.Vectors do Tabi(VecTable, v.Vectors[i]) end
        Vectors = Encoded(VecTable)
      end

      -- Encode the OnEnter / OnExit events
      if (v.OnEnter.Event[1] == nil) then return Error('OnEnterNoTypeSet')  end
      if (v.OnEnter.Event[2] == nil) then return Error('OnEnterNoEventSet') end
      if (v.OnExit.Event[1] == nil) then return Error('OnExitNoTypeSet')    end
      if (v.OnExit.Event[2] == nil) then return Error('OnExitNoEventSet')   end
      local EnType, EnEvent  = Low(v.OnEnter.Event[1]), v.OnEnter.Event[2]
      local ExType, ExEvent  = Low(v.OnExit.Event[1]),  v.OnExit.Event[2]

      -- On Enter
      if ((EnType == 'client') or (EnType == 'server')) then
        local EventData = {}
        Tabi(EventData, { Type = EnType, Event = EnEvent, Meta = v.OnEnter.Meta })
        OnEnter = Encoded(EventData)
      end

      -- On Exit
      if ((ExType == 'client') or (ExType == 'server')) then
        local EventData = {}
        Tabi(EventData, { Type = ExType, Event = ExEvent, Meta = v.OnExit.Meta })
        OnExit = Encoded(EventData)
      end

      -- Insert info into database
      local Index = { Name, Type, City, GD, Poly, Grid, MinZ, MaxZ, OnEnter, OnExit, Vectors }
      TriggerServerEvent('DokusCore:Core:DBIns:Zones', { 'Zone', Index })

      -- Delete the config file
      TriggerServerEvent('DokusCore:Zones:DeleteConfig')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Zones:StartZones', function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  local Data = TSC('DokusCore:Core:DBGet:Zones', { 'All', 'All' })
  if (Data.Exist) then
    for k,v in pairs(Data.Result) do
      local Vectors = {}
      local Zone = Decoded(v.Vectors)
      if (Zone == nil) then return end
      for i,p in pairs(Zone) do Tabi(Vectors, vec2(p.x, p.y)) end
      Poly = DokusZones:Create(Vectors, v)
      Tabi(Zones, { Data = Poly, InUse = false })
    end

    TriggerEvent("DokusCore:Zones:CheckInZone")
    TriggerEvent("DokusCore:Zones:CheckOutZone")
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent("DokusCore:Zones:CheckInZone", function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  while true do Wait(500)
    local Coords = GetCoords(PedID())
    for k,v in pairs(Zones) do
      local InZone = v.Data:isPointInside(Coords)
      if ((InZone) and (not Zones[k].InUse)) then
        Zones[k].InUse = true
        local OnEnter = Decoded(v.Data.OnEnter)
        for i,p in pairs(OnEnter) do
          if (Low(p.Type) == 'client') then
            TriggerEvent(p.Event, v.Data)
          elseif (Low(p.Type) == 'server') then
            TriggerServerEvent(p.Event, v.Data)
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent("DokusCore:Zones:CheckOutZone", function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  while true do Wait(500)
    local Coords = GetCoords(PedID())
    for k,v in pairs(Zones) do
      local InZone = v.Data:isPointInside(Coords)
      if ((not InZone) and (Zones[k].InUse)) then
        Zones[k].InUse = false
        local OnExit = Decoded(v.Data.OnExit)
        for i,p in pairs(OnExit) do
          if (Low(p.Type) == 'client') then
            TriggerEvent(p.Event, v.Data)
          elseif (Low(p.Type) == 'server') then
            TriggerServerEvent(p.Event, v.Data)
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
