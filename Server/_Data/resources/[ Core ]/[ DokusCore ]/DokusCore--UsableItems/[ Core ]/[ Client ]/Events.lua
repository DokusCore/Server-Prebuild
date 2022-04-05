--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:Sync', function()
  local Items = TSC('DokusCore:Core:DBGet:Items', { 'All' })
  TriggerEvent('DokusCore:Sync:Set:ModuleData', { 'UsableItems', { Items.Result } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:UseItem', function(Data)
  local PedID = PedID()
  local Item, Amount = Data.Item, Data.Amount
  local Items = TCTCC('DokuCore:Sync:Get:ModuleData').UsableItems
  for k,v in pairs(Items) do
    if (Item == v.Item) then
      local IsMeta, Meta = v.Metabolism, {}
      local Type, CanPlace = v.Type, v.CanPlace
      local ConvA, InvLimit = v.CA, v.InvLimit
      local Prop, PropPos, Ani, AniTime = v.Prop, v.PropPos, v.Animation, v.AniTime
      local Hunger, Thirst, Stamina, Health = v.Hunger, v.Thirst, v.Stamina, v.Health
      local GHI, GHO, GSI, GSO = v.GHI, v.GHO, v.GSI, v.GSO

      -- Table the Metabolism values
      if (IsMeta) then
        table.insert(Meta, {
          Hunger = Hunger, Thirst = Thirst,
          Stamina = Stamina, Health = Health,
          GHI = GHI, GHO = GHO, GSI = GSI, GSO = GSO,
          Amount = Amount
        })
      end

      -- Execute animation based on the item type
      if (Low(Type) == 'deployable') then TaskPlaceWithProp(PedID, Prop, Ani, AniTime, IsMeta, Meta) DelInv(PedID, Amount, v) end
      if (Low(Type) == 'consumable') then TaskConsumeItem(PedID, Prop, PropPos, Ani, IsMeta, Meta) DelInv(PedID, Amount, v) end
      if (Low(Type) == 'valuta') then Notify('UsableItems is not ready to work with valutas yet!') return end
      if (Low(Type) == 'mineral') then Notify('UsableItems is not ready to work with minerals yet!') return end
      if (Low(Type) == 'tool') then Notify('UsableItems is not ready to work with tools yet!') return end
    end
  end
end)
--------------------------------------------------------------------------------
---------------------------------------------------------- ----------------------
