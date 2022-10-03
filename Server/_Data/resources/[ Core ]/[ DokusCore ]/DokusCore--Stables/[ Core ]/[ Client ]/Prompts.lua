--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:ShowPrompts', function()
  ActPrompts()
  while (not (StoreInUse) and (ShowPrompts)) do Wait(1)
    local IsMounted = IsPedOnMount(PedID())
    if (not (IsMounted)) then
      local pName = CreateVarString(10, 'LITERAL_STRING', Dialog.NPCName)
      PromptSetActiveGroupThisFrame(Group, pName)
      local ME = PromptHasHoldModeCompleted(Prompt_Menu)
      local ST = PromptHasHoldModeCompleted(Prompt_Store)

      if ((ME) and (not (StoreInUse))) then
        StoreInUse = true
        TriggerEvent('DokusCore:Stables:OpenMenu')
      end

      if ((ST) and (not (StoreInUse))) then
        StoreInUse = true
        TriggerEvent('DokusCore:Stables:StoreHorse')
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
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

    if (MyActiveHorse ~= nil) then
      for k,v in pairs(_Stables.NPCs) do
        if (Low(Loc) == (Low(v.ID))) then
          local Coords = GetCoords(MyActiveHorse)
          local Dist = Vdist(v.Coords, Coords)
          if (Dist <= 20) then
            local str = 'Store Horse'
            Prompt_Store = PromptRegisterBegin()
            PromptSetControlAction(Prompt_Store, _Keys['G'])
            str = CreateVarString(10, 'LITERAL_STRING', str)
            PromptSetText(Prompt_Store, str)
            PromptSetEnabled(Prompt_Store, true)
            PromptSetVisible(Prompt_Store, true)
            PromptSetHoldMode(Prompt_Store, true)
            PromptSetGroup(Prompt_Store, Group)
            PromptRegisterEnd(Prompt_Store)
          end
        end
      end
    end
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
