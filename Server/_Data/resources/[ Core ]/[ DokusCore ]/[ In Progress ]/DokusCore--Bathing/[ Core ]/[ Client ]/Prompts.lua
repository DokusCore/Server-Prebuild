--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
Prompt_Bathing        = nil
Group     = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ActivateHotelPrompts()
  CreateThread(function()
    local str = 'Take a Bath'
    Prompt_Bathing = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Bathing, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Bathing, str)
    PromptSetEnabled(Prompt_Bathing, true)
    PromptSetVisible(Prompt_Bathing, true)
    PromptSetHoldMode(Prompt_Bathing, true)
    PromptSetGroup(Prompt_Bathing, Group)
    PromptRegisterEnd(Prompt_Bathing)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
