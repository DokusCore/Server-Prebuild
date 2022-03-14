--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokusCore:Core:GetCoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Core:GetCoreData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenBank(Lang)
  CreateThread(function()
    local str = _('Banking_MenuText', Lang)
    PromptBank = PromptRegisterBegin()
    PromptSetControlAction(PromptBank, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(PromptBank, str)
    PromptSetEnabled(PromptBank, true)
    PromptSetVisible(PromptBank, true)
    PromptSetHoldMode(PromptBank, true)
    PromptSetGroup(PromptBank, OpenBankGroup)
    PromptRegisterEnd(PromptBank)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TableBanksForSyningNewAccount(Loc)
  local Locations = {}
  for k,v in pairs(_Banking.Zones) do
    if (Low(Loc) ~= Low(v.ID)) then
      table.insert(Locations, { Bank = v.ID, Synced = false, Money = 0, Gold = 0 })
    end
  end
  local Encoded = json.encode(Locations)
  return Encoded
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
