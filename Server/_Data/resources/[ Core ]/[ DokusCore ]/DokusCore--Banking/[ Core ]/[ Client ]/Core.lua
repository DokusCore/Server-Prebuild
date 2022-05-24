--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Loc, InArea, InRange = nil, false, false
local Steam, CharID = nil, nil
local PluginReady = false
PromptBank, AliveNPCs = nil, {}
OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
local Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set Users SteamID
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Banking) then
    while not FrameReady() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    Steam = Data.SteamID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Banking) then
    while not FrameReady() do Wait(1000) end
    for k,v in pairs(_Banking.Zones) do SetBlip(v.Coords, -2128054417, Radius, 'Bank') end
    for k,v in pairs(_Banking.NPCs) do
      Tabi(AliveNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading))
    end
  end
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
-- Resync on DokusCore restart
--------------------------------------------------------------------------------
AddEventHandler('onResourceStart', function(resourceName)
  if (resourceName == 'DokusCore') then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    Steam, CharID = Data.SteamID, Data.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check players distance from the banks
--------------------------------------------------------------------------------
CreateThread(function()
  -- First check if the core is ready to pass data
  if (_Modules.Banking) then
    while not FrameReady() do Wait(1000) end
    while true do Wait(3000)
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
RegisterNetEvent('DokusCore:Banking:StartBank')
AddEventHandler('DokusCore:Banking:StartBank', function()
  local User = TCTCC('DokusCore:Sync:Get:UserData')
  Steam, CharID = User.SteamID, User.CharID
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
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
  if not (Bank.Exist) then return Notify("I'am sorry, but we have no bank account registered in our logs. You fitst need to open a bank account before you can use one!") end
  local Data = Bank.Result[1]
  local Money, Gold = Data.Money, Data.Gold
  local array = { action = "showAccount", bank = string.upper(Loc), money = Money, gold = Gold }
  local encoded = json.encode(array)
  TSC('DokusCore:Banking:NPCStatus', { 'Set', 'Busy' })
  SetNuiFocus(true, true)
  SendNuiMessage(encoded)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NUIFocusOff', function() SetNuiFocus(false, false) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:CreateBankAccount')
AddEventHandler('DokusCore:Banking:CreateBankAccount', function()
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
  if not (Char.Exist) then Notify('ERROR: Unable to perform this action, no character found') return end
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
  if (Bank.Exist) then return Notify("You already have an bank account at this bank!", 'TopCenter', 5000) end
  TriggerServerEvent('DokusCore:Banking:CreateBankAccount', Steam, CharID, Loc, Char.Result[1], Bank.Result[1] )
  Wait(7000)

  -- Get Bank / Money to sync with DataSync
  local Bank2 = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'All', 'Bank', { Steam, CharID } })
  local BankMoney, BankGold = {}, {}
  for k,v in pairs(Bank2.Result) do table.insert(BankMoney, { Loc = v.Bank, Money = v.Money }) end
  for k,v in pairs(Bank2.Result) do table.insert(BankGold,  { Loc = v.Bank, Gold = v.Gold   }) end
  local BM, BG = json.encode(BankMoney), json.encode(BankGold)
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankMoney', { BM } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankGold', { BG } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:PayForAccount')
AddEventHandler('DokusCore:Banking:PayForAccount', function(Money)
  local Sync = TableBanksForSyningNewAccount(Loc)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { Steam, CharID, Money } })
  Notify("You've paid your account fee, account getting created!", 'TopCenter', 5000) Wait(5500)
  TriggerServerEvent('DokusCore:Core:DBIns:Banks', { 'User', { Steam, CharID, 'Bank', Loc, 0, 0, Sync } })
  Notify("Your bank account has been made!", 'TopCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Deposit', function(Data)
  if not (TransIsMade) then
    TransIsMade = true
    local DepMoney, DepGold = tonumber(Data.money), tonumber(Data.gold)
    local IsMoney, IsGold = (DepMoney > 0), (DepGold > 0)
    local UserData = TCTCC('DokusCore:Sync:Get:UserData')

    if (IsMoney) then
      if (UserData.CharMoney < DepMoney) then Notify("You've not enough money to make this withdraw!") TransIsMade = false return end
      if (DepMoney <= 0.01) then Notify("The deposit amount needs to be bigger then $0.01 cent!") end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Deposit', 'Money', { Steam, CharID, Loc, DepMoney } })
    end

    if (IsGold) then
      if (UserData.CharGold < DepGold) then Notify("You've not enough gold to make this withdraw!") TransIsMade = false return end
      if (DepGold <= 0.01) then Notify("The deposit amount needs to be bigger then 0.01 gold!") end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Deposit', 'Gold', { Steam, CharID, Loc, DepGold } })
    end

    Wait(2000)
    local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
    local Data = Bank.Result[1]
    local Arr = { action = "updateNumbers", bank = string.upper(Loc), money = Data.Money, gold = Data.Gold }
    SendNuiMessage(Encoded(Arr))
    if (IsMoney) then Notify("You've done a deposit of $"..DepMoney) end
    if (IsGold) then Notify("You've done a deposit of "..DepGold.." Gold.") end
    TransIsMade = false
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Withdraw', function(Data)
  if not (TransIsMade) then
    TransIsMade = true
    local DepMoney, DepGold = tonumber(Data.money), tonumber(Data.gold)
    local IsMoney, IsGold = (DepMoney > 0), (DepGold > 0)
    local UserData = TCTCC('DokusCore:Sync:Get:UserData')

    if (IsMoney) then
      local Dec = Decoded(UserData.BankMoney)
      for k,v in pairs(Dec) do
        if (v.Loc == Loc) then
          if (v.Money < DepMoney) then Notify("You've not enough money to make this withdraw!") TransIsMade = false return end
          if (DepMoney <= 0.01) then Notify("The withdraw amount needs to be bigger then $0.01 cent!") end
          TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Withdraw', 'Money', { Steam, CharID, Loc, DepMoney } })
        end
      end
    end

    if (IsGold) then
      local Dec = Decoded(UserData.BankGold)
      for k,v in pairs(Dec) do
        if (v.Loc == Loc) then
          if (v.Gold < DepGold) then Notify("You've not enough gold to make this withdraw!") TransIsMade = false return end
          if (DepGold <= 0.01) then Notify("The withdraw amount needs to be bigger then 0.01 gold!") end
          TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Withdraw', 'Gold', { Steam, CharID, Loc, DepGold } })
        end
      end
    end

    Wait(2000)
    local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
    local Data = Bank.Result[1]
    local Arr = { action = "updateNumbers", bank = string.upper(Loc), money = Data.Money, gold = Data.Gold }
    SendNuiMessage(Encoded(Arr))
    if (IsMoney) then Notify("You've done a withdraw of $"..DepMoney) end
    if (IsGold) then Notify("You've done a withdraw of "..DepGold.." Gold.") end
    TransIsMade = false
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
