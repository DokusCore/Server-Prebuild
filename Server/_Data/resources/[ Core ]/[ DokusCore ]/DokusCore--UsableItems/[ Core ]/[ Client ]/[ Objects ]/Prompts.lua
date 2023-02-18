--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ActObjectPrompts(Type)
  CreateThread(function()
    for k,v in pairs(_UsableItems.Interactables) do
      if (Low(k) == 'campfire') then
        if (Type == 'Main') then
          local str = v.Options['Destroy'].Name
          Campfire_Destroy = PromptRegisterBegin()
          PromptSetControlAction(Campfire_Destroy, _Keys[v.Options['Destroy'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_Destroy, str)
          PromptSetEnabled(Campfire_Destroy, true)
          PromptSetVisible(Campfire_Destroy, true)
          PromptSetHoldMode(Campfire_Destroy, true)
          PromptSetGroup(Campfire_Destroy, Group)
          PromptRegisterEnd(Campfire_Destroy)

          local str = v.Options['AddFuel'].Name
          Campfire_AddFuel = PromptRegisterBegin()
          PromptSetControlAction(Campfire_AddFuel, _Keys[v.Options['AddFuel'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_AddFuel, str)
          PromptSetEnabled(Campfire_AddFuel, true)
          PromptSetVisible(Campfire_AddFuel, true)
          PromptSetHoldMode(Campfire_AddFuel, true)
          PromptSetGroup(Campfire_AddFuel, Group)
          PromptRegisterEnd(Campfire_AddFuel)

          local str = v.Options['ExitMenu'].Name
          Prompt_Exit = PromptRegisterBegin()
          PromptSetControlAction(Prompt_Exit, _Keys[v.Options['ExitMenu'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Prompt_Exit, str)
          PromptSetEnabled(Prompt_Exit, true)
          PromptSetVisible(Prompt_Exit, true)
          PromptSetHoldMode(Prompt_Exit, true)
          PromptSetGroup(Prompt_Exit, Group)
          PromptRegisterEnd(Prompt_Exit)
        elseif (Type == 'FuelMenu') then
          local str = v.Fuel['Lumber'].Name
          Campfire_Fuel_Lumber = PromptRegisterBegin()
          PromptSetControlAction(Campfire_Fuel_Lumber, _Keys[v.Fuel['Lumber'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_Fuel_Lumber, str)
          PromptSetEnabled(Campfire_Fuel_Lumber, true)
          PromptSetVisible(Campfire_Fuel_Lumber, true)
          PromptSetHoldMode(Campfire_Fuel_Lumber, true)
          PromptSetGroup(Campfire_Fuel_Lumber, Group)
          PromptRegisterEnd(Campfire_Fuel_Lumber)

          local str = v.Fuel['Log'].Name
          Campfire_Fuel_Logs = PromptRegisterBegin()
          PromptSetControlAction(Campfire_Fuel_Logs, _Keys[v.Fuel['Log'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_Fuel_Logs, str)
          PromptSetEnabled(Campfire_Fuel_Logs, true)
          PromptSetVisible(Campfire_Fuel_Logs, true)
          PromptSetHoldMode(Campfire_Fuel_Logs, true)
          PromptSetGroup(Campfire_Fuel_Logs, Group)
          PromptRegisterEnd(Campfire_Fuel_Logs)

          local str = v.Fuel['Bark'].Name
          Campfire_Fuel_Bark = PromptRegisterBegin()
          PromptSetControlAction(Campfire_Fuel_Bark, _Keys[v.Fuel['Bark'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_Fuel_Bark, str)
          PromptSetEnabled(Campfire_Fuel_Bark, true)
          PromptSetVisible(Campfire_Fuel_Bark, true)
          PromptSetHoldMode(Campfire_Fuel_Bark, true)
          PromptSetGroup(Campfire_Fuel_Bark, Group)
          PromptRegisterEnd(Campfire_Fuel_Bark)

          local str = v.Fuel['Back'].Name
          Campfire_Fuel_Back = PromptRegisterBegin()
          PromptSetControlAction(Campfire_Fuel_Back, _Keys[v.Fuel['Back'].Key])
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Campfire_Fuel_Back, str)
          PromptSetEnabled(Campfire_Fuel_Back, true)
          PromptSetVisible(Campfire_Fuel_Back, true)
          PromptSetHoldMode(Campfire_Fuel_Back, true)
          PromptSetGroup(Campfire_Fuel_Back, Group)
          PromptRegisterEnd(Campfire_Fuel_Back)
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
