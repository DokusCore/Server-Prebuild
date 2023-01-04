--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:CloseToTree', function(PedID, Data)
  ResetPrompts() ActPrompts() ShowPrompts, NearNPC = true, false
  while (ShowPrompts) do Wait(1)
    local Coords = GetCoords(PedID)
    local Hash = GetHashKey(Data)
    local Tree = GetObjAtCoords(Coords, 1.0, Hash, true)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'Lumberjack')
    PromptSetActiveGroupThisFrame(pGroup, pName)
    local Chop = PromptHasHoldModeCompleted(ChopKey)

    if (Chop) then
      local GetHarvested = TSC('DokusCore:LumberJack:Get:Harvested')
      if (#GetHarvested <= 0) then
        ShowPrompts = false
        UserIsChopping = true
        TriggerServerEvent('DokusCore:LumberJack:Set:Harvested', Coords)
        TriggerEvent('DokusCore:LumberJack:ChopTree', PedID, Data)
        Wait(2000)
      else
        local Found = CheckTree(GetHarvested)
        if (Found) then ErrorMsg('AlreadyHarvested') ResetPrompts() return end
        ShowPrompts = false
        UserIsChopping = true
        TriggerServerEvent('DokusCore:LumberJack:Set:Harvested', Coords)
        TriggerEvent('DokusCore:LumberJack:ChopTree', PedID, Data)
        Wait(2000)
      end
    end

    if (not (Tree)) then ResetPrompts() end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:ChopTree', function(PedID, Data)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { Sync.SteamID, Sync.CharID, 'axe' }
  local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
  if (not (Inv.Exist)) then ErrorMsg('NoHatchet') ResetPrompts() return end
  SetCurrentPedWeapon(PedID, GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
  ChopChop(PedID, Data)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:Zone:Enter', function()
  local N = _LumberJack.NPC
  NPC = SpawnNPC(N.Hash, N.Coords, N.Heading)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:Zone:Exit', function() DeleteEntity(NPC) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:Zone:NPC:Enter', function()
  if (_LumberJack.Dialogs.Welcome) then
    NoteNPCTalk('LumberJack', "Welcome, how are you doing today?", false, 3000)
    TriggerEvent('DokusCore:LumberJack:CloseToNPC')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:Zone:NPC:Exit', function()
  if (_LumberJack.Dialogs.Goodbye) then
    ResetPrompts() NearNPC = false
    NoteNPCTalk('LumberJack', "Have yourself a wonderful day!", false, 3000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:CloseToNPC', function()
  NearNPC, ShowPrompts = true, true ActPrompts()
  while ((NearNPC) and (ShowPrompts)) do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', _LumberJack.NPC.ID)
    PromptSetActiveGroupThisFrame(pGroup, pName)
    local OM = PromptHasHoldModeCompleted(NPC_OpenMenu)
    local GQ = PromptHasHoldModeCompleted(NPC_GetQuest)
    local EQ = PromptHasHoldModeCompleted(NPC_EndQuest)

    if (OM) then NoteObjective('System', 'Currently in development', 'Horn', 5000) end
    if (GQ) then
      local Quest = HasPlayerQuest()
      if (Quest.Active) then Talk('QuestActive') end
      if (not (Quest.Active)) then
        local Quest = GetPlayerQuest()
        local Random = QuestDialogs[ math.random(#QuestDialogs) ]
        NoteNPCTalk('LumberJack', (Random[1] .. Quest[2] .." " .. Quest[1] .. Random[2]), true, 5000)
        NoteObjective('Quest Recieved:', ('Gather ' .. Quest[2] .. ' ' .. Quest[1]), 'Check', 3000)
        QuestActive = true
        ResetPrompts()
        TriggerEvent('DokusCore:LumberJack:CloseToNPC')
      end
    end

    if ((QuestActive) and (EQ)) then
      local Quest = HasPlayerQuest()
      local Sync = TCTCC('DokusCore:Sync:Get:UserData')
      local Dec  = Decoded(Quest.Data.Meta)
      local Item, Amount = Dec.Item, Dec.Amount
      local Index = { Sync.SteamID, Sync.CharID, Item }
      local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
      if (not (Inv.Exist)) then Talk('QuestNoReqItems') end
      if (Inv.Exist) then
        if (Inv.Result[1].Amount > Amount) then
          local Index = { Sync.SteamID, Sync.CharID, Item, Amount, Inv.Result[1].Amount }
          TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })
          local Index = { 'Quest', 'LumberJack', 'Employer', { Sync.SteamID, Sync.CharID }}
          TriggerServerEvent('DokusCore:Core:DBDel:Events', Index)
          PayPlayer(Sync.SteamID, Sync.CharID, Item, Amount)
          QuestActive = false ResetPrompts() Wait(2000)
          TriggerEvent('DokusCore:LumberJack:CloseToNPC')
        elseif (Inv.Result[1].Amount == Amount) then
          local Index = { Sync.SteamID, Sync.CharID, Item, Amount, Inv.Result[1].Amount }
          TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })
          local Index = { 'Quest', 'LumberJack', 'Employer', { Sync.SteamID, Sync.CharID }}
          TriggerServerEvent('DokusCore:Core:DBDel:Events', Index)
          PayPlayer(Sync.SteamID, Sync.CharID, Item, Amount)
          QuestActive = false ResetPrompts() Wait(2000)
          TriggerEvent('DokusCore:LumberJack:CloseToNPC')
        elseif (Inv.Result[1].Amount < Amount) then
          Talk('QuestNoReqItems')
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  DeleteEntity(NPC) RemoveBlip(Blip)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
