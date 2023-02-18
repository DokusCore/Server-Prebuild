--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Scavenger:CheckNearBush', function(PedID)
  while InRangeBush do Wait(500)
    local Dist = GetDistance(BushCoords)
    if (Dist >= 1.0) then InRangeBush = false end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Scavenger:NearBush', function(PedID)
  ActPrompts('Bush')
  while InRangeBush do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'Scavenging')
    PromptSetActiveGroupThisFrame(Group, pName)
    local Control = PromptHasHoldModeCompleted(Prompt_Bush)
    if ((Control) and (not (IsHarvesting))) then
      IsHarvesting = true

      local GetHarvested = TSC('DokusCore:Scavenger:Get:HarvestedBushes')
      if (#GetHarvested <= 0) then
        DoAnimation(PedID)
        TriggerServerEvent('DokusCore:Scavenger:Set:Harvested', BushCoords)
        GetReward()
      else
        local Found = CheckBush(GetHarvested)
        if (Found) then
          NoteObjective('System', "This bush already has been harvested", 'Horn', 1500)
        else
          DoAnimation(PedID)
          TriggerServerEvent('DokusCore:Scavenger:Set:Harvested', BushCoords)
          GetReward()
        end
      end

      ResetPrompts()
      InRangeBush = false
      IsHarvesting = false
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Scavenger:Check:NearMine', function(PedID)
  TriggerEvent('DokusCore:Scavenger:Check:FarMine')
  TriggerEvent('DokusCore:Scavenger:Check:NearRock')
  SpawnRocks(PedID)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Scavenger:Check:FarMine', function()
  while (InRangeMining) do Wait(500)
    local PedID = PedID()
    for k,v in pairs(_Scavenger.Mining.Locations) do
      if (InRangeMining) then
        if (Low(Type) == Low(v.ID)) then
          local Dist = GetDistance(v.Coords)
          if (Dist > v.Range) then
            ResetPrompts()
            Type, InRangeMining = nil, false
            SpawnedRocks = 0
            if (#Rocks > 0) then for k,v in pairs(Rocks) do DeleteEntity(v) end end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Scavenger:Check:NearRock', function()
  while (InRangeMining) do Wait(1)
    local PedID = PedID()
    for k,v in pairs(_Scavenger.Mining.Locations) do
      if (InRangeMining) then
        if (Low(Type) == Low(v.ID)) then
          for o,p in pairs(Rocks) do
            local Coords = GetCoords(p)
            local Dist = GetDistance(Coords)
            if (Dist < 2.3) then
              local OnMount, InVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID, true)
              if ((not (OnMount) and (not InVeh))) then
                DrawText3D(Coords.x, Coords.y, Coords.z, 255, 'Press [E] To Mine Rock')
                local Control = IsControlJustReleased(0, _Keys.E)
                if ((Control) and (not IsHarvesting)) then
                  IsHarvesting = true
                  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
                  local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, 'pickaxe' } }
                  local Item = TSC('DokusCore:Core:DBGet:Inventory', Index)
                  if (not (Item.Exist)) then
                    NoteObjective('System', "You've no pickaxe!", 'Horn', 5000)
                    IsHarvesting = false
                  else
                    local Anim = GetHash('WORLD_HUMAN_PICKAXE_WALL')
                    TaskStartScenarioInPlace(PedID, Anim, 14000, true, false, false, false)
                    Wait(2000) DeleteObject(Axe) Wait(14000)
                    FreezeEntityPosition(PedID,false)
                    ClearPedTasks(PedID) Wait(1000)
                    SetCurrentPedWeapon(PedID, GetHash('WEAPON_UNARMED'), true)

                    local R = _Scavenger.Mining.Rewards
                    local rR = math.random(#R)
                    local rAmount = math.random(R[rR].Amount.Min, R[rR].Amount.Max)
                    local Chance = math.random(R[rR].Chance.Min, R[rR].Chance.Max)
                    if (Chance == R[rR].LuckNr) then
                      local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, R[rR].ID } }
                      local Item = TSC('DokusCore:Core:DBGet:Inventory', Index)
                      if (not (Item.Exist)) then
                        local Index = { 'User', 'InsItem', { Sync.SteamID, Sync.CharID, 'Consumable', R[rR].ID, rAmount } }
                        TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
                      else
                        local Index = { 'User', 'AddItem', { Sync.SteamID, Sync.CharID, R[rR].ID, Item.Result[1].Amount, rAmount } }
                        TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)
                      end
                      DeleteObject(p)
                      table.remove(Rocks, o)
                      SpawnedRocks = (SpawnedRocks - 1)
                      NoteObjective('Mining', "You've mined "..rAmount.." "..R[rR].Name.."!", 'Check', 3000)
                    else
                      NoteObjective('Mining', "You've found nothing!", 'Horn', 3000)
                    end
                    IsHarvesting = false
                  end
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
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  if (#Blips > 0) then for k,v in pairs(Blips) do RemoveBlip(v) end end
  if (#NPCs > 0) then for k,v in pairs(NPCs) do DeleteEntity(v) end end
  if (#Rocks > 0) then for k,v in pairs(Rocks) do DeleteEntity(v) end end
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
