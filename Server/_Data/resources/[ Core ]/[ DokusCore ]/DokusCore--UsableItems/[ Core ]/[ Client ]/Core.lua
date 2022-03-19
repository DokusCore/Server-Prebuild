--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------

CreateThread(function()
  local PedID = PlayerPedId()
  local prop = CreateObject(GetHashKey('p_bottleJD01x'), GetEntityCoords(ped), false, false, 1, 1, 0)
  TaskItemInteraction_2(PedID, 1737033967, prop, GetHashKey("p_bottleJD01x_ph_r_hand"), GetHashKey("DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK"), true, 0, 0)
end)

-- function AniFinished(PedID)
--   while true do Wait(1)
--     local Ani = Citizen.InvokeNative(0xEC7E480FF8BD0BED, PedID)
--     if (Ani == false) then return true end
--   end
-- end






--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
