--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local str = 'Open Menu'
    Prompt_Settings = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Settings, _Keys.SPACEBAR)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Settings, str)
    PromptSetEnabled(Prompt_Settings, true)
    PromptSetVisible(Prompt_Settings, true)
    PromptSetHoldMode(Prompt_Settings, true)
    PromptSetGroup(Prompt_Settings, Group)
    PromptRegisterEnd(Prompt_Settings)

    local str = 'Inventory'
    Prompt_Invent = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Invent, _Keys.SHIFT)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Invent, str)
    PromptSetEnabled(Prompt_Invent, true)
    PromptSetVisible(Prompt_Invent, true)
    PromptSetHoldMode(Prompt_Invent, true)
    PromptSetGroup(Prompt_Invent, Group)
    PromptRegisterEnd(Prompt_Invent)

    local Status = Low(GetUserGroup(SteamID, CharID))
    local Admin, Owner = Low(_Moderation.Admin), Low(_Moderation.SuperAdmin)
    if ((Status == Admin) or (Status == Owner)) then
      local str = 'Admin Menu'
      Prompt_AdminMenu = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AdminMenu, _Keys.G)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AdminMenu, str)
      PromptSetEnabled(Prompt_AdminMenu, true)
      PromptSetVisible(Prompt_AdminMenu, true)
      PromptSetHoldMode(Prompt_AdminMenu, true)
      PromptSetGroup(Prompt_AdminMenu, Group)
      PromptRegisterEnd(Prompt_AdminMenu)
    end
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
