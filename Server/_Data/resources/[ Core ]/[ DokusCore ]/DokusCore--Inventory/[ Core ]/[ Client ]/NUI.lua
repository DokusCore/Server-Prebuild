--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- This triggers when ever the user closes the inventory
--------------------------------------------------------------------------------
RegisterNUICallback('NUIFocusOff', function()
  IsInvOpen = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'close'})
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("drop", function(Data)
  IsBoxOpen = false
  IsPickingUpItem = true
  CloseInv()
  local PedID = PlayerPedId()
  local Coords = GetEntityCoords(PedID)
  local cEncode = json.encode(Coords)
  local Item, Amount = Data.item, Data.count
  local ClosestBox = ClosestBox(Coords)
  if ((ClosestBox.Closest == nil) or (ClosestBox.Closest > 10)) then
    TriggerEvent('DokusCore:Inventory:Animation', PedID)
    TSC('DokusCore:Core:DBIns:Storages', { 'DropBox', { Steam, CharID, CreateNewBox(Coords), Item, Amount, Coords } })
    TSC('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { Steam, CharID, Item, Amount } })
  else
    for k,v in pairs(ClosestBox.Data) do
      local cDecode = json.decode(v.Coords)
      local Vector = vector3(cDecode.x, cDecode.y, cDecode.z)
      local Dist = Vdist(Coords, Vector)
      if (Dist == ClosestBox.Closest) then
        local Close, Medium, Far = (Dist <= 0.6), ((Dist > 0.6) and (Dist <= 10)), (Dist > 10)
        if ((Close) or (Far)) then TriggerEvent('DokusCore:Inventory:Animation', PedID) end
        if (Close) then TSC('DokusCore:Core:DBSet:Storages', { 'DropBox', 'InsertItem', { Steam, CharID, v.BoxID, Item, Amount } }) end
        if (Close) then TSC('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { Steam, CharID, Item, Amount } }) end
        if (Medium) then Notify("You're to close to a different DropBox. Get closer or further away!", 'TopRight', 5000) end
        if (Far) then TSC('DokusCore:Core:DBIns:Storages', { 'DropBox', { Steam, CharID, CreateNewBox(Coords), Item, Amount, Coords } }) end
      end
    end
  end
  Wait(1000)
  IsPickingUpItem = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










































































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
