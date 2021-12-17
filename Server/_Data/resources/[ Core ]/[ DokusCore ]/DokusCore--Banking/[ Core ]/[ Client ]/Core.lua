--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Varables
local Loc, InArea, InRange = nil, false, false
local Steam, CharID = nil, nil
local PluginReady = false
PromptBank, AliveNPCs = nil, {}
OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
local Low = string.lower

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Banking) then
    for k,v in pairs(_Banking.Zones) do
      local blip = N_0x554d9d53f696d002(1664425300, v.Coords)
      SetBlipSprite(blip, -2128054417, 1)
  		SetBlipScale(blip, 0.2)
      Citizen.InvokeNative(0x9CB1A1623062F402, blip, 'Bank')
    end

    for k,v in pairs(_Banking.NPCs) do
      SpawnStoreNPC(v.Hash, v.Coords, v.Heading)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check players distance from the banks
--------------------------------------------------------------------------------
CreateThread(function()
  -- First check if the core is ready to pass data
  if (_Modules.Banking) then
    local Ready = TSC('DokusCore:Core:System:IsCoreReady')
    while not Ready do Wait(1000) end
    while Ready do Wait(1000)
      for k,v in pairs(_Banking.Zones) do
        local Dist = GetDistance(v.Coords)
        if ((Loc == nil) and (Dist <= 3)) then Loc = v.ID end
        if (Loc == v.ID) then

          -- When in range and leaving the area
          if ((Dist > 3) and (InArea)) then
            Loc, InArea = nil, false
            PromptBank = nil
            OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
          end

          -- When not in range and entering the area
          if ((Dist <= 3) and not (InArea)) then
            InArea = true
            TriggerEvent('DokusCore:Banking:CheckByNPC')
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check players distance from the NPC
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:CheckByNPC')
AddEventHandler('DokusCore:Banking:CheckByNPC', function()
  local CheckByNPC = true
  while CheckByNPC do Wait(100)
    for k,v in pairs(_Banking.NPCs) do
      if ((Loc == nil) or (v.ID == nil)) then break end
      if (Low(Loc) == Low(v.ID)) then
        local Dist = GetDistance(v.Coords)
        -- When the player gets in the range of the NPC
        if ((Dist <= v.ActRadius) and not InRange) then
          InRange = true
          TriggerEvent('DokusCore:Banking:StartBank')
        end

        -- when the player leave the range of the NPC
        if ((Dist > v.ActRadius) and InRange) then
          InRange, CheckByNPC = false, false
        end
      end
    end
  end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Start Banking code when user is in range
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:StartBank')
AddEventHandler('DokusCore:Banking:StartBank', function()
  local Core = TSC('DokusCore:Core:GetCoreUserData')
  Steam, CharID = Core.Steam, Core.CharID
  local Data = TSC('DokusCore:Core:DBGet:Settings', { 'user', { Steam } })
  local BankInUse = TSC('DokusCore:Banking:NPCStatus', { 'Get' })
  OpenBank(Data.Result[1].Language)
  while InRange do Wait(0)
    local BankGroupName  = CreateVarString(10, 'LITERAL_STRING', _('Banking_Title', Data.Result[1].Language))
    PromptSetActiveGroupThisFrame(OpenBankGroup, BankGroupName)
    local Prompt = PromptHasHoldModeCompleted(PromptBank)

    if ((Prompt) and not (BankInUse)) then
      TriggerEvent('DokusCore:NPCInteract:OpenMenu', { Menu = 'BankMenu', MenuTitle = (Loc .. ' Bank'), Location = Loc })
      Wait(2000)
    elseif (Prompt) and (BankInUse) then
      Notify('The banker is currently busy with another citizen, one moment please!', 'TopRight', 5000)
      Wait(2000)
    end
  end

  if not InRange then
    PromptBank = nil
    OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
    TriggerEvent('DokusCore:Banking:CheckByNPC')
    TSC('DokusCore:Banking:NPCStatus', { 'Set', 'Idle' })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:OpenMenu')
AddEventHandler('DokusCore:Banking:OpenMenu', function()
  Wait(500)
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
  TSC('DokusCore:Banking:NPCStatus', { 'Set', 'Busy' })
  if (Bank.Exist) then
    local Data = Bank.Result[1]
    local Money, Gold = Data.Money, Data.Gold
    local array = { action = "showAccount", bank = string.upper(Loc), money = Money, gold = Gold }
    local encoded = json.encode(array)
    SetNuiFocus(true, true)
    SendNuiMessage(encoded)
  else
    Notify("I'am sorry, but we have no bank account registered in our logs. You fitst need to open a bank account before you can use one!")
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:CreateBankAccount')
AddEventHandler('DokusCore:Banking:CreateBankAccount', function()
  TSC('DokusCore:Banking:CreateBankAccount', { Steam, CharID, Loc })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When the user makes his or her's deposit
--------------------------------------------------------------------------------
RegisterNUICallback('Deposit', function(Data)
  if not (TransIsMade) then
    TransIsMade = true
    local DepMoney, DepGold = tonumber(Data.money), tonumber(Data.gold)
    local IsMoney, IsGold = (DepMoney > 0), (DepGold > 0)
    local Fee = _Banking.Fees.Deposit
    local MoneyFee, GoldFee = (DepMoney / 100 * Fee.Money), (DepGold / 100 * Fee.Gold)

    if (IsMoney) then
      if (MoneyFee < 0.01) then Notify("Amount is to low, fee can not be lower then $0.01 cent") TransIsMade = false return end
      local Data = TSC('DokusCore:Core:DBSet:Bank', { 'Deposit', 'Money', { Steam, CharID, Loc, DepMoney, MoneyFee } })
      if not (Data) then TriggerEvent('DokusCore:Core:Notify', 'Not enough money (INCL FEES) in your wallet to make this transaction', 'TopRight', 10000) TransIsMade = false return end
      Notify("You've transacted $"..DepMoney.." to your bank account You've payed the cassier $"..MoneyFee..". in fees. Your total transaction cost was $"..(DepMoney + MoneyFee)..". The fee is currently priced at "..Fee.Money.."%", 'TopRight', 20000)
    end

    if (IsGold) then
      if (GoldFee < 0.01) then Notify("Amount is to low, fee can not be lower then $0.01 cent") TransIsMade = false return end
      local Data = TSC('DokusCore:Core:DBSet:Bank', { 'Deposit', 'Gold', { Steam, CharID, Loc, DepGold, GoldFee } })
      if not (Data) then TriggerEvent('DokusCore:Core:Notify', 'Not enough gold (INCL FEES) in your wallet to make this transaction', 'TopRight', 10000) TransIsMade = false return end
      Notify("You've transacted "..DepGold.." Gold to your bank account You've payed the cassier "..GoldFee..". Gold in fees. Your total transaction cost was "..(DepGold + GoldFee)..". The fee is currently priced at "..Fee.Gold.."%", 'TopRight', 20000)
    end

    -- Update the bank hud
    local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
    local Money, Gold = Char.Money, Char.Gold
    local array = { action = "showAccount", bank = string.upper(Loc), money = Money, gold = Gold }
    local encoded = json.encode(array)
    SetNuiFocus(true, true)
    SendNuiMessage(encoded)
    Wait(500)

    -- Update the hud and unlock next transaction
    TSC('DokusCore:Core:Hud:Update', { 'User' })
    TransIsMade = false
  else
    TriggerEvent('DokusCore:Core:Notify', "You're trying to deposit to fast, give it a moment!", 'TopRight', 10000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When the user makes his or her's withdraw
--------------------------------------------------------------------------------
RegisterNUICallback('Withdraw', function(Data)
  if not (TransIsMade) then
    TransIsMade = true
    local DepMoney, DepGold = tonumber(Data.money), tonumber(Data.gold)
    local IsMoney, IsGold = (DepMoney > 0), (DepGold > 0)

    if (IsMoney) then
      local Data = TSC('DokusCore:Core:DBSet:Bank', { 'Withdraw', 'Money', { Steam, CharID, Loc, DepMoney } })
      if (Data) then TriggerEvent('DokusCore:Core:Notify', "You've transacted $"..DepMoney.." to your bank account", 'TopRight', 10000) end
      if not (Data) then TriggerEvent('DokusCore:Core:Notify', 'Not enough money in your bank account to make this transaction', 'TopRight', 10000) end
    end

    if (IsGold) then
      local Data = TSC('DokusCore:Core:DBSet:Bank', { 'Withdraw', 'Gold', { Steam, CharID, Loc, DepGold } })
      if (Data) then TriggerEvent('DokusCore:Core:Notify', "You've transacted "..DepGold.." gold to your wallet", 'TopRight', 10000) end
      if not (Data) then TriggerEvent('DokusCore:Core:Notify', 'Not enough gold in your bank account to make this transaction', 'TopRight', 10000) end
    end

    -- Update the bank hud
    Wait(1000)
    local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
    local Money, Gold = Char.Money, Char.Gold
    local array = { action = "showAccount", bank = string.upper(Loc), money = Money, gold = Gold }
    local encoded = json.encode(array)
    SetNuiFocus(true, true)
    SendNuiMessage(encoded)
    Wait(500)

    -- Update the hud and unlock next transaction
    TSC('DokusCore:Core:Hud:Update', { 'user' })
    TransIsMade = false
  else
    TriggerEvent('DokusCore:Core:Notify', "You're trying to withdraw to fast, give it a moment!", 'TopRight', 10000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- When the user closes the bank account window
--------------------------------------------------------------------------------
RegisterNUICallback('NUIFocusOff', function()
  SetNuiFocus(false, false)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(AliveNPCs) do DeleteEntity(v) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
