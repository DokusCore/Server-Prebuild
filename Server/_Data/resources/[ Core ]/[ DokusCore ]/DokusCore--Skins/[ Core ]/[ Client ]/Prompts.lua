--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Prompt_Male        = nil
Prompt_Female      = nil
Prompt_Enter       = nil
Group = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetPrompts()
  CreateThread(function()
    local str = MSG("Male").MSG
    Prompt_Male = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Male, _Keys['LEFT'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Male, str)
    PromptSetEnabled(Prompt_Male, true)
    PromptSetVisible(Prompt_Male, true)
    PromptSetHoldMode(Prompt_Male, true)
    PromptSetGroup(Prompt_Male, Group)
    PromptRegisterEnd(Prompt_Male)

    local str = MSG("Female").MSG
    Prompt_Female = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Female, _Keys['RIGHT'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Female, str)
    PromptSetEnabled(Prompt_Female, true)
    PromptSetVisible(Prompt_Female, true)
    PromptSetHoldMode(Prompt_Female, true)
    PromptSetGroup(Prompt_Female, Group)
    PromptRegisterEnd(Prompt_Female)

    local str = MSG("Select").MSG
    Prompt_Enter = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Enter, _Keys['ENTER'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Enter, str)
    PromptSetEnabled(Prompt_Enter, true)
    PromptSetVisible(Prompt_Enter, true)
    PromptSetHoldMode(Prompt_Enter, true)
    PromptSetGroup(Prompt_Enter, Group)
    PromptRegisterEnd(Prompt_Enter)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
