--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local B = _Stores.Categories.Buy
local S = _Stores.Categories.Sell
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:RegisterMenu')
AddEventHandler('DokusCore:Stores:RegisterMenu', function()

  -- Main Menu
  DokusMenu.CreateMenu('StoreMenu', 'Dokus Store', '')
  DokusMenu.SetSubTitle('StoreMenu', 'General Store')

  -- Buy and sell pages
  DokusMenu.CreateMenu('BuyPage', 'Buying Items')
  DokusMenu.SetSubTitle('BuyPage', 'General Store')
  DokusMenu.CreateMenu('SellPage', 'Selling Items')
  DokusMenu.SetSubTitle('SellPage', 'General Store')

  -- Management
  DokusMenu.CreateMenu('ManageMenu', 'Store Manager')
  DokusMenu.SetSubTitle('ManageMenu', 'Owner Menu')

  -- Buying pages
  DokusMenu.CreateMenu('BuyConsumablePage', 'Buy Menu', '')
  DokusMenu.SetSubTitle('BuyConsumablePage', 'Consumables')
  DokusMenu.CreateMenu('BuyMineralsPage', 'Buy Menu')
  DokusMenu.SetSubTitle('BuyMineralsPage', 'Minerals')
  DokusMenu.CreateMenu('BuyValutasPage', 'Buy Menu')
  DokusMenu.SetSubTitle('BuyValutasPage', 'Valutas')
  DokusMenu.CreateMenu('BuyToolsPage', 'Buy Menu')
  DokusMenu.SetSubTitle('BuyToolsPage', 'Tools')
  DokusMenu.CreateMenu('BuyItemsPage', 'Buy Menu')
  DokusMenu.SetSubTitle('BuyItemsPage', 'Items')

  -- Selling pages
  DokusMenu.CreateMenu('SellConsumablePage', 'Sell Menu', '')
  DokusMenu.SetSubTitle('SellConsumablePage', 'Consumables')
  DokusMenu.CreateMenu('SellMineralsPage', 'Sell Menu')
  DokusMenu.SetSubTitle('SellMineralsPage', 'Minerals')
  DokusMenu.CreateMenu('SellValutasPage', 'Sell Menu')
  DokusMenu.SetSubTitle('SellValutasPage', 'Valutas')
  DokusMenu.CreateMenu('SellToolsPage', 'Sell Menu')
  DokusMenu.SetSubTitle('SellToolsPage', 'Tools')
  DokusMenu.CreateMenu('SellItemsPage', 'Sell Menu')
  DokusMenu.SetSubTitle('SellItemsPage', 'Items')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Main Menu
--------------------------------------------------------------------------------
function StoreMenu()
  MenuPage = 'StoreMenu'
  local BuyItem  = DokusMenu.Button('Buy Items')
  local SellItem = DokusMenu.Button('Sell Items')
  local Manager  = DokusMenu.Button('Manage Store')
  if BuyItem  then DokusMenu.OpenMenu('BuyPage') end
  if SellItem then DokusMenu.OpenMenu('SellPage') end
  if Manager  then DokusMenu.OpenMenu('ManageMenu') end
  DokusMenu.Display()
end

function BuyPage()
  MenuPage = 'BuyPage'
  if (B.Consumables) then bConsumable = DokusMenu.Button('Consumables') end
  if (B.Minerals)    then bMinerals = DokusMenu.Button('Minerals') end
  if (B.Valutas)     then bValutas = DokusMenu.Button('Valutas') end
  if (B.Tools)       then bTools = DokusMenu.Button('Tools') end
  if (B.Items)       then bItems = DokusMenu.Button('Items') end
  if (bConsumable)   then DokusMenu.OpenMenu('BuyConsumablePage') end
  if (bMinerals)     then DokusMenu.OpenMenu('BuyMineralsPage') end
  if (bValutas)      then DokusMenu.OpenMenu('BuyValutasPage') end
  if (bTools)        then DokusMenu.OpenMenu('BuyToolsPage') end
  if (bItems)        then DokusMenu.OpenMenu('BuyItemsPage') end
  DokusMenu.Display()
end

function SellPage()
  MenuPage = 'SellPage'
  if (S.Consumables) then sConsumable = DokusMenu.Button('Consumables') end
  if (S.Minerals)    then sMinerals = DokusMenu.Button('Minerals') end
  if (S.Valutas)     then sValutas = DokusMenu.Button('Valutas') end
  if (S.Tools)       then sTools = DokusMenu.Button('Tools') end
  if (S.Items)       then sItems = DokusMenu.Button('Items') end
  if (sConsumable)   then DokusMenu.OpenMenu('SellConsumablePage') end
  if (sMinerals)     then DokusMenu.OpenMenu('SellMineralsPage') end
  if (sValutas)      then DokusMenu.OpenMenu('SellValutasPage') end
  if (sTools)        then DokusMenu.OpenMenu('SellToolsPage') end
  if (sItems)        then DokusMenu.OpenMenu('SellItemsPage') end
  DokusMenu.Display()
end

function ManageMenu()
  MenuPage = 'ManageMenu'
  local pVault      = DokusMenu.Button('Manage Vault')
  local pEmployees  = DokusMenu.Button('Manage Employees')
  local pStock      = DokusMenu.Button('Manage Stock')
  local pStore      = DokusMenu.Button('Manage Store')
  if (pVault) then TriggerEvent('DokusCore:Core:Notify', 'This function is still under development', 'TopRight', 5000) end
  if (pEmployees) then TriggerEvent('DokusCore:Core:Notify', 'This function is still under development', 'TopRight', 5000) end
  if (pStock) then TriggerEvent('DokusCore:Core:Notify', 'This function is still under development', 'TopRight', 5000) end
  if (pStore) then TriggerEvent('DokusCore:Core:Notify', 'This function is still under development', 'TopRight', 5000) end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Buying Pages
--------------------------------------------------------------------------------
function BuyConsumablePage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'BuyConsumablePage'
  for k,v in pairs(Consumables) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function BuyMineralsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'BuyMineralsPage'
  for k,v in pairs(Minerals) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function BuyValutasPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'BuyValutasPage'
  for k,v in pairs(Valutas) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function BuyToolsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'BuyToolsPage'
  for k,v in pairs(Tools) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function BuyItemsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'BuyItemsPage'
  for k,v in pairs(Items) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:BuyItem', v) end
      end
    end
  end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Selling Page
--------------------------------------------------------------------------------
function SellConsumablePage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'SellConsumablePage'
  for k,v in pairs(Consumables) do
    if (Low(v.CanSell) == 'true') then
      -- Items for sale in valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function SellMineralsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'SellMineralsPage'
  for k,v in pairs(Minerals) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function SellValutasPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'SellValutasPage'
  for k,v in pairs(Valutas) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function SellToolsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'SellToolsPage'
  for k,v in pairs(Tools) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end
    end
  end
  DokusMenu.Display()
end

function SellItemsPage()
  if (Loc == nil) then return end
  -- Get all consumable items that can be bought
  MenuPage = 'SellItemsPage'
  for k,v in pairs(Items) do
    if (v.CanBuy == Low('true')) then
      -- Items for sale in Valentine
      if ((Low(Loc) == 'valentine') and (Low(v.Valentine) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Saint Denise
      if ((Low(Loc) == 'saintdenis') and (Low(v.SaintDenis) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in BlackWater
      if ((Low(Loc) == 'blackwater') and (Low(v.Blackwater) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Tumbleweed
      if ((Low(Loc) == 'tumbleweed') and (Low(v.Tumbleweed) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Rhodes
      if ((Low(Loc) == 'rhodes') and (Low(v.Rhodes) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Armadillo
      if ((Low(Loc) == 'armadillo') and (Low(v.Armadillo) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end

      -- Items for sale in Strawberry
      if ((Low(Loc) == 'strawberry') and (Low(v.Strawberry) == 'true')) then
        local Button = DokusMenu.Button(v.Name)
        if (Button) then TriggerEvent('DokusCore:Stores:SellItem', v) end
      end
    end
  end
  DokusMenu.Display()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
