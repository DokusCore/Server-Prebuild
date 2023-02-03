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
      local pName = CreateVarString(10, 'LITERAL_STRING', MSG("NPCName").MSG)
      PromptSetActiveGroupThisFrame(pGroup_Stables, pName)
      local ME = PromptHasHoldModeCompleted(Stables_Menu)
      local ST = PromptHasHoldModeCompleted(Stables_Store)

      if (ME) then
        StoreInUse = true
        TriggerEvent('DokusCore:Stables:OpenMenu')
      end

      if(ST) then
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
    local str = SYS("OpenMenu").MSG
    Stables_Menu = PromptRegisterBegin()
    PromptSetControlAction(Stables_Menu, _Keys.E)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Stables_Menu, str)
    PromptSetEnabled(Stables_Menu, true)
    PromptSetVisible(Stables_Menu, true)
    PromptSetHoldMode(Stables_Menu, true)
    PromptSetGroup(Stables_Menu, pGroup_Stables)
    PromptRegisterEnd(Stables_Menu)

    if (MyActiveHorse ~= nil) then
      for k,v in pairs(_Stables.NPCs) do
        if (Low(Loc) == (Low(v.ID))) then
          local Coords = GetCoords(MyActiveHorse)
          local Dist = Vdist(v.Coords, Coords)
          if (Dist <= 20) then
            local str = MSG("StoreHorse").MSG
            Stables_Store = PromptRegisterBegin()
            PromptSetControlAction(Stables_Store, _Keys.G)
            str = CreateVarString(10, 'LITERAL_STRING', str)
            PromptSetText(Stables_Store, str)
            PromptSetEnabled(Stables_Store, true)
            PromptSetVisible(Stables_Store, true)
            PromptSetHoldMode(Stables_Store, true)
            PromptSetGroup(Stables_Store, pGroup_Stables)
            PromptRegisterEnd(Stables_Store)
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
