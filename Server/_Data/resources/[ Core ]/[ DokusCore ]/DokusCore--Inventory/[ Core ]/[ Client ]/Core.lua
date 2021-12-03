--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
CanInvBeOpened, IsInvOpen, IsBoxOpen = true, false, false
Steam, CharID, IsPickingUpItem = nil, nil, false
NewDrop, MenuOpen = false, false
PromptBox = nil
ActKeyInv = _Inventory.ActKey.OpenInv
ActKeyBox = _Inventory.ActKey.OpenBox
OpenBoxGroup = GetRandomIntInRange(0, 0xffffff)
BoxArray = {}
BoxTXTs = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Register when the user wants to open the inventory
--------------------------------------------------------------------------------
-- CreateThread(function()
--   while true do Wait(1000)
--     while CanInvBeOpened do Wait(0)
--       local Control = IsControlJustReleased(0, ActKeyInv)
--       if (not (IsInvOpen) and (Control) and not (IsPickingUpItem)) then
--         IsInvOpen = true
--         local Core = TSC('DokusCore:Core:GetCoreUserData')
--         Steam, CharID = Core.Steam, Core.CharID
--         TriggerEvent('DokusCore:Inventory:UpdateBankValues')
--         local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'All', { Steam, CharID } })
--         if (Inv.Exist) then SendNUIMessage({ items = GetUsersItems(Inv) }) end
--         OpenInv()
--       elseif (IsInvOpen) and (Control) then
--         IsInvOpen = false
--         CloseInv()
--       end
--     end
--   end
-- end)

RegisterNetEvent('DokusCore:Inventory:OpenInventory')
AddEventHandler('DokusCore:Inventory:OpenInventory', function()
  -- while CanInvBeOpened do Wait(0)
    -- local Control = IsControlJustReleased(0, ActKeyInv)
    if (not (IsInvOpen) and not (IsPickingUpItem)) then
      IsInvOpen = true
      local Core = TSC('DokusCore:Core:GetCoreUserData')
      Steam, CharID = Core.Steam, Core.CharID
      TriggerEvent('DokusCore:Inventory:UpdateBankValues')
      local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'All', { Steam, CharID } })
      if (Inv.Exist) then SendNUIMessage({ items = GetUsersItems(Inv) }) end
      OpenInv()
    elseif (IsInvOpen) and (Control) then
      IsInvOpen = false
      CloseInv()
    end
  -- end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Update users banking information in the inventory while open
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:UpdateBankValues')
AddEventHandler('DokusCore:Inventory:UpdateBankValues', function()
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', { Steam, CharID } }).Result[1]
  while IsInvOpen do Wait(0)
    SendNUIMessage({
      wallet = Bank.Money, gold = Bank.Gold,
      bank = Bank.BankMoney, label = 'In Progress',
    }) Wait(1000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:Animation')
AddEventHandler('DokusCore:Inventory:Animation', function(PedID) Animation(PedID) end)
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
-- Then place all boxes back on the map.
--------------------------------------------------------------------------------
CreateThread(function()
  local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'All' })
  if (Data.Exist) then
    for k,v in pairs(Data.Result) do
      local Coords = json.decode(v.Coords)
      local Vector = vector3(Coords.x, Coords.y, Coords.z)
      TSC('DokusCore:Core:DBSet:Storages', { 'DropBox', 'ReplaceID', { v.BoxID, CreateNewBox(Vector) } })
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Get players coords to feed box texts, this to prevent high resource SPU usages
--------------------------------------------------------------------------------
local PlayerCoords = nil
CreateThread(function()
  while true do Wait(1)
    local PedID = PlayerPedId()
    local Coords = GetEntityCoords(PedID)
    PlayerCoords = Coords
    Wait(500)
  end
end)
--------------------------------------------------------------------------------
-- Create the text above the boxes, and Register when the box is opened
--------------------------------------------------------------------------------
CreateThread(function() Wait(1000)
  local Core = TSC('DokusCore:Core:GetCoreUserData')
  Steam, CharID = Core.Steam, Core.CharID
  while true do Wait(1000)
    while (BoxTXTs[1] ~= nil) do Wait(0)
      for k,v in pairs(BoxTXTs) do
        local BoxID, Coords = BoxTXTs[k].BoxID, BoxTXTs[k].Coords
        local x,y,z = Coords.x, Coords.y, (Coords.z - 0.65)
        local Dist = Vdist(Coords, PlayerCoords)
        local Close, Medium = (Dist <= 0.6), ((Dist > 0.6) and (Dist <= 2.0))
        local Key = _Inventory.Interaction.UseKey
        if ((Close) and (Key)) then DrawText3D(x,y,z, 300, 'Press ~color_green~E~q~ to open') end
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
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:RemoveBoxItem')
AddEventHandler('DokusCore:Inventory:RemoveBoxItem', function(BoxID, Item, Amount)
  IsBoxOpen = false
  IsPickingUpItem = true
  local PedID = PlayerPedId()
  TriggerEvent('DokusCore:Inventory:Animation', PedID)
  TSC('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', { Steam, CharID, Item, Amount } })
  local Data = TSC('DokusCore:Core:DBSet:Storages', { 'DropBox', 'RemoveItem', { BoxID, Item, Amount } })
  if (Data.RemoveBox) then for k,v in pairs(BoxArray) do if (v.BoxID == BoxID) then DeleteEntity(v.BoxID) end end end
  if (Data.RemoveBox) then for k,v in pairs(BoxTXTs) do if (v.BoxID == BoxID) then table.remove(BoxTXTs, k) end end end
  Wait(2000)
  IsPickingUpItem = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
