--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
NPC, Blip        = nil, nil
NearNPC          = false
QuestActive      = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ShowPrompts      = false
ChopKey, StopKey = nil, nil
NPC_OpenMenu     = nil
NPC_GetQuest     = nil
NPC_EndQuest     = nil
pGroup           = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
QuestDialogs     = _LumberJack.Quests.Dialogs
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set the blips on the map
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.LumberJack) then
    while (not FrameReady()) do Wait(1000) end
    while (not UserInGame()) do Wait(1000) end
    local B = _LumberJack.Blip
    Blip = SetBlip(B.Coords, 305281166, 1.0, B.ID)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check distance between player and tree object
CreateThread(function()
  if (_Modules.LumberJack) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(100)
      local PedID = PedID()
      local IsDead = IsPedDeadOrDying(PedID)
      local IsMount, IsInVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID)
      if ((not IsMount) and (not IsInVeh) and (not IsDead)) then
        while (not (ShowPrompts) and (not (UserIsChopping))) do Wait(1000)
          local Coords = GetCoords(PedID)
          for k,v in pairs(_LumberJack.Trees) do
            local Hash = GetHash(v)
            local Tree = GetObjAtCoords(Coords, 1.0, Hash, true)

            if (Tree) then
              ShowPrompts = true
              TriggerEvent('DokusCore:LumberJack:CloseToTree', PedID, v)
            end
          end break
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.LumberJack) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    local Quest = HasPlayerQuest()
    if (Quest.Active) then QuestActive = true end
  end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
