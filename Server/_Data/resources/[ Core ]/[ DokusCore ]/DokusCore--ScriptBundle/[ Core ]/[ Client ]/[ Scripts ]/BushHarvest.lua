--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Harvest fruits and herbs from bushes and trees
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Loc, Busy, InRange, bCoords, Check, Harvested = nil, false, false, nil, true, {}
Hash, Near = nil, nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.ScriptBundle.BushHarvest) then
    while true do Wait(2000)
      local PedID = PedID()
      local Coords = GetCoords(PedID)
      for k,v in pairs(_ScriptBundle.BushHarvest.Bushes) do

          Hash = GetHash(tostring(v.Hash))
          Near = GetObjAtCoords(Coords, 0.85, Hash, true)
          --print(Coords)
          if ((Loc == nil) and (Near)) then Loc = v.Hash end
          if (Loc == v.Hash) then

            while Check do Wait(1)
              if ((Near) and not (InRange) and (not IsPedOnMount(PedID)) and (not IsPedInAnyVehicle(PedID, true))) then
                InRange = true
                bCoords = Coords
                Check = false
                TriggerEvent('DokusCore:ScriptBundle:BushHarvest:NearBush', PedID, Coords, v)
              end
            end

        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScriptBundle:BushHarvest:NearBush', function(PedID, Coords, Data)
  while InRange do Wait(1)
    local Dist = GetDistance(bCoords)
    if (Dist > 1.0) then InRange = false Loc = nil Check = true return end
    local Control = IsControlJustPressed(0, _Keys['E'])
    if not (Busy) then DrawInfo('Press ~color_red~ E ~q~ to harvest', 0.5, 0.95, 0.75) end
        if (Control) then
          if Data.ID == "axe" then
            local InvItem = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, 'axe' } })
            if InvItem.Exist then
                StartWoodCut(PedID, Data)
                print(Data.ID)
            else
              print('no axe')
            end
          else
            DoHarvest(PedID, Data)
          end
        end
    end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoHarvest(PedID, Data)
  Busy = true
  local Hash = 'mech_pickup@plant@berries'
  RequestAnimDict(Hash)
  TaskPlayAnim(PedID, Hash, "enter_lf", 1.0, -0.5, -1, 0, 0, true, 0, false, 0, false) Wait(3800)
  TaskPlayAnim(PedID, Hash, "base", 1.0, -0.5, -1, 0, 0, true, 0, false, 0, false) Wait(6300)
  ClearPedTasksImmediately(PedID)

  for k,v in pairs(_ScriptBundle.BushHarvest.Items) do
    if (Low(v.ID) == (Low(Data.ID))) then
      local rChance = math.random(0,10)
      local rAmount = math.random(v.Min, v.Max)
      print(rAmount, rChance)
        if (rChance >= 8) then Notify("You've not found any fruits or herbs this time!") Busy = false return end
          local InvItem = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, v.Item } })
          if (InvItem.Exist) then
            Notify("You've harvested "..rAmount.." "..v.Item)
            TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', { Steam, CharID, v.Item, rAmount, InvItem.Result[1].Amount } })
            break
          else
            Notify("You've harvested "..rAmount.." "..v.Item)
            TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, v.Type, v.Item, rAmount } })
            break
          end
      end
  end
  Wait(2000)
  Busy = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
