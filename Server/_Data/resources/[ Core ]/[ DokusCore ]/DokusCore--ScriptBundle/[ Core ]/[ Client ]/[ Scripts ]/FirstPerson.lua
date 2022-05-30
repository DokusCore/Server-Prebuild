--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Force first person camera when user is aiming a gun
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local TheForce = false
CreateThread(function()
  if (_ScriptBundle.ForceFPS) then
    while true do Wait(1)
      local PedID = PedID()
      local Aiming = IsPlayerFreeAiming(PedID)
      if (Aiming) then First()
        if ((FirstCam) and not (TheForce)) then TheForce = false else TheForce = true First() end
      else
        if (TheForce) then Third() TheForce = false end
      end
    end
  end
end)

function First() Citizen.InvokeNative(0x90DA5BA5C2635416) end
function Third() Citizen.InvokeNative(0x1CFB749AD4317BDE) end













--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
