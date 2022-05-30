--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Prompt_Guarma        = nil
Prompt_Jail          = nil
Prompt_Guarma_sDenis = nil
Prompt_Jail_sDenis   = nil
Group = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetDenisPrompts()
  CreateThread(function()
    local str = _Dialogs.Guarma
    Prompt_Guarma = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Guarma, _Keys['G'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Guarma, str)
    PromptSetEnabled(Prompt_Guarma, true)
    PromptSetVisible(Prompt_Guarma, true)
    PromptSetHoldMode(Prompt_Guarma, true)
    PromptSetGroup(Prompt_Guarma, Group)
    PromptRegisterEnd(Prompt_Guarma)

    local str = _Dialogs.Jail
    Prompt_Jail = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Jail, _Keys['X'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Jail, str)
    PromptSetEnabled(Prompt_Jail, true)
    PromptSetVisible(Prompt_Jail, true)
    PromptSetHoldMode(Prompt_Jail, true)
    PromptSetGroup(Prompt_Jail, Group)
    PromptRegisterEnd(Prompt_Jail)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetGuarmaPrompts()
  CreateThread(function()
    local str = _Dialogs.SaintDenis
    Prompt_Guarma_sDenis = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Guarma_sDenis, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Guarma_sDenis, str)
    PromptSetEnabled(Prompt_Guarma_sDenis, true)
    PromptSetVisible(Prompt_Guarma_sDenis, true)
    PromptSetHoldMode(Prompt_Guarma_sDenis, true)
    PromptSetGroup(Prompt_Guarma_sDenis, Group)
    PromptRegisterEnd(Prompt_Guarma_sDenis)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetJailPrompts()
  CreateThread(function()
    local str = _Dialogs.SaintDenis
    Prompt_Jail_sDenis = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Jail_sDenis, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Jail_sDenis, str)
    PromptSetEnabled(Prompt_Jail_sDenis, true)
    PromptSetVisible(Prompt_Jail_sDenis, true)
    PromptSetHoldMode(Prompt_Jail_sDenis, true)
    PromptSetGroup(Prompt_Jail_sDenis, Group)
    PromptRegisterEnd(Prompt_Jail_sDenis)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
