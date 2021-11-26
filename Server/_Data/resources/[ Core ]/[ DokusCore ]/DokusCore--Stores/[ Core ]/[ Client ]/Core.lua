--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Loc, InArea, InRange = nil, false, false
local Steam, CharID = nil, nil
local PluginReady = false
PromptStore, AliveNPCs = nil, {}
OpenStoreGroup = GetRandomIntInRange(0, 0xffffff)
Low, MenuOpen, MenuPage = string.lower, false, nil
Items, Valutas, Consumables, Tools, Minerals = {}, {}, {}, {}, {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create all the map blips and spawn the NPCs on the map
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Stores) then
    for k,v in pairs(_Stores.Zones) do
      local blip = N_0x554d9d53f696d002(1664425300, v.Coords)
      SetBlipSprite(blip, 1475879922, 1)
  		SetBlipScale(blip, 0.2)
      Citizen.InvokeNative(0x9CB1A1623062F402, blip, 'General Store')
    end

    for k,v in pairs(_Stores.NPCs) do
      SpawnStoreNPC(v.Hash, v.Coords, v.Heading)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
-----------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(AliveNPCs) do DeleteEntity(v) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check players distance from the Stores
--------------------------------------------------------------------------------
CreateThread(function()
  -- First check if the core is ready to pass data
  if (_Modules.Banking) then
    local Ready = TSC('DokusCore:Core:System:IsCoreReady')
    TriggerEvent('DokusCore:Stores:RegisterMenu')
    while not Ready do Wait(1000) end
    while Ready do Wait(1000)
      for k,v in pairs(_Stores.Zones) do
        local Dist = GetDistance(v.Coords)
        if ((Loc == nil) and (Dist <= 7)) then Loc = v.ID end
        if (Loc == v.ID) then

          -- When in range and leaving the area
          if ((Dist > 7) and (InArea)) then
            Loc, InArea = nil, false
            PromptStore = nil
            OpenStoreGroup = GetRandomIntInRange(0, 0xffffff)
            Items = {}
          end

          -- When not in range and entering the area
          if ((Dist <= 7) and not (InArea)) then
            InArea = true
            GetAllItems()
            TriggerEvent('DokusCore:Stores:CheckByNPC')
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check players distance from the NPC
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:CheckByNPC')
AddEventHandler('DokusCore:Stores:CheckByNPC', function()
  local CheckByNPC = true
  while CheckByNPC do Wait(100)
    for k,v in pairs(_Stores.NPCs) do
      if ((Loc == nil) or (v.ID == nil)) then break end
      if (Low(Loc) == Low(v.ID)) then
        local Dist = GetDistance(v.Coords)
        -- When the player gets in the range of the NPC
        if ((Dist <= v.ActRadius) and not InRange) then
          InRange = true
          TriggerEvent('DokusCore:Stores:StartStore')
        end
        -- when the player leave the range of the NPC
        if ((Dist > v.ActRadius) and InRange) then
          CheckByNPC = false Reset()
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Start Banking code when user is in range
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:StartStore')
AddEventHandler('DokusCore:Stores:StartStore', function()
  OpenShop()
  TriggerEvent('DokusCore:Stores:CheckByNPC')
  while InRange do Wait(0)
    local StoreGroupName  = CreateVarString(10, 'LITERAL_STRING', "Shop")
    PromptSetActiveGroupThisFrame(OpenStoreGroup, StoreGroupName)
    if PromptHasHoldModeCompleted(PromptShop) then
      MenuOpen = true MenuPage = 'StoreMenu'
      DokusMenu.OpenMenu('StoreMenu')
      TriggerEvent('DokusCore:Stores:BackSpace')
      local DokusPage = DokusMenu.IsMenuOpened
      while MenuOpen do Wait(0)
        if DokusPage('StoreMenu') then StoreMenu() end
        if DokusPage('ManageMenu') then ManageMenu() end
        if DokusPage('BuyPage') then BuyPage() end
        if DokusPage('SellPage') then SellPage() end

        if DokusPage('BuyConsumablePage') then BuyConsumablePage() end
        if DokusPage('BuyMineralsPage') then BuyMineralsPage() end
        if DokusPage('BuyValutasPage') then BuyValutasPage() end
        if DokusPage('BuyToolsPage') then BuyToolsPage() end
        if DokusPage('BuyItemsPage') then BuyItemsPage() end

        if DokusPage('SellConsumablePage') then SellConsumablePage() end
        if DokusPage('SellMineralsPage') then SellMineralsPage() end
        if DokusPage('SellValutasPage') then SellValutasPage() end
        if DokusPage('SellToolsPage') then SellToolsPage() end
        if DokusPage('SellItemsPage') then SellItemsPage() end
      end
      Wait(2000)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When menu is open let users use backspace to toggle the last menu
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:BackSpace')
AddEventHandler('DokusCore:Stores:BackSpace', function()
  local Close = DokusMenu.CloseMenu
  local Open  = DokusMenu.OpenMenu
  while MenuOpen do Wait(0)
    if IsControlJustPressed(0, _Keys['BACKSPACE']) then
      -- Main Menus
      if (MenuPage == 'StoreMenu') then Close() Reset() end
      if (MenuPage == 'ManageMenu') then Open('StoreMenu') end

      -- Buy page menus
      if (MenuPage == 'BuyPage') then Open('StoreMenu') end
      if (MenuPage == 'BuyConsumablePage') then Open('BuyPage') end
      if (MenuPage == 'BuyMineralsPage') then Open('BuyPage') end
      if (MenuPage == 'BuyValutasPage') then Open('BuyPage') end
      if (MenuPage == 'BuyToolsPage') then Open('BuyPage') end
      if (MenuPage == 'BuyItemsPage') then Open('BuyPage') end

      -- Sell page menus
      if (MenuPage == 'SellPage') then Open('StoreMenu') end
      if (MenuPage == 'SellConsumablePage') then Open('SellPage') end
      if (MenuPage == 'SellMineralsPage') then Open('SellPage') end
      if (MenuPage == 'SellValutasPage') then Open('SellPage') end
      if (MenuPage == 'SellToolsPage') then Open('SellPage') end
      if (MenuPage == 'SellItemsPage') then Open('SellPage') end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
