--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local IsNPCBusy = false
local Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Banking:NPCStatus', function(source, args)
  if (Low(args[1]) == 'get') then return IsNPCBusy end
  if (Low(args[1]) == 'set') then
    if (Low(args[2]) == 'busy') then IsNPCBusy = true end
    if (Low(args[2]) == 'idle') then IsNPCBusy = false end
    return 'The NPC status is set!'
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RSC('DokusCore:Banking:CreateBankAccount', function(source, args)
  local Sync = TableBanksForSyningNewAccount(args[3])
  local Bank = TCC(-1, 'DokusCore:Core:DBGet:Banks', { 'User', 'Single', 'Bank', { args[1], args[2], args[3] } })
  if (Bank.Exist) then return TriggerClientEvent("DokusCore:Core:Notify", source, "You already have an bank account at this bank!", 'TopCenter', 5000) end
  local Core = TCC(-1, 'DokusCore:Core:GetCoreUserData')
  local Char = TCC(-1, 'DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Core.Steam, Core.CharID } }).Result[1]
  local Pay = TCC(-1, 'DokusCore:Core:DBSet:Characters', { 'Payment', { Core.Steam, Core.CharID, 1.0 } })
  if not (Pay) then return TriggerClientEvent("DokusCore:Core:Notify", source, "You do not have enough money to open a bank account", 'TopCenter', 5000) end
  TCC(-1, 'DokusCore:Core:Hud:Update', { 'User' })
  TriggerClientEvent("DokusCore:Core:Notify", source, "You've paid your account fee, account getting created!", 'TopCenter', 5000) Wait(5500)
  TCC(-1, 'DokusCore:Core:DBIns:Banks', { 'User', { args[1], args[2], 'Bank', args[3], 0, 0, Sync } })
  TriggerClientEvent("DokusCore:Core:Notify", source, "Your bank account has been made!", 'TopCenter', 5000)
end)

--------------------------------------------------------------------------------``
--------------------------------------------------------------------------------
