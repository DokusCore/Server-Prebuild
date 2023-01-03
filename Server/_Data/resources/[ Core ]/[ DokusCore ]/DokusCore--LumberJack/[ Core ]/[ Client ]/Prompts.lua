--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    if (not (NearNPC)) then
      local str = 'Chop Tree'
      ChopKey = PromptRegisterBegin()
      PromptSetControlAction(ChopKey, _Keys.E)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(ChopKey, str)
      PromptSetEnabled(ChopKey, true)
      PromptSetVisible(ChopKey, true)
      PromptSetHoldMode(ChopKey, true)
      PromptSetGroup(ChopKey, pGroup)
      PromptRegisterEnd(ChopKey)
    end

    if (NearNPC) then
      local str = 'Open Menu'
      NPC_OpenMenu = PromptRegisterBegin()
      PromptSetControlAction(NPC_OpenMenu, _Keys.E)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(NPC_OpenMenu, str)
      PromptSetEnabled(NPC_OpenMenu, true)
      PromptSetVisible(NPC_OpenMenu, true)
      PromptSetHoldMode(NPC_OpenMenu, true)
      PromptSetGroup(NPC_OpenMenu, pGroup)
      PromptRegisterEnd(NPC_OpenMenu)

      local Quest = HasPlayerQuest()
      if (not (Quest.Active)) then
        local str = 'Get Quest'
        NPC_GetQuest = PromptRegisterBegin()
        PromptSetControlAction(NPC_GetQuest, _Keys.G)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(NPC_GetQuest, str)
        PromptSetEnabled(NPC_GetQuest, true)
        PromptSetVisible(NPC_GetQuest, true)
        PromptSetHoldMode(NPC_GetQuest, true)
        PromptSetGroup(NPC_GetQuest, pGroup)
        PromptRegisterEnd(NPC_GetQuest)
      end

      if (Quest.Active) then
        local str = 'End Quest'
        NPC_EndQuest = PromptRegisterBegin()
        PromptSetControlAction(NPC_EndQuest, _Keys.X)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(NPC_EndQuest, str)
        PromptSetEnabled(NPC_EndQuest, true)
        PromptSetVisible(NPC_EndQuest, true)
        PromptSetHoldMode(NPC_EndQuest, true)
        PromptSetGroup(NPC_EndQuest, pGroup)
        PromptRegisterEnd(NPC_EndQuest)
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
