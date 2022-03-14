--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NUIFocusOff', function()
  IsInvOpen = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'close'})
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("NoItemSelected", function()
  Notify('You have no item selected to drop on the ground! First select an item!')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("NotEnoughAmount", function(Data)
  Notify('You do not have enough '..Data.item..' in your inventory! Unable to drop this item on the ground!')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("NoAmountSet", function(Data)
  Notify('You have no amount set in the amount parameter. Unable to drop your item!')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("drop", function(Data)
  IsBoxOpen = false
  IsPickingUpItem = true
  local PedID  = PedID()
  local Coords = GetCoords(PedID)
  local CEnc   = Encoded(Coords)
  local CBox   = ClosestBox(Coords)
  local Item   = Data.item
  local Amount = Data.count
  local UserItems = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, Item } })
  local ItemAmount = UserItems.Result[1].Amount

  -- Making a new box when no box is in range
  if ((CBox.Closest == nil) or (CBox.Closest > 10)) then
    if (ItemAmount >= Amount) then
      CloseInv()
      Animation(PedID, Ani, 3000)
      PlaySound('CHECKPOINT_PERFECT', 'HUD_MINI_GAME_SOUNDSET')
      TriggerServerEvent('DokusCore:Core:DBIns:Storages',  { 'DropBox', { Steam, CharID, CreateNewBox(Coords), Item, Amount, Coords } })
      TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { Steam, CharID, Item, Amount, ItemAmount } })
      IsPickingUpItem = false
    end
  else
    CloseInv()
    for k,v in pairs(CBox.Data) do
      local Dec = Decoded(v.Coords)
      local Vector = vector3(Dec.x, Dec.y, Dec.z)
      local Dist = Vdist(Coords, Vector)

      if (Dist == CBox.Closest) then
        local Close, Medium, Far = (Dist <= 0.6), ((Dist > 0.6) and (Dist <= 10)), (Dist > 10)
        if ((Close) or (Far)) then Animation(PedID, "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop", 2200) end
        if ((Close) or (Far)) then PlaySound('CHECKPOINT_PERFECT', 'HUD_MINI_GAME_SOUNDSET') end
        if (Medium) then Notify("You're to close to a different DropBox. Get closer or further away!", 'TopRight', 5000) end
        if (Close) then
          local Drop = TSC('DokusCore:Core:DBGet:Storages',    { 'DropBox', 'BoxID', { v.BoxID } })
          TriggerServerEvent('DokusCore:Core:DBSet:Storages',  { 'DropBox', 'InsertItem', { Steam, CharID, { v.BoxID, Drop.Result[1].Meta, Item, Amount }}})
          TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { Steam, CharID, Item, Amount, ItemAmount } })
        end
        IsPickingUpItem = false
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
