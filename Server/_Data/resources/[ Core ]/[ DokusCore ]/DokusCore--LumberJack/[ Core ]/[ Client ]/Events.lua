--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:LumberJack:CloseToTree', function(PedID, Data)
  ActPrompts()
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
  local Index = { Sync.SteamID, Sync.CharID, 'weapon_melee_hatchet' }
  local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
  if (not (Inv.Exist)) then ErrorMsg('NoHatchet') ResetPrompts() return end
  SetCurrentPedWeapon(PedID, GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
  ChopChop(PedID, Data)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ChopChop(PedID, Data)
  local MaxChop, Count = Random(1, 5), 0
  local C = GetCoords(PedID)
  local pname = 'p_axe02x'
  local Prop = nil
  local boneIndex = GetEntityBoneIndexByName(PedID, "SKEL_R_Finger12")
  SetFreeze(PedID, true) Wait(2000)
  RequestAnimDict("amb_work@world_human_tree_chop@male_a@idle_b")
  while not HasAnimDictLoaded("amb_work@world_human_tree_chop@male_a@idle_b") do Wait(100) end
  Prop = CreateObject(GetHashKey(pname), C.x, C.y, C.z + 0.2, true, true, true)
  AttachEntityToEntity(Prop, PedID, boneIndex, 0.200, -0.0, 0.5010, 1.024, -160.0, -70.0, true, true, false, true, 1, true)
  TaskPlayAnim(PedID, "amb_work@world_human_tree_chop@male_a@idle_b", "idle_f", 8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
  while (Count ~= MaxChop) do Wait(10000) Count = (Count + 1) GetReward() Wait(3000) end
  DeleteObject(Prop)
  ClearPedTasks(PedID)
  ResetPrompts()
  SetFreeze(PedID, false)
  UserIsChopping = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
