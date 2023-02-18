--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:Tools:Equipt', function(Data)
  if (Low(Data.Item) == 'weapon_melee_lantern') then
    GiveWeaponToPed_2(PedID(), GetHashKey(Data.Item),0,true,true,1,false,0.5,1.0,false,0)
  elseif (Low(Data.Item) == 'weapon_melee_hatchet') then
    GiveWeaponToPed_2(PlayerPedId(),GetHashKey(Data.Item),1,false,true,1,false,0.5,1.0,false,0)
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { Sync.SteamID, Sync.CharID, Data.Item }
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index }).Result[1]

    -- Delete the inventory item when not more then 1 exists
    if (Inv.Amount == 1) then
      local Index = { Sync.SteamID, Sync.CharID, Data.Item }
      TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'Item', Index })
    end

    -- If user has more of the same weapon, just reduce it by 1.
    if (Inv.Amount > 1) then
      local Index = { Sync.SteamID, Sync.CharID, Data.Item, 1, Inv.Amount, Inv.Meta }
      TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
