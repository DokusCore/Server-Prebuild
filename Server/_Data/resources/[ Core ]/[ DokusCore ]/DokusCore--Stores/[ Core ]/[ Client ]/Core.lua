--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
Blips, NPCs, cNPCs     = {}, {}, {}
Array_Store, Array_Inv = {}, {}
ShowPrompts     = false
IsInCity, City  = false, nil
StoreInUse      = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
IsNearCustomNPC = false
CustomNPCData   = nil
IsCustomDataSet = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ShowPrompts  = false
PausePrompts = false
Prompt_Buy   = nil
Prompt_Sell  = nil
Group        = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (_Modules.Stores) then SetBlips() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (_Modules.Stores) then
    while (true) do Wait(1000)
      local Sync = TCTCC('DokusCore:Sync:Get:UserData')
      if (Sync.Area ~= nil) then
        for k,v in pairs(_Stores.General) do
          if ((v.Enabled) and (not (IsInCity))) then
            if ((Low(v.City) == Low(Sync.Area))) then
              IsInCity, City = true, Low(Sync.Area)
              Tabi(NPCs, SpawnNPC(v.NPC.Model, v.Coords, v.NPC.Heading, false))
            end
          end
        end

        if (not (IsInCity) and (#NPCs >= 1)) then
          IsInCity = false
          table.remove(NPCs, k)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (_Modules.Stores) then
    if (#_Stores.Custom == 0) then return end

    -- First load all Custom NPC positions
    for k,v in pairs(_Stores.Custom) do
      if (v.Enabled) then
        Tabi(cNPCs, {
          ID = v.ID,
          Spawned = false,
          Coords = nil,
          Data = nil,
          NPC = nil,
          ItemSet = false
        })
      end
    end

    -- Spawn the first time NPC when in range of perfect spawn distance.
    while (true) do Wait(1000)
      for k,v in pairs(_Stores.Custom) do
        if (v.Enabled) then
          local Dist = GetDistance(v.Coords)
          if (Dist <= 50) then
            for o,p in pairs(cNPCs) do
              if ((p.ID == v.ID) and (not (p.Spawned))) then
                local NPC = SpawnNPC(v.NPC.Model, v.Coords, v.NPC.Heading, false)
                cNPCs[o].NPC = NPC
                cNPCs[o].Data = v
                cNPCs[o].Coords = v.Coords
                cNPCs[o].Spawned = true
              end
            end
          end
        end
      end

      -- Check if all NPC status are spawned
      local AllSpawned = true
      for k,v in pairs(cNPCs) do
        if (not (v.Spawned)) then AllSpawned = false end
      end

      -- Stop loop when all spawned
      if (AllSpawned) then return end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (_Modules.Stores) then
    while (true) do Wait(100)
      while (#cNPCs ~= 0) do Wait(500)
        for k,v in pairs(cNPCs) do
          if ((v.Spawned) and (v.Coords ~= nil)) then
            local Dist = GetDistance(v.Coords)
            if (Dist <= 2.5) then
              IsNearCustomNPC = true
              while (IsNearCustomNPC) do Wait(1)
                if (not (IsCustomDataSet)) then
                  local ItemArr  = {}
                  CustomNPCData = v.Data

                  -- Now check if we need to insert the synced items
                  if (v.Data.Type ~= nil) then
                    for o,p in pairs(_Stores.ItemSync) do
                      if (Low(v.Data.Type) == Low(p.Type)) then
                        if (not (v.Data.ItemSet)) then
                          for x,z in pairs(v.Data.Items) do Tabi(ItemArr, z) end
                          for x,z in pairs(p.Items) do Tabi(ItemArr, z) end
                          v.Data.Items = ItemArr
                          v.Data.ItemSet = true
                        end
                      end
                    end
                  end

                  IsCustomDataSet = true
                end

                local Dist = GetDistance(v.Coords)
                if (Dist > 2.5) then
                  CustomNPCData   = nil
                  IsCustomDataSet = false
                  IsNearCustomNPC = false
                  ResetPrompts()
                  ShowPrompts  = false
                  PausePrompts = false
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
CreateThread(function()
  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  if (_Modules.Stores) then
    while (true) do Wait(500)
      while (CustomNPCData ~= nil) do Wait(1)
        if (CustomNPCData ~= nil) then
          local Coords = CustomNPCData.Coords
          local Dist = GetDistance(Coords)
          if ((Dist < 2.5) and (not (ShowPrompts))) then
            ShowPrompts = true
            TriggerEvent('DokusCore:Stores:In:Zone:Custom:NPC', CustomNPCData)
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
