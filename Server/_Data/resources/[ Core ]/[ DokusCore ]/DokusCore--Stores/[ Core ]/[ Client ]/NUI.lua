--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CloseNUI', function()
  SetFreeze(PedID(), false)
  ShowPrompt = false
  SetNuiFocus(false, false)
  local Txt = RandomDialog(MSG('MenuExit'))
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000)) Wait(500)
  ShowPrompt = true
  ResetStore()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoSelectItemError', function() Notify(MSG("NoItem").MSG) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('BuyItem', function(Data) CloseStore()
  local Item, Price, Amount = Data.Item, Data.Price, Data.Amount
  local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } })
  local Money = User.Result[1].Money
  if (TN(Price) > TN(Money)) then Message('NoBuyMoney') ResetStore() IndexAllData() Open('Buy') return end
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Item } })
  if not (Inv.Exist) then InsertInvItem(Item, Amount) ResetStore() IndexAllData() Open('Buy') end
  if (Inv.Exist) then AddInvItem(Item, Amount, Inv.Result) ResetStore() IndexAllData() Open('Buy') end
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { SteamID, CharID, (Money - Price) } })
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SellItem', function(Data) CloseStore()
  local Item, Price, Amount = Data.Item, Data.Price, Data.Amount
  local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } })
  local Money = User.Result[1].Money
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { SteamID, CharID, Item } })
  if (Amount > Inv.Result[1].Amount) then Message('NotEnough') ResetStore() IndexAllData() Open('Sell') return end
  if ((Inv.Result[1].Amount - Amount) == 0) then DelInvItem(Item, Amount) ResetStore() IndexAllData() Open('Sell') end
  if ((Inv.Result[1].Amount - Amount > 0)) then SetInvItem(Item, Amount, Inv.Result[1].Amount) ResetStore() IndexAllData() Open('Sell') end
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { SteamID, CharID, (Money + Price) } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenBuyScreen', function(Data) CloseStore() OpenStoreSell() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenSellScreen', function(Data) CloseStore() OpenStoreBuy() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
