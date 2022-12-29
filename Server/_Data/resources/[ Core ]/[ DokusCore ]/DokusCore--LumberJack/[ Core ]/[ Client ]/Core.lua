--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
ShowPrompts      = false
ChopKey, StopKey = nil, nil
pGroup           = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check distance between player and tree object
CreateThread(function()
  if (_Modules.LumberJack) then

    SetFreeze(PedID(), false)
    ClearPedTasks(PedID())

    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(2)
      while (not (ShowPrompts) and (not (UserIsChopping))) do Wait(1000)
        local PedID = PedID()
        local IsDead = IsPedDeadOrDying(PedID)
        local IsMount, IsInVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID)
        if ((not IsMount) and (not IsInVeh) and (not IsDead)) then
          local Coords = GetCoords(PedID)
          for k,v in pairs(_LumberJack.Trees) do
            local Hash = GetHash(v)
            local Tree = GetObjAtCoords(Coords, 1.0, Hash, true)

            if (Tree) then
              ShowPrompts = true
              TriggerEvent('DokusCore:LumberJack:CloseToTree', PedID, v)
            end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
