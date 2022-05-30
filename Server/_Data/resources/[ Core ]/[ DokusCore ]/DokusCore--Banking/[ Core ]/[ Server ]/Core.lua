--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local IsNPCBusy = false
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
RegisterServerEvent('DokusCore:Banking:CreateBankAccount')
AddEventHandler('DokusCore:Banking:CreateBankAccount', function(Steam, CharID, Loc, Char, Bank)
  local Fee = _Banking.Fees.AccountCreation
  if (Char.Money < Fee) then return Notify("You've not enough money to create a bank account!") end
  local NewMoney = tonumber(Char.Money - Fee)
  TriggerClientEvent('DokusCore:Banking:PayForAccount', source, NewMoney)
  -- TriggerClientEvent(source, 'DokusCore:Core:Hud:Update', { 'User' })
end)
--------------------------------------------------------------------------------``
--------------------------------------------------------------------------------
