--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
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
function SetCharData()
  local CharData = {}
  local Data = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'All', { SteamID } })
  if (Data.Exist) then for k,v in pairs(Data.Result) do Tabi(CharData, Data.Result[k]) end end
  return CharData
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SkipCamp(CharData)
  if (CharData[1] == nil) then
    TriggerEvent('DokusCore:Skins:User:New', 1)
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { 1 } })
    return true
  else return false
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetCampCamera()
  CampCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera, 50.00, 0.00, 0.0, 50.00, false, 0)
  PointCamAtCoord(CampCam, 882.818, 1265.922, 235.682)
  SetCameraActive('CampCam', true)
  RenderScriptCams(true, false, 1, true, true)
  CamInUse = CampCam
  CamCampSet = true
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnPlayerPeds(CharData)
  for k,v in pairs(CharData) do
    LoadModel(v.Gender)
    local PED = SpawnNPC(v.Gender, Spawns[k].Start, 0.0)
    NetworkGhosting(PED, true)
    Tabi(NPCs, PED) Wait(300)
    UnloadModel(v.Gender)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function LoadAllPlayerPedSkins(CharData)
  for k,v in pairs(CharData) do
    TriggerEvent('DokusCore:Skins:Load:NPC', NPCs[k], v)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendPedToCamp(PedID)
  SetCoords(PedID, Camera)
  SetVisible(PedID, false)
  SetInvincible(PedID, true)
  SetFreeze(PedID, true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function WalkPlayerPedsToPosition()
  for k,v in pairs(NPCs) do
    SetFreeze(v, false)
    TaskGoToCoordAnyMeans(v, Spawns[k].Stop, Spawns[k].Speed, 0, 0, 786603, 0xbf800000)
  end Wait(7000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TaskPlayerPedsToScenario()
  for k,v in pairs(NPCs) do
    local Coords = GetCoords(v)
    Citizen.InvokeNative(0x322BFDEA666E2B0E, v, Spawns[k].Stop, 15.0, -1, 1, 1, 1, 1)
  end Wait(10000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CreatePedCams()
  PedCam1 = { Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA"), Pos = nil, Rot = nil }
  PedCam2 = { Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA"), Pos = nil, Rot = nil }
  PedCam3 = { Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA"), Pos = nil, Rot = nil }
  PedCam1.Pos, PedCam1.Rot = vector3(882.9272, 1268.631, 234.2571), vector3(-1.293306, 3.026091, -87.96433)
  PedCam2.Pos, PedCam2.Rot = vector3(882.8522, 1270.744, 234.3688), vector3(-1.293305, 3.026092, -87.96432)
  PedCam3.Pos, PedCam3.Rot = vector3(886.7281, 1269.423, 234.6214), vector3(-1.456217, -1.262961, 84.55676)
  CamPedsSet = true
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetCameraActive(Type, Bool)
  if ((Type == 'CampCam') and (CampCam ~= nil))  then SetCamActive(CampCam, Bool) end
  if ((Type == 'PedCam1') and (PedCam1 ~= nil))  then SetCamActive(PedCam1.Cam,  Bool) end
  if ((Type == 'PedCam2') and (PedCam2 ~= nil))  then SetCamActive(PedCam2.Cam,  Bool) end
  if ((Type == 'PedCam3') and (PedCam3 ~= nil))  then SetCamActive(PedCam3.Cam,  Bool) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TransitionCamera(Data, NPC)
  local Cam, Pos, Rot = Data.Cam, Data.Pos, Data.Rot
  AttachCamToEntity(Cam, NPC, (884.872 - Pos.x), 0.0, 0.6)
  SetCamRot(Cam, Rot.x, Rot.y, (Rot.z - 180.0))
  SetCamActiveWithInterp(Cam, CamInUse, 2400, true, true)
  CamInUse = Cam
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ActivateCampCam()
  SetCamRot(CamInUse, 100.0, 200.0, 0.0)
  SetCamActiveWithInterp(CampCam, CamInUse, 22500, true, true)
  RenderScriptCams(true, true, 22500, true, true) Wait(3000)
  SendPedToCamp(PedID()) Wait(100)
  CamInUse = CampCam
  return 22500
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetTheCampForNewChar()
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  NPCs = {}
  SetCameraActive('CampCam', true)
  TriggerEvent('DokusCore:Characters:Start')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function PlaySong() if (Song.Enabled) then TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', Song.Song, Song.Volume) end end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Error(Type)
  if (Type == 'NoCharSelected') then NoteObjective("Error", "No character selected!", 'Horn', 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






















































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
