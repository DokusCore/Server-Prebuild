--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
IntObjects    = {}
NearObjData   = {}
Seconds       = nil
ObjInUse      = false
IsPlacing     = false
IsNearObject  = false
ObjID, ObjPos = nil, nil
ObjHash       = nil
ObjMenuOpen   = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Inter         = _UsableItems.Interactables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ShowMenu             = false
ShowObjPrompts       = false
Campfire_Destroy     = nil
Campfire_AddFuel     = nil
ObjPrompt_Exit       = nil
Campfire_Fuel_Lumber = nil
Campfire_Fuel_Logs   = nil
Campfire_Fuel_Bark   = nil
Campfire_Fuel_Back   = nil
Group                = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    TriggerEvent('DokusCore:UsableItems:Sync:Items')

    -- Delete the old objects
    local Obj = TSC('DokusCore:Core:DBGet:Objects', { 'All' })
    if (Obj.Exist) then for k,v in pairs(Obj.Result) do DeleteEntity(v.ItemID) end end

    -- Wait for the server to clean the database
    local Ready = TSC('DokusCore:UsableItems:Object:WaitForReset')
    while (not (Ready)) do Wait(1000) end
    local IsReset = TSC('DokusCore:UsableItems:Object:GetResetStatus')
    while (not (IsReset)) do Wait(1000) end

    -- Spawn the objects with a new engine id
    if (Obj.Exist) then
      for k,v in pairs(Obj.Result) do
        local Dec = Decoded(v.Coords).Coords
        local P = CreateObject(TN(v.HashID), Dec.x, Dec.y, Dec.z, true, false, true)
        TriggerServerEvent('DokusCore:Core:DBSet:Objects', { 'NewID', { TN(P), v.HashID } })
        PlaceObjectOnGroundProperly(P) Wait(100)
        local NewCoords = GetCoords(P)

        TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { v.ID } })
        local Meta = { Active = true, InUse = false, Expire = v.Unix }
        local Encode = Encoded(Meta)
        local Index = { TN(P), v.Item, NewCoords, Encode }
        TriggerServerEvent('DokusCore:Sync:Set:ObjectData', { 'Interactable', Index })
      end

      SyncIntObj()
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(1000)
      while (#IntObjects ~= 0) do Wait(500)
        if (not (IsPlacing) and (not (IsNearObject))) then
          for k,v in pairs(IntObjects) do
            local Dist = GetDistance(v.Coords)
            if (not (IsNearObject) and (Dist <= 2.5)) then
              SyncIntObj()
              IsNearObject = true
              NearObjData = IntObjects[k]
              break
            end
          end
        elseif (not (IsPlacing) and (IsNearObject)) then
          for k,v in pairs(IntObjects) do
            local Dist = GetDistance(v.Coords)
            if ((IsNearObject) and (Dist > 2.5) and (Dist <= 5.0)) then
              local ID, Item, Meta, Coords = nil, nil, nil, nil
              for k,v in pairs(NearObjData) do
                if (Low(k) == 'id')     then ID   = v end
                if (Low(k) == 'item')   then Item = v end
                if (Low(k) == 'coords') then Coords = v end
                if (Low(k) == 'meta')   then Meta = Decoded(v) end
              end

              TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { ID } })
              local Meta = { Active = Meta.Active, InUse = false, Expire = Meta.Expire, Time = Meta.Time }
              local Encode = Encoded(Meta)
              local Index = { ID, Item, Coords, Encode }
              TriggerServerEvent('DokusCore:Sync:Set:ObjectData', { 'Interactable', Index })

              IsNearObject = false
              IntObjects = {}
              NearObjData = {}
              ShowObjPrompts = false
              ObjInUse = false
              IsPlacing = false
              IsNearObject = false
              ObjID, ObjPos = nil, nil
              SyncIntObj()
              ResetPrompts()
              break
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
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(1000)
      while (#IntObjects ~= 0) do Wait(1000)
        if (IsNearObject) then
          local Coords = NearObjData.Coords
          while (IsNearObject) do Wait(1)
            DrawText3D(Coords.x, Coords.y, (Coords.z + 0.5), 300, 'Interactable')
            DrawText3D(Coords.x, Coords.y, (Coords.z + 0.3), 300, 'Expires: ' .. TS(Seconds) .. ' seconds')
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.UsableItems) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(1000)
      local ID = nil
      while (IsNearObject) do Wait(1000)
        local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables
        for k,v in pairs(NearObjData) do if (Low(k) == 'id') then ID = v end end
        for k,v in pairs(Obj) do
          if (v.ID == ID) then
            local Dec = Decoded(v.Meta)
            local Unix = TSC('DokusCore:Core:System:GetUnix')
            Seconds = (Dec.Expire - Unix)
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
