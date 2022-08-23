--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Register when the user wants to open the inventory
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:OpenInventory', function()
  if (_Modules.Inventory) then
    if (not (IsInvOpen) and not (IsPickingUpItem)) then
      IsInvOpen = true
      Notify("Change the amount using the numbers on your keyboard!", "TopCenter", 5000)
      TriggerEvent('DokusCore:Inventory:UpdateBankValues')
      local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'All', { Steam, CharID } })
      if (Inv.Exist) then SendNUIMessage({ items = GetUsersItems(Inv) }) end
      OpenInv()
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Update users banking information in the inventory while open
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:UpdateBankValues', function()
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
  while IsInvOpen do Wait(0)
    SendNUIMessage({
      wallet = Char.Money, gold = Char.Gold,
      bank = '???', label = 'In Progress',
    }) Wait(1000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all Boxes when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(BoxArray) do DeleteEntity(v.BoxID) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:PickUpBoxItem', function(args)
  IsBoxOpen = false
  IsPickingUpItem = true
  local BoxID, Item, Amount = args[1], args[2], tonumber(args[3])
  local PedID = PedID()
  Animation(PedID, Ani, 3000)
  local InvItem = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, Item } })
  if (InvItem.Exist) then
    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', { Steam, CharID, Item, Amount, InvItem.Result[1].Amount } })
    local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'BoxID', { BoxID } })
    TriggerServerEvent('DokusCore:Core:DBSet:Storages',  { 'DropBox', 'RemoveItem', { BoxID, Data.Result[1].Meta, Item, Amount } })
  else
    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, 'IN DEVELOPMENT', Item, Amount } })
    local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'BoxID', { BoxID } })
    TriggerServerEvent('DokusCore:Core:DBSet:Storages',  { 'DropBox', 'RemoveItem', { BoxID, Data.Result[1].Meta, Item, Amount } })
  end

  IsPickingUpItem = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:BoxHandling', function(Data)
  if (Low(Data[1]) == 'removebox') then
    local BoxID = Data[2][1]
    for k,v in pairs(BoxArray) do if (v.BoxID == BoxID) then DeleteEntity(v.BoxID) end end
    for k,v in pairs(BoxTXTs) do if (v.BoxID == BoxID) then table.remove(BoxTXTs, k) end end
    Wait(2000) IsPickingUpItem = false
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Reset player status when player logs out.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:User:Logout', function()
  BoxArray, BoxTXTs = {}, {}
  Steam, CharID = nil, nil
  IsInvOpen, IsPickingUpItem, IsBoxOpen = false, false, false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:User:Login', function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  Steam, CharID = Data.SteamID, Data.CharID
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
