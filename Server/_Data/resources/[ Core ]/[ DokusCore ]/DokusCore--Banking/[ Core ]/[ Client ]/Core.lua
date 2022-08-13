--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local Loc, InArea, InRange = nil, false, false
local Steam, CharID = nil, nil
local PluginReady = false
local ShowPrompt = true
PromptBank, AliveNPCs, Blips = nil, {}, {}
OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
local Low = string.lower
Dialog = _Dialogs.Banking
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
    for k,v in pairs(_Banking.Zones) do Tabi(Blips, SetBlip(v.Coords, -2128054417, Radius, 'Bank')) end
    for k,v in pairs(_Banking.NPCs)  do Tabi(AliveNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading))      end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then return end
  for k,v in pairs(AliveNPCs) do DeleteEntity(v) end
  for k,v in pairs(Blips) do RemoveBlip(v) end
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
          InRange, ShowPrompt = true, true
          TriggerEvent('DokusCore:Banking:StartBank')
        end

        -- when the player leave the range of the NPC
        if ((Dist > v.ActRadius) and InRange) then
          InRange, CheckByNPC, ShowPrompt = false, false, false
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
    while ShowPrompt do Wait(0)
      local BankGroupName  = CreateVarString(10, 'LITERAL_STRING', Dialog.BankName)
      PromptSetActiveGroupThisFrame(OpenBankGroup, BankGroupName)
      local Prompt = PromptHasHoldModeCompleted(PromptBank)

      if ((Prompt) and not (BankInUse)) then
        TriggerEvent('DokusCore:NPCInteract:OpenMenu', { Menu = 'BankMenu', MenuTitle = (Loc .. ' Bank'), Location = Loc })
        Wait(2000)
      elseif (Prompt) and (BankInUse) then
        NoteNPCTalk(Dialog.NPCName, Dialog.NPCBusy, true, 5000)
        Wait(2000)
      end
    end
  end

  if not (ShowPrompt) then
    PromptBank = nil
    OpenBankGroup = GetRandomIntInRange(0, 0xffffff)
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
  BankInUse, ShowPrompt = true, false
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
  if not (Bank.Exist) then NoteNPCTalk(Dialog.NPCName, Dialog.NoAccount, 5000) BankInUse, ShowPrompt = false, true return end
  local Data = Bank.Result[1]
  local Money, Gold = Data.Money, Data.Gold
  local array = { action = "showAccount", bank = string.upper(Loc), money = Money, gold = Gold }
  local encoded = json.encode(array)
  TSC('DokusCore:Banking:NPCStatus', { 'Set', 'Busy' })
  SetNuiFocus(true, true)
  SendNuiMessage(encoded)
  local Random = Dialog.EnterBank[math.random(#Dialog.EnterBank)]
  NoteNPCTalk(Dialog.NPCName, Random, 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NUIFocusOff', function()
  SetNuiFocus(false, false)
  local Random = Dialog.ExitBank[math.random(#Dialog.ExitBank)]
  NoteNPCTalk(Dialog.NPCName, Random, 5000)
  ShowPrompt, BankInUse = true, false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Banking:CreateBankAccount')
AddEventHandler('DokusCore:Banking:CreateBankAccount', function()
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
  if not (Char.Exist) then NoteObjective(_Dialogs.Error, _Dialogs.NoCharFound, 'Alert', 5000) return end
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
  if (Bank.Exist) then return NoteNPCTalk(Dialog.NPCName, Dialog.AlAccount, 5000) end
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
  ShowPrompt = false
  local Sync = TableBanksForSyningNewAccount(Loc)
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Payment', { Steam, CharID, Money } })
  NoteNPCTalk(Dialog.NPCName, Dialog.AcCreation, 5000) Wait(5500)
  TriggerServerEvent('DokusCore:Core:DBIns:Banks', { 'User', { Steam, CharID, 'Bank', Loc, 0, 0, Sync } })
  NoteNPCTalk(Dialog.NPCName, Dialog.AcCreated, 5000)
  Wait(1000) ShowPrompt = true
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Deposit', function(Data)
  if not (TransIsMade) then
    TransIsMade = true
    local DepMoney, DepGold = tonumber(Data.money), tonumber(Data.gold)
    local IsMoney, IsGold = (DepMoney > 0), (DepGold > 0)
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
    if (IsMoney) then
      if (User.Result[1].Money < DepMoney) then NoteNPCTalk(Dialog.NPCName, Dialog.NoDepMoney, 5000) TransIsMade = false return end
      if (DepMoney <= 0.01) then NoteNPCTalk(Dialog.NPCName, Dialog.DepMinMoney, 5000) end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Deposit', 'Money', { Steam, CharID, Loc, DepMoney } })
    end

    if (IsGold) then
      if (User.Result[1].Gold < DepGold) then NoteNPCTalk(Dialog.NPCName, Dialog.NoDepGold, 5000) TransIsMade = false return end
      if (DepGold <= 0.01) then NoteNPCTalk(Dialog.NPCName, Dialog.DepMinGold, 5000) end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Deposit', 'Gold', { Steam, CharID, Loc, DepGold } })
    end

    Wait(2000)
    local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
    local Data = Bank.Result[1]
    local Arr = { action = "updateNumbers", bank = string.upper(Loc), money = Data.Money, gold = Data.Gold }
    SendNuiMessage(Encoded(Arr))
    if (IsMoney) then NoteNPCTalk(Dialog.NPCName, Dialog.DepDoneMoney..DepMoney, 5000) end
    if (IsGold) then NoteNPCTalk(Dialog.NPCName, Dialog.DepDoneGold..DepGold.." Gold.", 5000) end
    TransIsMade = false
  else
    TransIsMade = true
    NoteNPCTalk(Dialog.NPCName, Dialog.ToFast, 5000)
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
    local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })

    if (IsMoney) then
      if (Bank.Result[1].Money < DepMoney) then NoteNPCTalk(Dialog.NPCName, Dialog.NoWitMoney, 5000) TransIsMade = false return end
      if (DepMoney <= 0.01) then NoteNPCTalk(Dialog.NPCName, Dialog.WitMinMoney, 5000) return end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Withdraw', 'Money', { Steam, CharID, Loc, DepMoney } })
    end

    if (IsGold) then
      if (Bank.Result[1].Money < DepGold) then NoteNPCTalk(Dialog.NPCName, Dialog.NoWitGold, 5000) TransIsMade = false return end
      if (DepGold <= 0.01) then NoteNPCTalk(Dialog.NPCName, Dialog.WitMinGold, 5000) return end
      TriggerEvent('DokusCore:Core:Banking:Transaction', { 'Auto', false, 'Withdraw', 'Gold', { Steam, CharID, Loc, DepGold } })
    end

    Wait(2000)
    local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { Steam, CharID, Loc } })
    local Data = Bank.Result[1]
    local Arr = { action = "updateNumbers", bank = string.upper(Loc), money = Data.Money, gold = Data.Gold }
    SendNuiMessage(Encoded(Arr))
    if (IsMoney) then NoteNPCTalk(Dialog.NPCName, Dialog.WitDoneMoney..DepMoney, 5000) end
    if (IsGold) then NoteNPCTalk(Dialog.NPCName, Dialog.WitDoneGold..DepGold.." Gold.", 5000) end
    TransIsMade = false
  else
    TransIsMade = true
    NoteNPCTalk(Dialog.NPCName, Dialog.ToFast, 5000)
    TransIsMade = false
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
