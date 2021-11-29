--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  DokusMenu.CreateMenu('BoxMenu', 'DropBox', '')
  DokusMenu.SetSubTitle('BoxMenu', 'Loot Box')
  DokusMenu.CreateMenu('BoxItems', 'DropBox', '')
  DokusMenu.SetSubTitle('BoxItems', 'Loot Box')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
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
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
