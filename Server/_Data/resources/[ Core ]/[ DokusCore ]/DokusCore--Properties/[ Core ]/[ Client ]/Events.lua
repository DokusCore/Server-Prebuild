------------------------------------------------------------------------------
-------------------------------- DokusCore -----------------------------------
------------------------------------------------------------------------------
--------------------- I feel a disturbance in the force ----------------------
------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Properties:Zone:Enter', function(Data)
  HouseID = Decoded(Data.OnEnter)[1].Meta['HouseID']
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local House = TSC('DokusCore:Core:DBGet:Properties', { 'HouseID', { HouseID } })
  local Keys = TSC('DokusCore:Core:DBGet:DoorLocks', { 'All', 'HouseID', { HouseID } })
  SteamID, CharID, IsOwned = Sync.SteamID, Sync.CharID, House.Exist
  Price, Tax, Inter = nil, nil, nil
  for k,v in pairs(Keys.Result) do if (HouseID == v.HouseID) then Tabi(HouseDoors, v) end end
  for k,v in pairs(Areas) do if (v.ID == HouseID) then Price = v.Price end end
  for k,v in pairs(Taxes) do if (v.ID == HouseID) then Tax, Inter = v.Rate, v.Interval end end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Properties:Zone:Exit', function(Data)
  if (IsInspecting) then for k,v in pairs(HouseDoors) do DoorLock(Floor(v.Hash), 0) end end
  IsInspecting = false
  HouseID, HouseDoors = nil, {}
  NearDoor, Loc = false, nil
  ShowPrompts, PausePrompts = false, false
  SteamID, CharID, IsOwned = nil, nil, false
  Price, Tax, Inter = nil, nil, nil
  ResetPrompts()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Properties:Buy:House', function(Data)
  ResetPrompts() ActPrompts('BuyConfirm') ShowPrompts = true
  while (ShowPrompts) do Wait(1)
    if (not (PausePrompts)) then
      local pName = CreateVarString(10, 'LITERAL_STRING', 'Buy Confirmation')
      PromptSetActiveGroupThisFrame(Group, pName)
      local Yes = PromptHasHoldModeCompleted(Prompt_BuyConYes)
      local No  = PromptHasHoldModeCompleted(Prompt_BuyConNo)

      if (No) then
        ShowPrompts = true
        PausePrompts = false
        ResetPrompts()
        TriggerEvent('DokusCore:Properties:ShowPrompts', { Type = 'Door' })
        return
      end
      
      if (Yes) then
        PausePrompts, ShowBuyInfo = true, false
        local Index = { 'User', 'All', { SteamID, CharID } }
        local Prop = TSC('DokusCore:Core:DBGet:Properties', Index)
        local PrE, PrR = Prop.Exist, Prop.Result

        -- Stop user from buying if user already owns the max allowed.
        if (#PrR >= _Properties.MaxCanOwn) then
          SendMSG('MaxCanOwn', 5000)
          ShowPrompts = true
          PausePrompts = false
          ResetPrompts()
          TriggerEvent('DokusCore:Properties:ShowPrompts', { Type = 'Door' })
          return
        end

        -- Get the characters pocket money
        local Index = { 'User', 'Single', { SteamID, CharID } }
        local User  = TSC('DokusCore:Core:DBGet:Characters', Index)
        local Money = User.Result[1].Money
        local HasMoney = (TN(Money - Price) >= 0)

        -- Stop the user if his/her character does not have enough money
        if (not (HasMoney)) then
          SendMSG('NoMoney', 5000)
          ShowPrompts = true
          PausePrompts = false
          ResetPrompts()
          TriggerEvent('DokusCore:Properties:ShowPrompts', { Type = 'Door' })
          return
        end

        -- Pay for the property
        local Index = { 'Money', { SteamID, CharID, (TN(Money - Price)) } }
        TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)

        -- Get the key item out of the users Inventory
        local Index = { 'User', 'Item', { SteamID, CharID, 'key' } }
        local Inv = TSC('DokusCore:Core:DBGet:Inventory', Index)
        local InvE, InvR = Inv.Exist, Inv.Result

        -- First we insert the new property to the database
        local ArrKeys = {}
        for k,v in pairs(HouseDoors) do Tabi(ArrKeys, v.KeyID) end
        local Keys = Encoded(ArrKeys)
        local Index = { 'House', { SteamID, CharID, HouseID, Keys } }
        TriggerServerEvent('DokusCore:Core:DBIns:Properties', Index)

        -- Now check if the character already has a key in the inventory
        -- if so we add all KeyIDs to the array, if now we insert the new key
        if (not (InvE)) then
          local Index = { 'User', 'InsItem', { SteamID, CharID, 'Tool', 'key', 1, Keys } }
          TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
        elseif (InvE) then
          local Dec = Decoded(InvR[1].Meta)
          for k,v in pairs(Dec) do Tabi(ArrKeys, v) end
          local Keys = Encoded(ArrKeys)
          local Index = { 'User', 'Item', { SteamID, CharID, 'key' } }
          TriggerServerEvent('DokusCore:Core:DBDel:Inventory', Index)
          local Index = { 'User', 'InsertItem', { SteamID, CharID, 'Tool', 'key', 1, Keys } }
          TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
        end

        SendMSG('BoughtHome', 3000, Price)
        NearDoor, IsOwned = false, true
        PausePrompts, ShowPrompts = false, false
        ResetPrompts()
      end
    end
  end
end)
------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------
