--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    if (false) then
      local str = 'Pay'
      Prompt_Pay = PromptRegisterBegin()
      PromptSetControlAction(Prompt_Pay, _Keys['E'])
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_Pay, str)
      PromptSetEnabled(Prompt_Pay, true)
      PromptSetVisible(Prompt_Pay, true)
      PromptSetHoldMode(Prompt_Pay, true)
      PromptSetGroup(Prompt_Pay, Group)
      PromptRegisterEnd(Prompt_Pay)
    else
      local str = 'Open Menu'
      Prompt_Menu = PromptRegisterBegin()
      PromptSetControlAction(Prompt_Menu, _Keys['E'])
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_Menu, str)
      PromptSetEnabled(Prompt_MenuPrompt_Menu, true)
      PromptSetVisible(Prompt_Menu, true)
      PromptSetHoldMode(Prompt_Menu, true)
      PromptSetGroup(Prompt_Menu, Group)
      PromptRegisterEnd(Prompt_Menu)

      local str = 'Outfits'
      Prompt_Outfits = PromptRegisterBegin()
      PromptSetControlAction(Prompt_Outfits, _Keys['X'])
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_Outfits, str)
      PromptSetEnabled(Prompt_Outfits, true)
      PromptSetVisible(Prompt_Outfits, true)
      PromptSetHoldMode(Prompt_Outfits, true)
      PromptSetGroup(Prompt_Outfits, Group)
      PromptRegisterEnd(Prompt_Outfits)
    end
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
