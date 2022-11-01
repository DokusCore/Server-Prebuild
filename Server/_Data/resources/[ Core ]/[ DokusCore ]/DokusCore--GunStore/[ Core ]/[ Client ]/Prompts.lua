--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:ShowPrompts', function()
  ActPrompts()
  while (not (StoreInUse) and (ShowPrompts)) do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', Dialog.NPCName)
    PromptSetActiveGroupThisFrame(Group, pName)
    local Catalog = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_Menu)--  UiPromptHasStandardModeCompleted()
    if ((Catalog) and (not (StoreInUse))) then
      StoreInUse = true
      TriggerEvent('DokusCore:GunStore:OpenCatalog')
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local str = 'Open Menu'
    Prompt_Menu = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Menu, _Keys.E)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Menu, str)
    PromptSetEnabled(Prompt_Menu, 1)
    PromptSetVisible(Prompt_Menu, 1)
    PromptSetStandardMode(Prompt_Menu,1)
    PromptSetGroup(Prompt_Menu, Group)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_Menu, true)
    PromptRegisterEnd(Prompt_Menu)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
