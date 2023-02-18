--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local str = MSG("ButtonBuy").MSG
    Prompt_Buy = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Buy, _Keys['SPACEBAR'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Buy, str)
    PromptSetEnabled(Prompt_Buy, true)
    PromptSetVisible(Prompt_Buy, true)
    PromptSetHoldMode(Prompt_Buy, true)
    PromptSetGroup(Prompt_Buy, Group)
    PromptRegisterEnd(Prompt_Buy)

    local str = MSG("ButtonSell").MSG
    Prompt_Sell = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Sell, _Keys['ENTER'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Sell, str)
    PromptSetEnabled(Prompt_Sell, true)
    PromptSetVisible(Prompt_Sell, true)
    PromptSetHoldMode(Prompt_Sell, true)
    PromptSetGroup(Prompt_Sell, Group)
    PromptRegisterEnd(Prompt_Sell)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
