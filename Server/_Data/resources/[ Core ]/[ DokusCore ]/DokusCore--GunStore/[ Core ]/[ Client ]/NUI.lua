--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CloseMenu', function()
  ShowPrompts   = true
  StoreInUse    = false
  Prompt_Menu   = nil
  Group         = GetRandomIntInRange(0, 0xffffff)
  SetNuiFocus(false, false)
  SendNUIMessage({ type = "OpenBookGui",  value = false })
  TriggerEvent('DokusCore:GunStore:ShowPrompts')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local WeapArray = {
  "WEAPON_MELEE_BROKEN_SWORD",
  "WEAPON_MELEE_HATCHET",
  "WEAPON_THROWN_THROWING_KNIVES",
  "WEAPON_THROWN_TOMAHAWK",
  "WEAPON_THROWN_DYNAMITE",
  "WEAPON_THROWN_MOLOTOV",
}

RegisterNUICallback('BuyWeapon', function(Weapon)
  if (not (UserIsBuying)) then
    UserIsBuying = true

    if (not (TabiContains(WeapArray, Up(Weapon)))) then
      SendNUIMessage({ type = 'Hide' })
      local WeapFound, SameWeapon = false, false
      local PedID, Hash = PedID(), GetHash(Weapon)
      local Sync = TCTCC('DokusCore:Sync:Get:UserData')
      local Name = _GunStore.Weapons[Weapon].Name
      local Type = _GunStore.Weapons[Weapon].Type
      local Price = Round(TN(_GunStore.Weapons[Weapon].Price), 2)

      -- Check if the user has enough money
      local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
      local User = TSC('DokusCore:Core:DBGet:Characters', Index)
      local Money = Round(TN(User.Result[1].Money), 2)
      if (Money < Price) then Error('NotEnoughMoney') return end

      -- Let the user pay
      local Index = { Sync.SteamID, Sync.CharID, Round(TN(Money - Price), 2) }
      TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', Index })

      -- Get current weapons already equiped in the weapon wheel
      local Index = { Sync.SteamID, Sync.CharID }
      local Weap = TSC('DokusCore:Core:DBGet:Weapons', { 'User', 'All', Index })

      if (Weap.Exist) then
        for k,v in pairs(Weap.Result) do
          if (Low(v.Type) == Low(Type)) then
            WeapFound = true
            if (Low(v.Hash) == (Low(Weapon))) then
              SameWeapon = true
            end
          end
        end
      end

      -- When the weapon is not already in the weapons table of the database
      -- we are going to set this weapon as currently active weapon on the wheel
      if (not (WeapFound)) then
        GiveDelayedWeaponToPed(PedID, Hash, 0, true, 0)
        local Index = { Sync.SteamID, Sync.CharID, Name, Type, Low(Weapon), Hash, 0, true }
        TriggerServerEvent('DokusCore:Core:DBIns:Weapons', { 'User', 'Single', Index })
      end

      -- If weapon is found on the weapon wheel table, add the weapon to
      -- the inventory instead of the weapon wheel.
      -- Check if weapon already exists in the inventory, if not ins it otherwise
      -- set the new value for the weapon in the inventory.
      if (WeapFound) then
        local Index = { Sync.SteamID, Sync.CharID, Low(Weapon) }
        local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
        if (Inv.Exist) then
          local Index = { Sync.SteamID, Sync.CharID, Low(Weapon), 1, Inv.Result[1].Amount, Encoded({Type = Type}) }
          TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
        else
          local Index = { Sync.SteamID, Sync.CharID, 'Weapon', Low(Weapon), 1, Encoded({Type = Type}) }
          TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', Index })
        end

        -- Send to wheel database if gun not ready on the database.
        if (not (SameWeapon)) then
          local Index = { Sync.SteamID, Sync.CharID, Name, Type, Low(Weapon), Hash, 0, false }
          TriggerServerEvent('DokusCore:Core:DBIns:Weapons', { 'User', 'Single', Index })
        end
      end

      -- Reset user is buying
      UserIsBuying = false
      SendNUIMessage({ type = 'Show' })
    else
      SendNUIMessage({ type = 'Hide' })
      NoteNPCTalk(MSG("NPCName").MSG, MSG("ErrNotWorking").MSG, true, Floor(MSG("ErrNotWorking").Time * 1000))
      SendNUIMessage({ type = 'Show' })
      UserIsBuying = false
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('BuyAmmo', function(Weapon)
  if (not (UserIsBuying)) then
    UserIsBuying = true
    SendNUIMessage({ type = 'Hide' })
    local PedID = PedID()
    local Hash = GetHash(Weapon)
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Name = TS(_GunStore.Weapons[Weapon].Name)
    local Amount = TN(_GunStore.Ammo[Weapon].Amount)
    local Type = TS(_GunStore.Weapons[Weapon].Type)
    local Price = Round(TN(_GunStore.Ammo[Weapon].Price), 2)
    local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
    local User = TSC('DokusCore:Core:DBGet:Characters', Index)
    local Money = Round(TN(User.Result[1].Money), 2)
    if (Money < Price) then Error('NotEnoughMoney') return end

    -- Let the user pay
    local Index = { Sync.SteamID, Sync.CharID, Round(TN(Money - Price), 2) }
    TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', Index })

    -- Give the ammo
    -- SendMessage('BoughtAmmo', Name, Amount)
    local Ammo = GetAmmoInPedWeapon(PedID, Hash)
    local NewAmmo = (Ammo + Amount)

    -- Set weapon data into the database
    local Index = { Sync.SteamID, Sync.CharID }
    local Weap = TSC('DokusCore:Core:DBGet:Weapons', { 'User', 'All', Index })

    if (Weap.Exist) then
      for k,v in pairs(Weap.Result) do
        if (Low(Type) == Low(v.Type)) then
          local Index = { Sync.SteamID, Sync.CharID, Low(v.Hash), TN(NewAmmo) }
          TriggerServerEvent('DokusCore:Core:DBSet:Weapons', { 'User', 'Single', 'Ammo', 'Regular', Index })
          SetPedAmmo(PedID, Hash, NewAmmo)
        end
      end
    end

    UserIsBuying = false
    SendNUIMessage({ type = 'Show' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
