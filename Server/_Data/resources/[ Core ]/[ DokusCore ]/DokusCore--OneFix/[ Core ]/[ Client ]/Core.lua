--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local DeLog = _OneFix.Debug.Vehicles.Log
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- If entity is a vehicle and stopped on the road
-- Check if the horse is still in walking motion.
-- If so delete the cart, horse and driver.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.OneFix) then
    while true do Wait(10)
      local Pool = GetGamePool('CVehicle')
      for i=1, #Pool do Wait(10)
        local Veh = IsEntityAVehicle(Pool[i])
        local Stopped = IsVehicleStopped(Pool[i])
        local Horse = Citizen.InvokeNative(0xA8BA0BAE0173457B, Pool[i], 0)
        local Driver = Citizen.InvokeNative(0x2963B5C1637E8A27, Pool[i])
        local Walking = IsPedWalking(Horse)
        if ((Veh) and (Stopped)) then
          if (Walking) then
            if (Driver ~= PedID()) then
              if (DeLog) then print("Vehicle Deleted", Veh, Horse, Driver, Pool[i]) end
              if (Driver) then DeleteEntity(Driver) end
              DeleteEntity(Pool[i])
            end
          end
        end
      end Wait(10000)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
