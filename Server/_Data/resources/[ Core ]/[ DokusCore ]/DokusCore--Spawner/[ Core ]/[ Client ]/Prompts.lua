--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local str = 'Stop | Start Music'
    Prompt_Stop = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Stop, _Keys['SPACEBAR'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Stop, str)
    PromptSetEnabled(Prompt_Stop, true)
    PromptSetVisible(Prompt_Stop, true)
    PromptSetHoldMode(Prompt_Stop, true)
    PromptSetGroup(Prompt_Stop, Group)
    PromptRegisterEnd(Prompt_Stop)

    local str = 'Step Out'
    Prompt_Out = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Out, _Keys['E'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Out, str)
    PromptSetEnabled(Prompt_Out, true)
    PromptSetVisible(Prompt_Out, true)
    PromptSetHoldMode(Prompt_Out, true)
    PromptSetGroup(Prompt_Out, Group)
    PromptRegisterEnd(Prompt_Out)

    local str = 'Cinema'
    Prompt_Cinema = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Cinema, _Keys['V'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Cinema, str)
    PromptSetEnabled(Prompt_Cinema, true)
    PromptSetVisible(Prompt_Cinema, true)
    PromptSetHoldMode(Prompt_Cinema, true)
    PromptSetGroup(Prompt_Cinema, Group)
    PromptRegisterEnd(Prompt_Cinema)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
