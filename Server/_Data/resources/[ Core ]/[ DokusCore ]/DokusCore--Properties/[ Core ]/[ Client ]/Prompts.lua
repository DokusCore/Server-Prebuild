------------------------------------------------------------------------------
--------------------------------- DevDokus -----------------------------------
------------------------------------------------------------------------------
--------------------- I feel a disturbance in the force ----------------------
------------------------------------------------------------------------------
function ActPrompts(Type)
  CreateThread(function()
    if (IsOwned) then
      if (Low(Type) == 'door') then
        local str = 'Toggle Lock'
        Prompt_DoorLock = PromptRegisterBegin()
        PromptSetControlAction(Prompt_DoorLock, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_DoorLock, str)
        PromptSetEnabled(Prompt_DoorLock, true)
        PromptSetVisible(Prompt_DoorLock, true)
        PromptSetHoldMode(Prompt_DoorLock, true)
        PromptSetGroup(Prompt_DoorLock, Group)
        PromptRegisterEnd(Prompt_DoorLock)
      elseif (Low(Type) == 'storage') then
        local str = 'Open Storage'
        Prompt_OpenStorage = PromptRegisterBegin()
        PromptSetControlAction(Prompt_OpenStorage, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_OpenStorage, str)
        PromptSetEnabled(Prompt_OpenStorage, true)
        PromptSetVisible(Prompt_OpenStorage, true)
        PromptSetHoldMode(Prompt_OpenStorage, true)
        PromptSetGroup(Prompt_OpenStorage, Group)
        PromptRegisterEnd(Prompt_OpenStorage)
      end
    end

    if (not (IsOwned)) then
      if (Low(Type) == 'door') then
        local str = 'Buy House'
        Prompt_BuyHouse = PromptRegisterBegin()
        PromptSetControlAction(Prompt_BuyHouse, _Keys.B)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_BuyHouse, str)
        PromptSetEnabled(Prompt_BuyHouse, true)
        PromptSetVisible(Prompt_BuyHouse, true)
        PromptSetHoldMode(Prompt_BuyHouse, true)
        PromptSetGroup(Prompt_BuyHouse, Group)
        PromptRegisterEnd(Prompt_BuyHouse)

        local str = 'Inspect House'
        Prompt_BuyInspect = PromptRegisterBegin()
        PromptSetControlAction(Prompt_BuyInspect, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_BuyInspect, str)
        PromptSetEnabled(Prompt_BuyInspect, true)
        PromptSetVisible(Prompt_BuyInspect, true)
        PromptSetHoldMode(Prompt_BuyInspect, true)
        PromptSetGroup(Prompt_BuyInspect, Group)
        PromptRegisterEnd(Prompt_BuyInspect)
      elseif (Low(Type) == 'buyconfirm') then
        local str = 'Yes'
        Prompt_BuyConYes = PromptRegisterBegin()
        PromptSetControlAction(Prompt_BuyConYes, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_BuyConYes, str)
        PromptSetEnabled(Prompt_BuyConYes, true)
        PromptSetVisible(Prompt_BuyConYes, true)
        PromptSetHoldMode(Prompt_BuyConYes, true)
        PromptSetGroup(Prompt_BuyConYes, Group)
        PromptRegisterEnd(Prompt_BuyConYes)

        local str = 'No'
        Prompt_BuyConNo = PromptRegisterBegin()
        PromptSetControlAction(Prompt_BuyConNo, _Keys.B)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_BuyConNo, str)
        PromptSetEnabled(Prompt_BuyConNo, true)
        PromptSetVisible(Prompt_BuyConNo, true)
        PromptSetHoldMode(Prompt_BuyConNo, true)
        PromptSetGroup(Prompt_BuyConNo, Group)
        PromptRegisterEnd(Prompt_BuyConNo)
      elseif (Low(Type) == 'inspect') then
        local str = 'Cancel'
        Prompt_InspectStop = PromptRegisterBegin()
        PromptSetControlAction(Prompt_InspectStop, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_InspectStop, str)
        PromptSetEnabled(Prompt_InspectStop, true)
        PromptSetVisible(Prompt_InspectStop, true)
        PromptSetHoldMode(Prompt_InspectStop, true)
        PromptSetGroup(Prompt_InspectStop, Group)
        PromptRegisterEnd(Prompt_InspectStop)
      end
    end
  end)
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Properties:ShowPrompts', function(Data)
  ActPrompts(Data.Type) ShowPrompts = true
  while (ShowPrompts) do Wait(1)
    if (not (PausePrompts)) then
      if (IsOwned) then
        local pName = CreateVarString(10, 'LITERAL_STRING', 'Door Interaction')
        PromptSetActiveGroupThisFrame(Group, pName)
        local Lock  = PromptHasHoldModeCompleted(Prompt_DoorLock)
        if (Lock) then
          local Index = { 'User', 'Item', { SteamID, CharID, 'key' } }
          local Key = TSC('DokusCore:Core:DBGet:Inventory', Index)
          if (not (Key.Exist)) then SendMSG('NoKey', 3000) Wait(1000) end
          if (Key.Exist) then
            for k,v in pairs(HouseDoors) do
              local Hash = Floor(v.Hash)
              local Coords = FormatCoords(v.Coords)
              local Dist = GetDistance(Coords)
              if (Dist <= 2.0) then
                local Door = TSC('DokusCore:Core:DBGet:DoorLocks', { 'Single', 'Hash', { Hash } })
                local KeyID, State, KeyDB = v.KeyID, Door.Result[1].State, Door.Result[1].KeyID
                if (KeyID ~= KeyDB) then SendMSG('Nokey') end
                if (KeyID == KeyDB) then DoorLock(Hash, State) end
              end
            end
          end
        end
      elseif (not (IsOwned)) then
        local pName = CreateVarString(10, 'LITERAL_STRING', 'House on Market')
        PromptSetActiveGroupThisFrame(Group, pName)
        local Buy     = PromptHasHoldModeCompleted(Prompt_BuyHouse)
        local Inspect = PromptHasHoldModeCompleted(Prompt_BuyInspect)

        if (Buy) then TriggerEvent('DokusCore:Properties:Buy:House') end

        if (Inspect) then
          PausePrompts = true
          IsInspecting = true
          ShowBuyInfo  = false
          for k,v in pairs(HouseDoors) do DoorLock(Floor(v.Hash), 1) end
          ResetPrompts() ActPrompts('Inspect')
          PausePrompts = true
          SendMSG('IsInspecting', 3000)
          PausePrompts = false
          TriggerEvent('DokuCore:Properties:ShowPrompts:Inspect')
        end
      end
    end
  end
end)
------------------------------------------------------------------------------
------------------------------------------------------------------------------
RegisterNetEvent('DokuCore:Properties:ShowPrompts:Inspect', function()
  while (IsInspecting) do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'Inspecting')
    PromptSetActiveGroupThisFrame(Group, pName)
    local StopInspect = PromptHasHoldModeCompleted(Prompt_InspectStop)
    if (StopInspect) then
      IsInspecting = false
      for k,v in pairs(HouseDoors) do DoorLock(Floor(v.Hash), 0) end
      PausePrompts = false
      ShowPrompts = false
      ShowBuyInfo = true
      ResetPrompts()
      NearDoor = false
    end
  end
end)
------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------





------------------------------------------------------------------------------
------------------------------------------------------------------------------
