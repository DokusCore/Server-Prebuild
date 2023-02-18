--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
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
function MSG(Obj) return _("UsableItems", Obj, _Language.Lang) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj) return _("System", Obj, _Language.Lang) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function AnimWithoutPropAndTime(PedID, Ani)
  TaskItemInteraction(PedID, nil, GetHashKey(Ani), true, 0, 0) Wait(1000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function AniWithPropAndNoTime(PedID, Ani, Prop, Pos)
  if (Ani == nil) then ErrorMsg('AniMissing') return end
  if (Prop == nil) then ErrorMsg('ObjMissing') return end
  if (Pos == nil) then ErrorMsg('ObjPos') return end
  local Obj = CreateObject(GetHashKey(Prop), GetCoords(PedID), true, false, false, false, true)
  TaskItemInteraction_2(PedID, nil, Obj, GetHashKey(Pos), GetHashKey(Ani), 1, 0, -1082130432)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function AniWithPropAndTime(PedID, Ani, Prop, Pos, Time)
  if (Ani == nil) then Notify('AniMissing') return end
  if (Prop == nil) then ErrorMsg('ObjMissing') return end
  if ((TN(Time) == nil) or (TN(Time) <= 100)) then ErrorMsg('AniTime') return end
  local Hash, Time = GetHashKey(Ani), TN(Time)
  TaskStartScenarioInPlace(PedID, Hash, Time, true, false, false, false) Wait(Time - 5000)
  local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PedID, 0.0, 2.0, -1.55))
  local P = CreateObject(GetHashKey(Prop), x, y, z, true, false, true)
  SetEntityHeading(P, GetEntityHeading(PedID))
  PlaceObjectOnGroundProperly(P) Wait(100)
  ObjID, ObjPos, ObjHash = P, GetCoords(P), GetHashKey(Prop)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SyncIntObj()
  local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables
  IntObjects = Obj
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  ObjMenuOpen          = nil
  Campfire_Destroy     = nil
  Campfire_AddFuel     = nil
  ObjPrompt_Exit       = nil
  Campfire_Fuel_Lumber = nil
  Campfire_Fuel_Logs   = nil
  Campfire_Fuel_Bark   = nil
  Campfire_Fuel_Back   = nil
  Group                = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ApplyMetabolism(Data)
  local MetaSet = false
  local Amount = Data[1].Amount
  local Hunger, Thirst = Data[1].Hunger, Data[1].Thirst
  local Stamina, Health = Data[1].Stamina, Data[1].Health
  local GHI, GHO, GSI, GSO = Data[1].GHI, Data[1].GHO, Data[1].GSI, Data[1].GSO

  if (Hunger ~= nil)  then MetaSet = true end
  if (Thirst ~= nil)  then MetaSet = true end
  if (Stamina ~= nil) then MetaSet = true end
  if (Health ~= nil)  then MetaSet = true end
  if (Hunger ~= nil)  then MetaSet = true end
  if (Thirst ~= nil)  then MetaSet = true end
  if (Stamina ~= nil) then MetaSet = true end
  if (Health ~= nil)  then MetaSet = true end

  if not (MetaSet) then Notify('Unable to set Metabolism as the values are missing!') return end
  if (Hunger ~= nil) then TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { (Hunger * Amount) }) end
  if (Thirst ~= nil) then TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { (Thirst * Amount) }) end
  if (Stamina ~= nil) then TriggerEvent('DokusCore:Metabolism:Edit:Stamina', { (Stamina * Amount) }) end
  if (Health ~= nil) then TriggerEvent('DokusCore:Metabolism:Edit:Health', { (Health * Amount) }) end
  if (Hunger ~= nil) then TriggerEvent('DokusCore:Metabolism:Set:InnerGold:Stamina', { (GSI * Amount) }) end
  if (Thirst ~= nil) then TriggerEvent('DokusCore:Metabolism:Set:OuterGold:Stamina', { (GSO * Amount) }) end
  if (Stamina ~= nil) then TriggerEvent('DokusCore:Metabolism:Set:InnerGold:Health', { (GHI * Amount) }) end
  if (Health ~= nil) then TriggerEvent('DokusCore:Metabolism:Set:OuterGold:Health', { (GHO * Amount) }) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DelInv(PedID, Amount, Data)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { Sync.SteamID, Sync.CharID, Data.Item }
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index }).Result[1]
  local Index = { Sync.SteamID, Sync.CharID, Data.Item, Amount, Inv.Amount }
  TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ErrorMsg(Type)
  if (Type == 'NoEventInDB') then Notify('Event is enabled, but this item has no event data within the database!') end
  if (Type == 'ObjMissing') then Notify('Can not deploy, object hash is missing!') end
  if (Type == 'AniMissing') then Notify('Can not deploy, animation hash is missing!') end
  if (Type == 'AniTime') then Notify('Can not deploy, animation time is missing!') end
  if (Type == 'ObjPos') then Notify('Can not deploy, object position hash is missing!') end
  if (Type == 'ObjInUse') then NoteObjective('System', 'This object is currently already in use!', 'Horn', 5000) end
  if (Type == 'NotEnoughFuel') then NoteObjective('System', "You've not enough in your inventory!", 'Horn', 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
