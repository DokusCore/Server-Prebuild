--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CloseNUI', function() ResetStore() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NoSelectItemError', function() Notify("You've have not selected an item yet!") end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('BuyItem', function(Data) CloseStore()
  NREntry('Insert Amount', 'Client', 'DokusCore:Stores:BuyItem', { Item = Data.Item, Price = Data.Price })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SellItem', function(Data) CloseStore()
  NREntry('Insert Amount', 'Client', 'DokusCore:Stores:SellItem', { Item = Data.Item, Price = Data.Price })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenBuyScreen', function(Data) CloseStore()
  OpenStoreSell()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenSellScreen', function(Data) CloseStore()
  OpenStoreBuy()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
