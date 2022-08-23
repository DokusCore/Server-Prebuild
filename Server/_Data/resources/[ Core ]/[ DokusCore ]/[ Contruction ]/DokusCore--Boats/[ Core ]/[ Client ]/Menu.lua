--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
CreateThread(function()
  DokusMenu.CreateMenu('StoreMenu', 'Boat Store', '')
  DokusMenu.SetSubTitle('StoreMenu', "The best in town")
  DokusMenu.CreateMenu('BuyPage', 'Buying Boats')
  DokusMenu.CreateMenu('SellPage', 'Selling Boats')
  DokusMenu.CreateMenu('ManageMenu', 'Manage Boats')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:OpenMenu', function()
  local DokusPage = DokusMenu.IsMenuOpened
  DokusMenu.OpenMenu('StoreMenu')
  SetUserBoats()
  while StoreInUse do Wait(1)
    while (not (MenuPaused)) do Wait(1)
      if DokusPage('StoreMenu') then StoreMenu() end
      if DokusPage('ManageMenu') then ManageMenu() end
      if DokusPage('BuyPage') then BuyPage() end
      if DokusPage('SellPage') then SellPage() end
    end
  end Wait(2000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When menu is open let users use backspace to toggle the last menu
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:BackSpace')
AddEventHandler('DokusCore:Stores:BackSpace', function()
  local Close = DokusMenu.CloseMenu
  local Open  = DokusMenu.OpenMenu
  while StoreInUse do Wait(0)
    if IsControlJustPressed(0, _Keys['BACKSPACE']) then
      if (MenuPage == 'ManageMenu') then Open('StoreMenu') end
      if (MenuPage == 'BuyPage') then Open('StoreMenu') end
      if (MenuPage == 'SellPage') then Open('StoreMenu') end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function StoreMenu()
  MenuPage        = 'StoreMenu'
  local BuyItem   = DokusMenu.Button(Dialog.BuyBoat)
  local SellItem  = DokusMenu.Button(Dialog.SellBoat)
  local Manager   = DokusMenu.Button(Dialog.ManageBoat)
  local Brexit    = DokusMenu.Button(Dialog.ExitMenu)
  if ( BuyItem )  then DokusMenu.OpenMenu('BuyPage') end
  if ( SellItem ) then DokusMenu.OpenMenu('SellPage') end
  if ( Manager )  then DokusMenu.OpenMenu('ManageMenu') end
  if ( Brexit )   then ExitMenu() UserBoats = {} end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Reset()
  MenuPage = nil
  Prompt_Menu = nil
  ShowPrompts = false
  StoreInUse = false
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function BuyPage()
  MenuPage = 'BuyPage'
  for k,v in pairs(BoatArr) do
    local Dec = Decoded(v.Meta)
    if (Low(v.Type) == 'boat') then
      local Button = DokusMenu.Button("$"..TS(Dec.BuyPrice).."  |  "..v.Name)
      if ((Button) and (not (PauseScript))) then TriggerEvent('DokusCore:Boats:Buy', v) Wait(2000) end
    end
  end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SellPage()
  MenuPage = 'SellPage'
  for k,v in pairs(UserBoats) do
    local Button = DokusMenu.Button(v.Name)
    if ((Button) and (not (PauseScript))) then TriggerEvent('DokusCore:Boats:Sell', v) Wait(2000) end
  end
  DokusMenu.Display()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ManageMenu()
  MenuPage = 'ManageMenu'
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ExitMenu()
  DokusMenu.CloseMenu()
  MenuPage = nil
  StoreInUse = false
  ShowPrompts, CloseNPC = false, false
  Prompt_Menu, Group = nil, GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
