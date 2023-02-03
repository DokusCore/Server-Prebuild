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
  return _("Stables", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function HasJob()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local SteamID, CharID = Sync.SteamID, Sync.CharID
  for k,v in pairs(Config.Allowed) do
    if ((v.SteamID == SteamID) and (v.CharID == CharID)) then
      return true
    else return false
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WaitLoadModel(Model)
  local Hash = GetHashKey(Model)
  if IsModelValid(Hash) then
    if not HasModelLoaded(Hash) then
      RequestModel(Hash)
      while not HasModelLoaded(Hash) do Wait(10) end
      return Hash
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnHorse()
  local PedID = PedID()
  local Coords = GetCoords(PedID)
  local RandomHorse = math.random(#Config.Horses)
  local Model = WaitLoadModel(Config.Horses[RandomHorse])
  HorseLoaded = CreatePed(Model, Coords[1], Coords[2], (Coords[3] - 0.5), 180.0, true, 0)
  Citizen.InvokeNative(0x283978A15512B2FE, HorseLoaded, true)
  Citizen.InvokeNative(0x58A850EAEE20FAA3, HorseLoaded)
  Citizen.InvokeNative(0xB8B6430EAD2D2437, HorseLoaded, GetHashKey("PLAYER_HORSE"))
  Citizen.InvokeNative(0x4DB9D03AC4E1FA84, HorseLoaded, -1, -1, 0)
  SetVehicleHasBeenOwnedByPlayer(HorseLoaded, true)
  Citizen.InvokeNative(0xC80A74AC829DDD92, HorseLoaded, GetPedRelationshipGroupHash(HorseLoaded)) -- SetPedRelationshipGroupHash
  Citizen.InvokeNative(0xBF25EB89375A37AD, 1, GetPedRelationshipGroupHash(HorseLoaded), `PLAYER`) -- SetRelationshipBetweenGroups
  Citizen.InvokeNative(0x283978A15512B2FE, HorseLoaded, true)
  SetPedAsGroupMember(HorseLoaded, 0) --Citizen.InvokeNative(0x9F3480FE65DB31B5, myHorse, 0)
  SetModelAsNoLongerNeeded(Model) -- Citizen.InvokeNative(0x4AD96EF928BD4F9A, model)
  Citizen.InvokeNative(0xD3A7B003ED343FD9, HorseLoaded, 0x1EE21489, true, true, true)
  Citizen.InvokeNative(0x23f74c2fda6e7c61, - 1230993421, HorseLoaded)
  return HorseLoaded
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
