--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:Weapon:Equipt', function(Data)
  if (_Modules.Weapons) then
    local FoundWeapon = nil
    local PedID, Name, WeapFound = PedID(), Low(Data.Item), false
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { 'User', 'All', { Sync.SteamID, Sync.CharID } }
    local Weap = TSC('DokusCore:Core:DBGet:Weapons', Index)
    local Event = Decoded(Data.Event)
    local Index = { Sync.SteamID, Sync.CharID, Name }
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index }).Result[1]

    -- Check if weapon is already equiped.
    if (Weap.Exist) then
      for k,v in pairs(Weap.Result) do
        if (Low(v.Type) == Low(Event.wType)) then
          if (v.Equiped == 1) then
            WeapFound = true
            FoundWeapon = v.Hash
          end
        end
      end
    end

    if (WeapFound) then
      TriggerEvent('DokusCore:GunStore:Weapon:Unequipt', FoundWeapon) Wait(1000)
      TriggerEvent('DokusCore:GunStore:Weapon:Equipt', Data)
    end

    if (not (WeapFound)) then
      -- Delete the inventory item when not more then 1 exists
      if (Inv.Amount == 1) then
        local Index = { Sync.SteamID, Sync.CharID, Name }
        TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'Item', Index })
      end

      -- If user has more of the same weapon, just reduce it by 1.
      if (Inv.Amount > 1) then
        local Index = { Sync.SteamID, Sync.CharID, Name, 1, Inv.Amount, Inv.Meta }
        TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })
      end

      -- Set the weapon active in the weapon wheel
      local Index = { Sync.SteamID, Sync.CharID, Name, true }
      TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Equipt', Index })
      local Index = { 'User', 'Single', 'Hash', { Sync.SteamID, Sync.CharID, Name } }
      local Weap = TSC('DokusCore:Core:DBGet:Weapons', Index).Result[1]
      -- GiveDelayedWeaponToPed(PedID, GetHash(Name), 0, true, 0)
      GiveWeaponToPed_2(PedID, GetHash(Name), 0,true,true,0,false,0.5,1.0,false,0)
      SetPedAmmo(PedID, GetHashKey(Up(Name)), TN(Weap.Ammo_Regular))
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:Weapon:Unequipt', function(Weapon)
  if (_Modules.Weapons) then
    local PedID = PedID()
    local HasWeapon = nil
    if (not (Weapon)) then
      HasWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, PedID)
    else
      HasWeapon = GetHash(Weapon)
    end

    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { 'User', 'Single', 'Hex', { Sync.SteamID, Sync.CharID, HasWeapon } }
    local Weap = TSC('DokusCore:Core:DBGet:Weapons', Index)

    if (Weap.Exist) then
      local Name = Low(Weap.Result[1].Hash)
      local Type = Weap.Result[1].Type
      local Index = { Sync.SteamID, Sync.CharID, Low(Name) }
      local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
      local Ammo = GetAmmoInPedWeapon(PedID, GetHash(Name))
      local Index = { Sync.SteamID, Sync.CharID, Low(Weap.Result[1].Hash), TN(Ammo) }
      TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Ammo', 'Regular', Index })
      RemoveWeaponFromPed(PedID, GetHashKey(Weap.Result[1].Hash), true, -142743235)
      Citizen.InvokeNative(0x1B83C0DEEBCBB214, PedID)

      if (Inv.Exist) then
        local Index = { Sync.SteamID, Sync.CharID, Name, false }
        TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Equipt', Index })
        local Index = { Sync.SteamID, Sync.CharID, Name, 1, Inv.Result[1].Amount, Inv.Result[1].Meta }
        TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
      else
        local Index = { Sync.SteamID, Sync.CharID, Name, false }
        TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Equipt', Index })
        local Index = { Sync.SteamID, Sync.CharID, 'Weapon', Name, 1, Encoded({Type = Type}) }
        TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', Index })
      end

      -- Loop over all active weapns and reapply ammo
      local Index = { 'User', 'All', { Sync.SteamID, Sync.CharID } }
      local Weap = TSC('DokusCore:Core:DBGet:Weapons', Index)
      if (Weap.Exist) then
        for k,v in pairs(Weap.Result) do
          if (Low(v.Type) == (Low(Type))) then
            SetPedAmmo(PedID, GetHash(Up(v.Hash)), TN(Ammo))
            local Index = { Sync.SteamID, Sync.CharID, Low(v.Type), TN(Ammo) }
            TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Ammo', 'Regular', Index })
          else
            SetPedAmmo(PedID, GetHash(Up(v.Hash)), TN(v.Ammo_Regular))
          end
        end
      end
    end
  end
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
