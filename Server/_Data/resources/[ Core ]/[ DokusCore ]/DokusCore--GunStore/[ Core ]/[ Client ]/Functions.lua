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
      SetHeading(Log, v.Heading) SetFreeze(Log, true)
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
  if (Type == 'NotEnoughMoney') then NoteNPCTalk(Dialog.NPCName, "You've not enough money!", true, 3000) end
  SendNUIMessage({ type = "Show" })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendMessage(Type, Name, Amount)
  SendNUIMessage({ type = "Hide" })
  if (Type == 'BoughtAmmo') then NoteNPCTalk(Dialog.NPCName, "You've bought " .. Amount .." " .. Name .. " Ammo!", true, 3000) end
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
