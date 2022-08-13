--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Harvest fruits and herbs from bushes and trees
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Loc, Busy, InRange, bCoords, Check, Harvested = nil, false, false, nil, true, {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.ScriptBundle.BushHarvest) then
    while true do Wait(2000)
      local PedID = PedID()
      local Coords = GetCoords(PedID)
      for k,v in pairs(_ScriptBundle.BushHarvest.Bushes) do
        local Hash = GetHash(tostring(v.Hash))
        local Near = GetObjAtCoords(Coords, 0.85, Hash, true)
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
    if (Control) then DoHarvest(PedID, k) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoHarvest(PedID)
  Busy = true
  local Hash = 'mech_pickup@plant@berries'
  RequestAnimDict(Hash)
  TaskPlayAnim(PedID, Hash, "enter_lf", 1.0, -0.5, -1, 0, 0, true, 0, false, 0, false) Wait(800)
  TaskPlayAnim(PedID, Hash, "base", 1.0, -0.5, -1, 0, 0, true, 0, false, 0, false) Wait(4300)
  ClearPedTasksImmediately(PedID)

  -- Give a random item and amount
  local rItem = _ScriptBundle.BushHarvest.Items[math.random(#_ScriptBundle.BushHarvest.Items)]
  local rAmount = math.floor(math.random(rItem.Min, rItem.Max))
  if (rAmount == 0) then Notify("You've not found any fruits or herbs this time!") return end
  local InvItem = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, rItem.Item } })
  if (InvItem.Exist) then
    Notify("You've harvested "..rAmount.." "..rItem.Item)
    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', { Steam, CharID, rItem.Item, rAmount, InvItem.Result[1].Amount } })
  else
    Notify("You've harvested "..rAmount.." "..rItem.Item)
    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, rItem.Type, rItem.Item, rAmount } })
  end
  Busy = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
