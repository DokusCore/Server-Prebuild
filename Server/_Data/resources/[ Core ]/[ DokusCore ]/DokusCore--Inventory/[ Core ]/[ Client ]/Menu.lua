--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  DokusMenu.CreateMenu('BoxMenu', 'DropBox', '')
  DokusMenu.SetSubTitle('BoxMenu', 'Loot Box')
  DokusMenu.CreateMenu('BoxItems', 'DropBox', '')
  DokusMenu.SetSubTitle('BoxItems', 'Loot Box')
end)


RegisterNetEvent('DokusCore:Inventory:OpenBoxMenu')
AddEventHandler('DokusCore:Inventory:OpenBoxMenu', function(BoxID)
  DokusMenu.OpenMenu('BoxMenu')
  local DokusPage = DokusMenu.IsMenuOpened
  local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'BoxID', { BoxID } })
  local Items = json.decode(Data.Result[1].Meta)
  while IsBoxOpen do Wait(0)
    if DokusPage('BoxMenu') then
      for k,v in pairs(Items) do
        local Item, Amount = v.Item, v.Amount
        if (Amount <= 9) then Amount = (0 .. Amount) end
        local Button = DokusMenu.Button(Amount.. "      "..v.Item)
        if (Button) then TriggerEvent('DokusCore:Inventory:RemoveBoxItem', BoxID, Item, Amount) end
      end
    end
    DokusMenu.Display()
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
  if (Data.RemoveBox) then for k,v in pairs(BoxArray) do DeleteEntity(v.BoxID) end end
  if (Data.RemoveBox) then for k,v in pairs(BoxTXTs) do if (v.BoxID == BoxID) then table.remove(BoxTXTs, k) end end end
  Wait(2000)
  IsPickingUpItem = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
