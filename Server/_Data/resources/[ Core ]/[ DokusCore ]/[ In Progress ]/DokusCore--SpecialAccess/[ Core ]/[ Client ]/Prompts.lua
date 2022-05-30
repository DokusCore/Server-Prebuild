--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Enter, Exit = nil, nil
Group       = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetJailPrompts()
  CreateThread(function()
    -- Set Prompt to Jail
    local str = 'Enter'
    Enter = PromptRegisterBegin()
    PromptSetControlAction(Enter, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Enter, str)
    PromptSetEnabled(Enter, true)
    PromptSetVisible(Enter, true)
    PromptSetHoldMode(Enter, true)
    PromptSetGroup(Enter, Group)
    PromptRegisterEnd(Enter)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
