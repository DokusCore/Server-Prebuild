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
  return _("UsableItems", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DelInv(PedID, Amount, Data)
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', { Steam, CharID, Data.Item } }).Result[1]
  TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', { Steam, CharID, Data.Item, Amount, Inv.Amount } })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SyncIntObj()
  local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables
  IntObjects = Obj
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TaskPlaceWithProp(PedID, Prop, Ani, AniTime, IsMeta, Meta)
  if (Prop == nil) then Notify('Can not deploy, object hash is missing!') return end
  if (Ani == nil) then Notify('Can not deploy, animation hash is missing!') return end
  if ((tonumber(AniTime) == nil) or (tonumber(AniTime) <= 100)) then Notify('Can not deploy, animation time is missing!') return end
  TaskStartScenarioInPlace(PedID, GetHashKey(Ani), tonumber(AniTime), true, false, false, false)
  Wait(tonumber((AniTime - 5000)))
  local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PedID, 0.0, 2.0, -1.55))
  local P = CreateObject(GetHashKey(Prop), x, y, z, true, false, true)
  SetEntityHeading(P, GetEntityHeading(PedID))
  PlaceObjectOnGroundProperly(P)
  local Coords = vector3(x,y,z)
  TriggerServerEvent('DokusCore:Sync:Add:ObjectData', { 'IntObjects', { P, Coords, true } })
  Wait(100) SyncIntObj()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TaskConsumeItem(PedID, Prop, Pos, Ani, IsMeta, Meta)

  -- Do Single animations without prop
  if ((Pos == nil) and (Prop == nil)) then
    if (Ani ~= nil) then
      TaskItemInteraction(PedID, nil, GetHashKey(Ani), true, 0, 0) Wait(1000)
      if ((IsMeta) and (IsMeta ~= nil)) then ApplyMetabolism(Meta) end
      return
    end
  end

  -- Do animations with prop
  if (Prop == nil) then Notify('Can not deploy, object hash is missing!') return end
  if (Ani == nil) then Notify('Can not deploy, animation hash is missing!') return end
  if (Pos == nil) then Notify('Can not deploy, object position hash is missing!') return end
  local Obj = CreateObject(GetHashKey(Prop), GetCoords(PedID), true, false, false, false, true)
  TaskItemInteraction_2(PedID, nil, Obj, GetHashKey(Pos), GetHashKey(Ani), 1, 0, -1082130432)
  if ((IsMeta) and (IsMeta ~= nil)) then ApplyMetabolism(Meta) end
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
















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
