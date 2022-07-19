--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local DBChecked = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check databse for new items and insert the needed data.
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Stores:CheckDatabase')
AddEventHandler('DokusCore:Stores:CheckDatabase', function(Bool, Data, Items)
  if (Bool ~= nil) then DBChecked = Bool end
  if not (DBChecked) then
    for k,v in pairs(Data) do
      if (v.Stores      == '--') then TriggerEvent('DokusCore:Core:DBSet:Stores', { 'StoreData', { v.Item, SetStoreData()     } }) end
      if (v.Stock       == '--') then TriggerEvent('DokusCore:Core:DBSet:Stores', { 'StockData', { v.Item, SetStockData(Data) } }) end
      if (v.ItemData    == '--') then TriggerEvent('DokusCore:Core:DBSet:Stores', { 'ItemData',  { v.Item, SetItemData(Data)  } }) end
      if (v.Taxation    == '--') then TriggerEvent('DokusCore:Core:DBSet:Stores', { 'TaxData',   { v.Item, SetTaxData()       } }) end
      if (v.Type        == '--') then SetItemType(v.Item, Items) end
      if (v.Name        == '--') then SetItemName(v.Item, Items) end
      if (v.Description == '--') then SetItemDesc(v.Item, Items) end
    end DBChecked = true
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
