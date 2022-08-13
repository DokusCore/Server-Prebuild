--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  local str = 'Open Menu'
  Prompt_Menu = PromptRegisterBegin()
  PromptSetControlAction(Prompt_Menu, _ActionKey)
  str = CreateVarString(10, 'LITERAL_STRING', str)
  PromptSetText(Prompt_Menu, str)
  PromptSetEnabled(Prompt_Menu, true)
  PromptSetVisible(Prompt_Menu, true)
  PromptSetHoldMode(Prompt_Menu, true)
  PromptSetGroup(Prompt_Menu, Group)
  PromptRegisterEnd(Prompt_Menu)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
