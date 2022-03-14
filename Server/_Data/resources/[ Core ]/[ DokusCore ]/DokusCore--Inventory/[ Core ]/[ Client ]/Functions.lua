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
function GetUsersItems(Inv)
  local Items = {}
  for k, v in pairs(Inv.Result) do
    I, A = v.Item, v.Amount
    table.insert(Items, {I, A})
    end Wait(100)
  return Items
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenInv(Steam, CharID)
  IsInvOpen = true
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = "open",
    array = source,
    Steam = Steam,
    CharID = CharID
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CloseInv()
  IsInvOpen = false
  SetNuiFocus(false, false)
  SendNUIMessage({ action = "close" })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ClosestBox(Coords)
  local ClosestBox = nil
  local Storage = TSC('DokusCore:Core:DBGet:Storages', { 'DropBox', 'All' })
  if not (Storage.Exist) then return { Closest = ClosestBox } end
  for k,v in pairs(Storage.Result) do
    local DCoords = Decoded(Storage.Result[k].Coords)
    local nVector = vector3(DCoords.x, DCoords.y, DCoords.z)
    local Dist = Vdist(nVector, Coords)
    if (ClosestBox == nil) then ClosestBox = Dist end
    if (Dist < ClosestBox) then ClosestBox = Dist end
  end return { Closest = ClosestBox, Data = Storage.Result }
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreateNewBox(pCoords)
  local Hash = 'P_COTTONBOX01X'
  if (IsModelValid(Hash)) then LoadModel(Hash) end
  local Box = CreateObject(Hash, pCoords, true, false, false)
  table.insert(BoxArray, { BoxID = Box })
  table.insert(BoxTXTs, { BoxID = Box, Coords = pCoords })
  PlaceObjectOnGroundProperly(Box)
  FreezeEntityPosition(Box, true)
  SetEntityAsMissionEntity(Box)
  PlaySoundFrontend("show_info", "Study_Sounds", true, 0)
  return Box
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DrawText3D(x, y, z, f, text)
  local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x, y, z)
  local px,py,pz=table.unpack(GetGameplayCamCoord())
  SetTextScale(0.35, 0.35)
  SetTextFontForCurrentCommand(1)
  SetTextColor(255, 255, 255, 215)
  local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
  SetTextCentre(1)
  DisplayText(str,_x,_y)
  local factor = (string.len(text)) / f
  DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
