--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CalcTempDamage()
  local Min = Meta.Temp.Limit.Min
  local Max = Meta.Temp.Limit.Max
  if (Temp >= Max) then
    DamHunger = Meta.Temp.Damage.Hot.Hunger
    DamThirst = Meta.Temp.Damage.Hot.Thirst
  elseif (Temp <= Min) then
    DamHunger = Meta.Temp.Damage.Cold.Hunger
    DamThirst = Meta.Temp.Damage.Cold.Thirst
  else
    DamHunger = 0 DamThirst = 0
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoVitalFlash()
  if (not (VitalFlash)) then
    VitalFlash = true
    TriggerEvent('DokusCore:Metabolism:VitalFlash')
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetHealthDamage()
  if (not (HealthDamage)) then
    HealthDamage = true
    TriggerEvent('DokusCore:Metabolism:HealthDamage')
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
