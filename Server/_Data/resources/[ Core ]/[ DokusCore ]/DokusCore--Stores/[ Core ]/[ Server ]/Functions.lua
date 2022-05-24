--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function SetStoreData()
  local Index = {}
  for k,v in pairs(_Stores.Stores) do
    table.insert(Index, { Store = v.ID, Buy = true, Sell = true })
  end return json.encode(Index)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetStockData(Items)
  local Index = {}
  for k,v in pairs(Items) do
    for o,p in pairs(_Stores.Stores) do
      table.insert(Index, { Store = p.ID, Stock = v.Limit })
    end return json.encode(Index)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetItemData(Items)
  local Index = {}
  for k,v in pairs(Items) do
    for o,p in pairs(_Stores.Stores) do
      table.insert(Index, { Store = p.ID, Sell = v.Sell, Buy = v.Buy })
    end return json.encode(Index)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetTaxData(Items)
  local Index = {}
  for k,v in pairs(_Stores.Stores) do
    table.insert(Index, { Store = v.ID, bTax = 0, sTax = 0 })
  end return json.encode(Index)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetItemType(Item, Data)
  for k,v in pairs(Data) do
    if (v.Item == Item) then
      TriggerEvent('DokusCore:Core:DBSet:Stores', { 'ItemType',   { Item, v.Type} })
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetItemName(Item, Data)
  for k,v in pairs(Data) do
    if (v.Item == Item) then
      TriggerEvent('DokusCore:Core:DBSet:Stores', { 'ItemName',   { Item, v.Name} })
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetItemDesc(Item, Data)
  for k,v in pairs(Data) do
    if (v.Item == Item) then
      TriggerEvent('DokusCore:Core:DBSet:Stores', { 'ItemDescription',   { Item, v.Description} })
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
