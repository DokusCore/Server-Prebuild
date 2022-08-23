--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Inventory) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    DokusMenu.CreateMenu('BoxMenu', 'DropBox', '')
    DokusMenu.SetSubTitle('BoxMenu', 'Loot Box')
    DokusMenu.CreateMenu('BoxItems', 'DropBox', '')
    DokusMenu.SetSubTitle('BoxItems', 'Loot Box')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:OpenBoxMenu')
AddEventHandler('DokusCore:Inventory:OpenBoxMenu', function(BoxID)
  DokusMenu.OpenMenu('BoxMenu')
  local DokusPage = DokusMenu.IsMenuOpened
  local Data = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'BoxID', { BoxID } })
  local Items = Decoded(Data.Result[1].Meta)
  TriggerEvent('DokusCore:Inventory:WaitToClose')
  while IsBoxOpen do Wait(0)
    if (not (IsPickingUpItem)) then
      if DokusPage('BoxMenu') then
        for k,v in pairs(Items) do
          local Item, Amount = v.Item, v.Amount
          if (Amount <= 9) then Amount = (0 .. Amount) end
          local Button = DokusMenu.Button(Amount.. "      "..v.Item)
          if (Button) then
            TriggerEvent('DokusCore:Inventory:PickUpBoxItem', { BoxID, Item, Amount })
          end
        end
      end
      DokusMenu.Display()
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Inventory:WaitToClose')
AddEventHandler('DokusCore:Inventory:WaitToClose', function()
  while IsBoxOpen do Wait(1)
    local Back = IsControlJustPressed(0, _Keys['BACKSPACE'])
    if (Back) then IsBoxOpen = false DokusMenu.CloseMenu() end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
