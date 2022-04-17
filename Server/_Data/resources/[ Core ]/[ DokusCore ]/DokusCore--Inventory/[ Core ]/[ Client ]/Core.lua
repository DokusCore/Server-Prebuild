--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
BoxArray, BoxTXTs = {}, {}
Steam, CharID = nil, nil
IsInvOpen, IsPickingUpItem, IsBoxOpen = false, false, false
ActKeyInv = _Inventory.ActKey.OpenInv
ActKeyBox = _Inventory.ActKey.OpenBox
Ani = "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop"
local Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for FrameReady and set the Users Data
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  Steam, CharID = Data.SteamID, Data.CharID
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Register when the user wants to open the inventory
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:OpenInventory')
AddEventHandler('DokusCore:Inventory:OpenInventory', function()
  if (_Modules.Inventory) then
    if (not (IsInvOpen) and not (IsPickingUpItem)) then
      IsInvOpen = true
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
RegisterNetEvent('DokusCore:Inventory:UpdateBankValues')
AddEventHandler('DokusCore:Inventory:UpdateBankValues', function()
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
-- Resync on DokusCore restart
--------------------------------------------------------------------------------
-- AddEventHandler('onResourceStart', function(resourceName)
--   if (resourceName == 'DokusCore') then
--     while not FrameReady() do Wait(1000) end
--     while not UserInGame() do Wait(1000) end
--     local Data = TCTCC('DokusCore:Sync:Get:UserData')
--     Steam, CharID = Data.SteamID, Data.CharID
--   end
-- end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Then place all boxes back on the map.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'All' })
    if (Data.Exist) then
      for k,v in pairs(Data.Result) do
        local Coords = json.decode(v.Coords)
        local Vector = vector3(Coords.x, Coords.y, Coords.z)
        TriggerServerEvent('DokusCore:Core:DBSet:Storages', { 'DropBox', 'ReplaceID', { v.BoxID, CreateNewBox(Vector) } })
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Get players coords to feed box texts, this to prevent high resource SPU usages
--------------------------------------------------------------------------------
local PlayerCoords = nil
CreateThread(function()
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1)
      local PedID = PedID()
      local Coords = GetCoords(PedID)
      PlayerCoords = Coords
      Wait(500)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the text above the boxes, and Register when the box is opened
--------------------------------------------------------------------------------
CreateThread(function() Wait(1000)
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Core = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Core.SteamID, Core.CharID
    while true do Wait(1000)
      while (BoxTXTs[1] ~= nil) do Wait(0)
        for k,v in pairs(BoxTXTs) do
          local BoxID, Coords = BoxTXTs[k].BoxID, BoxTXTs[k].Coords
          local x,y,z = Coords.x, Coords.y, (Coords.z - 0.65)
          local Dist = Vdist(Coords, PlayerCoords)
          local Close, Medium = (Dist <= 0.6), ((Dist > 0.6) and (Dist <= 2.0))
          local Key = _Inventory.Interaction.UseKey
          if (Close) then DrawText3D(x,y,z, 300, 'Press ~color_green~E~q~ to open') end
          if (Medium) then DrawText3D(x,y,z, 200, '{ Expire: Work in Progress }') end
          if ((Medium) or (Far)) then IsBoxOpen = false end
          if (Close) then
            local Control = IsControlJustReleased(0, ActKeyBox)
            if ((Control) and not (IsBoxOpen)) then
              IsBoxOpen = true
              TriggerEvent('DokusCore:Inventory:OpenBoxMenu', BoxID)
            end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:PickUpBoxItem')
AddEventHandler('DokusCore:Inventory:PickUpBoxItem', function(args)
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
RegisterNetEvent('DokusCore:Inventory:BoxHandling')
AddEventHandler('DokusCore:Inventory:BoxHandling', function(Data)
  if (Low(Data[1]) == 'removebox') then
    local BoxID = Data[2][1]
    for k,v in pairs(BoxArray) do if (v.BoxID == BoxID) then DeleteEntity(v.BoxID) end end
    for k,v in pairs(BoxTXTs) do if (v.BoxID == BoxID) then table.remove(BoxTXTs, k) end end
    Wait(2000) IsPickingUpItem = false
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
