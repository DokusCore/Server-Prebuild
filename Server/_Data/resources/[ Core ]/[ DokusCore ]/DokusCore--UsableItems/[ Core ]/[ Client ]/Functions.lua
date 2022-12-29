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
function MSG(Obj)
  return _("Spawner", Obj, _Language.Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  return _("System", Obj, _Language.Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SyncIntObj()
  local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables
  IntObjects = Obj
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ApplyMetabolism(Data)
  local MetaSet = false
  local Amount = Data[1].Amount
  local Hunger, Thirst = Data[1].Hunger, Data[1].Thirst
  local Stamina, Health = Data[1].Stamina, Data[1].Health
  local GHI, GHO, GSI, GSO = Data[1].GHI, Data[1].GHO, Data[1].GSI, Data[1].GSO

  if (Hunger ~= nil) then MetaSet = true end
  if (Thirst ~= nil) then MetaSet = true end
  if (Stamina ~= nil) then MetaSet = true end
  if (Health ~= nil) then MetaSet = true end
  if (Hunger ~= nil) then MetaSet = true end
  if (Thirst ~= nil) then MetaSet = true end
  if (Stamina ~= nil) then MetaSet = true end
  if (Health ~= nil) then MetaSet = true end

  print("{as}")

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
function TaskPlaceWithProp(PedID, Prop, Ani, AniTime, IsMeta, Meta)
  if (Prop == nil) then ErrorMsg('ObjMissing') return end
  if (Ani == nil) then Notify('AniMissing') return end
  if ((TN(AniTime) == nil) or (TN(AniTime) <= 100)) then ErrorMsg('AniTime') return end
  local Hash, Time = GetHashKey(Ani), TN(AniTime)
  TaskStartScenarioInPlace(PedID, Hash, Time, true, false, false, false)
  Wait(Time - 5000)

  local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PedID, 0.0, 2.0, -1.55))
  local P = CreateObject(GetHashKey(Prop), x, y, z, true, false, true)
  SetEntityHeading(P, GetEntityHeading(PedID))
  PlaceObjectOnGroundProperly(P)
  TriggerServerEvent('DokusCore:Sync:Add:ObjectData', { 'IntObjects', { P, vector3(x,y,z), true } })
  Wait(100) SyncIntObj()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TaskConsumeItem(PedID, Prop, Pos, Ani, IsMeta, Meta)
  -- Do Single animations without prop
  if ((Pos == nil) and (Prop == nil)) then
    if (Ani ~= nil) then
      TaskItemInteraction(PedID, nil, GetHashKey(Ani), true, 0, 0) Wait(1000)
      return
    end
  end

  -- Do animations with prop
  if (Prop == nil) then ErrorMsg('ObjMissing') return end
  if (Ani == nil) then ErrorMsg('AniMissing') return end
  if (Pos == nil) then ErrorMsg('ObjPos') return end
  local Obj = CreateObject(GetHashKey(Prop), GetCoords(PedID), true, false, false, false, true)
  TaskItemInteraction_2(PedID, nil, Obj, GetHashKey(Pos), GetHashKey(Ani), 1, 0, -1082130432)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

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
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
