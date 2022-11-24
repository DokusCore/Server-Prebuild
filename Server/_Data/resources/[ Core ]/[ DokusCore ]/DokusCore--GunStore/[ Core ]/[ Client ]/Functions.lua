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
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("GunStore", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNPCToUse()
  for k,v in pairs(NPCs) do
    if (Low(v.City) == (Low(Loc))) then
      UseThisNPC = v.NPC
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnCatalog()
  local Log = _GunStore.CatalogHash
  for k,v in pairs(_GunStore.Catalogs) do
    if (Low(v.ID) == (Low(Loc))) then
      RequestModel(Log)
      while not HasModelLoaded(Log) do Wait(100) end
      -- SetHeading(Log, v.Heading) SetFreeze(Log, true)
      Tabi(Props, { City = v.ID, Prop = CreateObjectNoOffset(Log, v.Coords, false, false, false, false) })
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DeleteCatalog()
  for k,v in pairs(Props) do
    if (Low(v.City) == (Low(Loc))) then
      DeleteEntity(v.Prop)
      table.remove(Props, k)
      break
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Error(Type)
  SendNUIMessage({ type = "Hide" })
  if (Type == 'NotEnoughMoney') then NoteNPCTalk(MSG("NPCName").MSG, MSG("NoMoney").MSG, true, Floor(MSG("NoMoney").Time * 1000)) end
  SendNUIMessage({ type = "Show" })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendMessage(Type, Name, Amount)
  SendNUIMessage({ type = "Hide" })
  if (Type == 'BoughtAmmo') then NoteNPCTalk(MSG("NPCName").MSG, MSG("BoughtAmmo1").MSG .. Amount .." " .. Name .. MSG("BoughtAmmo2").MSG, true, Floor(MSG("BoughtAmmo1").Time * 1000)) end
  SendNUIMessage({ type = "Show" })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
