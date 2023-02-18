--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CloseNUI', function()
  Radar(true)
  SetNuiFocus(false, false)
  local Txt = RandomDialog(MSG('MenuExit'))
  local Random = Txt[math.random(#Txt)]
  if (CustomNPCData == nil) then NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000)) Wait(500) end
  if (CustomNPCData ~= nil) then NoteNPCTalk(CustomNPCData.NPCName, Random.MSG, false, Floor(Random.Time * 1000)) Wait(500) end
  Array_Store, Array_Inv = {}, {}
  StoreInUse, PausePrompts = false, false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoSelectItemError', function() Notify(MSG("NoItem").MSG) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenBuyScreen', function()
  if (CustomNPCData == nil) then CloseStore() OpenCustomSellStore() end
  if (CustomNPCData ~= nil) then CloseStore() OpenCustomSellStore() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenSellScreen', function()
  if (CustomNPCData == nil) then CloseStore() OpenCustomBuyStore() end
  if (CustomNPCData ~= nil) then CloseStore() OpenCustomBuyStore() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('BuyItem', function(Data) CloseStore()
  local Item, Price, Amount = Data.Item, Data.Price, Data.Amount
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
  local User = TSC('DokusCore:Core:DBGet:Characters', Index)
  local Money = User.Result[1].Money
  if (TN(Price) > TN(Money)) then
    Message('NoBuyMoney')
    PausePrompts = false
    StoreInUse = false
    -- OpenGeneralBuyStore()
    return
  end

  local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, Item } }
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', Index)

  if (not (Inv.Exist)) then
    local Index = { 'User', 'InsertItem', { Sync.SteamID, Sync.CharID, 'DEVELOPMENT', Item, Amount } }
    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
  else
    local Index = { 'User', 'AddItem', { Sync.SteamID, Sync.CharID, Item, Amount, Inv.Result[1].Amount } }
    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)
  end

  local Index = { 'Payment', { Sync.SteamID, Sync.CharID, (Money - Price) } }
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
  Message('Buy', Item, Amount)

  PausePrompts = false
  StoreInUse = false
  -- if (CustomNPCData == nil) then OpenGeneralBuyStore() end
  -- if (CustomNPCData ~= nil) then OpenCustomBuyStore() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SellItem', function(Data) CloseStore()
  local Item, Price, Amount = Data.Item, Data.Price, Data.Amount
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
  local User = TSC('DokusCore:Core:DBGet:Characters', Index)
  local Money = User.Result[1].Money
  local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, Item } }
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', Index)
  if (Amount > Inv.Result[1].Amount) then
    Message('NotEnough')
    PausePrompts = false
    StoreInUse = false
    -- if (CustomNPCData == nil) then CloseStore() OpenGeneralSellStore() end
    -- if (CustomNPCData ~= nil) then CloseStore() OpenGeneralSellStore() end
    return
  end
  if ((Inv.Result[1].Amount - Amount) == 0) then
    local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, Item } }
    TriggerServerEvent('DokusCore:Core:DBDel:Inventory', Index)
  end

  if ((Inv.Result[1].Amount - Amount > 0)) then
    local Index = { 'User', 'RemoveItem', { Sync.SteamID, Sync.CharID, Item, Amount, Inv.Result[1].Amount } }
    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)
  end

  local Index = { 'Payment', { Sync.SteamID, Sync.CharID, (Money + Price) } }
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
  Message('Sell', Item, Amount)

  PausePrompts = false
  StoreInUse = false
  -- if (CustomNPCData == nil) then OpenGeneralSellStore() end
  -- if (CustomNPCData ~= nil) then OpenGeneralSellStore() end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
