--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
SteamID, CharID, NPCs, Blips = nil, 0, {}, {}
Array_Inv, Array_Store = {}, {}
InArea, InStore, NearNPC = false, false, false
Loc, StoreInUse = nil, false
Prompt_Buy, Prompt_Sell, Prompt_Manage = nil, nil, nil
PromptGroup = GetRandomIntInRange(0, 0xffffff)
Dialog = _Dialogs.Stores
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set the players data
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  SteamID, CharID = Data.SteamID, Data.CharID
end)
--------------------------------------------------------------------------------
-- Set the NPCs and Blips on the map
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Trains) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_Stores.Stores) do if (v.Enabled) then Tabi(Blips, SetBlip(v.Coords, 1475879922, Radius, 'General Store')) end end
    for k,v in pairs(_Stores.NPCs) do if (v.Enabled) then Tabi(NPCs, SpawnNPC(v.Hash, v.Coords, v.Heading)) end end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check databse for new items and insert the needed data.
--------------------------------------------------------------------------------
CreateThread(function()
  while not FrameReady() do Wait(1000) end
  while not UserInGame() do Wait(1000) end
  local Data = TSC('DokusCore:Core:DBGet:Stores', { 'All' })
  if (Data.Exist) then
    local Items = TSC('DokusCore:Core:DBGet:Items', { 'All' })
    TriggerServerEvent('DokusCore:Stores:CheckDatabase', nil, Data.Result, Items.Result)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Event Trigger to Re-Check and ReSync the database items.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:ReSyncStoreItems', function()
  local Data = TSC('DokusCore:Core:DBGet:Stores', { 'All' })
  if (Data.Exist) then
    local Items = TSC('DokusCore:Core:DBGet:Items', { 'All' })
    TriggerServerEvent('DokusCore:Stores:CheckDatabase', false, Data.Result, Items.Result)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check the Distance between the player and the store general area.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Stores) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(500)
      for k,v in pairs(_Stores.Stores) do
        local Dist = GetDistance(v.Coords)
        if ((Loc == nil) and (Dist <= v.Radius)) then Loc = Low(v.ID) end
        if ((Loc ~= nill) and (Low(Loc) == Low(v.ID))) then
          if ((Dist > v.Radius) and (InArea)) then SetOutArea() end
          if ((Dist <= v.Radius) and not (InArea)) then SetInArea() end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check the Distance beteeen the player and the store itself.
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:CheckDistStore', function()
  while InArea do Wait(500)
    for k,v in pairs(_Stores.Stores) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius) and (InStore)) then SetOutStore() end
        if ((Dist <= v.Radius) and not (InStore)) then SetInStore() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:CheckDistNPC', function()
  while InStore do Wait(500)
    for k,v in pairs(_Stores.NPCs) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius) and (NearNPC)) then SetFarNPC() end
        if ((Dist <= v.Radius) and not (NearNPC)) then SetNearNPC() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:ShowPrompt', function()
  PromptKey()
  while ((NearNPC) and not (StoreInUse)) do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'General Store')
    PromptSetActiveGroupThisFrame(PromptGroup, pName)
    local P = PromptHasHoldModeCompleted(Prompt_Buy)
    local S = PromptHasHoldModeCompleted(Prompt_Sell)
    local X = PromptHasHoldModeCompleted(Prompt_Manage)
    if ((P) and not (StoreInUse)) then OpenStoreBuy() end
    if ((S) and not (StoreInUse)) then OpenStoreSell() end
    if ((X) and not (StoreInUse)) then Message('InDev') end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:OpenStore', function(Type)
  if (Low(Type) == 'buy') then
    Radar(false)
    SetFreeze(PedID(), true)
    ShowCores(false) Wait(1000)
    SetNuiFocus(true, true)
    SendNUIMessage({
      Type = Type,
      Display = true,
      StoreData = Array_Store,
      ShopName = 'General Store (Buy)'
    })
  elseif (Low(Type) == 'sell') then
    Radar(false)
    SetFreeze(PedID(), true)
    ShowCores(false) Wait(1000)
    SetNuiFocus(true, true)
    SendNUIMessage({
      Type = Type,
      Display = true,
      StoreData = Array_Inv,
      ShopName = 'Inventory (Sell)'
    })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:BuyItem', function(Item)
  local Amount  = tonumber(Item.Result)
  if (Amount == nil) then NREntryErr() ResetStore() IndexAllData() Open('Buy') return end
  if (Amount < 0) then Message('NoMinNumber') ResetStore() IndexAllData() Open('Buy') return end
  local PricePP  = Item.Data.Price
  local NewPrice = (PricePP * Amount)
  local Item     = Item.Data.Item


  if (Amount >= 1) then
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } })
    local Money = User.Result[1].Money
    if (NewPrice > Money) then Message('NoBuyMoney') ResetStore() IndexAllData() Open('Buy') return end
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Item } })
    if not (Inv.Exist) then InsertInvItem(Item, Amount) ResetStore() IndexAllData() Open('Buy') end
    if (Inv.Exist) then AddInvItem(Item, Amount, Inv.Result) ResetStore() IndexAllData() Open('Buy') end
    TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { SteamID, CharID, (Money - NewPrice) } })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:SellItem', function(Item)
  local Amount = tonumber(Item.Result)
  if (Amount == nil) then NREntryErr() ResetStore() IndexAllData() Open('Sell') return end
  if (Amount < 0) then Message('NoMinNumber') ResetStore() IndexAllData() Open('Sell') return end
  local PricePP  = Item.Data.Price
  local NewPrice = (PricePP * Amount)
  local Item = Item.Data.Item

  if (Amount >= 1) then
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } })
    local Money = User.Result[1].Money
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Item } })
    if (Amount > Inv.Result[1].Amount) then Message('NotEnough') ResetStore() IndexAllData() Open('Sell') return end
    if ((Inv.Result[1].Amount - Amount) == 0) then DelInvItem(Item, Amount) ResetStore() IndexAllData() Open('Sell') end
    if ((Inv.Result[1].Amount - Amount > 0)) then SetInvItem(Item, Amount, Inv.Result[1].Amount) ResetStore() IndexAllData() Open('Sell') end
    TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { SteamID, CharID, (Money + NewPrice) } })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Make sure the user sees his radar and metabolism again
--------------------------------------------------------------------------------
AddEventHandler('onResourceStart', function(R)
  if (ResName() == R) then Radar(true) ShowCores(true) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(NPCs)  do DeleteEntity(v) end
  for k,v in pairs(Blips) do RemoveBlip(v)   end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
