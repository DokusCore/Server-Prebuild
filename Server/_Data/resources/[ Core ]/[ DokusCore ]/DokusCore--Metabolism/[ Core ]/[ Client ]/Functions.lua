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
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Metabolism", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
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
function SendHungerWarning()
  local Txt = RandomDialog(MSG("HungerTxt"))
  local R = Txt[math.random(#Txt)]
  Notify(R.MSG, 'TopCenter', Floor(R.Time * 1000))
  TriggerEvent('DokusCore:Core:MP:Metabolism:PlayOnUser', 'StomachGrowl1', 0.3)
  Wait(30000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendThirstWarning()
  local Txt = RandomDialog(MSG("ThirstTxt"))
  local R = Txt[math.random(#Txt)]
  Notify(R.MSG, 'TopCenter', Floor(R.Time * 1000))
  Wait(30000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoFarting()
  local Coords = GetEntityCoords(PedID())
  local R = Meta.FartSounds[math.random(#Meta.FartSounds)]
  TriggerEvent('DokusCore:Core:MP:Metabolism:PlayInRadiusOfCoords', Coords, 10.0, R.Sound, R.Volume)
  Wait(5000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoBurps()
  local Coords = GetEntityCoords(PedID())
  local R = Meta.BurpSounds[math.random(#Meta.BurpSounds)]
  TriggerEvent('DokusCore:Core:MP:Metabolism:PlayInRadiusOfCoords', Coords, 10.0, R.Sound, R.Volume)
  Wait(5000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
