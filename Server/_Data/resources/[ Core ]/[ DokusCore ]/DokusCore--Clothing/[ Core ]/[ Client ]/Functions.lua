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
function SetInArea()
  InArea = true
  TriggerEvent('DokusCore:Clothing:CheckDistStore')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutArea()
  ShowPrompt = false
  SetNuiFocus(false, false)
  ShowPrompt = true
  InArea, Loc = false, nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetInStore()
  ShowPrompt = false
  SetNuiFocus(false, false)
  local Txt = RandomDialog(PedID(), Dialog.EnterStore)
  local Random = Txt[math.random(#Txt)]
  if (not (ChangingClothes)) then NoteNPCTalk(Dialog.NPCName, Random.Msg, true, (Random.Time * 1000)) Wait(500) end
  ShowPrompt = true
  InStore = true
  SetPedClothingData()
  TriggerEvent('DokusCore:Clothing:CheckDistNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutStore()
  InStore = false
  SetClothingData()
  local Txt = RandomDialog(PedID(), Dialog.ExitStore)
  local Random = Txt[math.random(#Txt)]
  if (not (ChangingClothes)) then NoteNPCTalk(Dialog.NPCName, Random.Msg, true, (Random.Time * 1000)) Wait(500) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNearNPC()
  NearNPC = true
  local IsBusy = TSC('DokusCore:Tailor:NPCStatus', { 'Get', { Loc } })
  if (IsBusy) then NPCIsBusy() end
  local Txt = RandomDialog(PedID(), Dialog.NearNPC)
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(Dialog.NPCName, Random.Msg, false, (Random.Time * 1000))
  TriggerEvent('DokusCore:Clothing:Start')
  TriggerEvent('DokusCore:Clothing:ShowPrompt')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function NPCIsBusy()
  Error('NPCBusy')
  while ((NearNPC)) do Wait(1)
    local IsBusy = TSC('DokusCore:Tailor:NPCStatus', { 'Get', { Loc } })
    if (not (IsBusy)) then return end
    Wait(5000)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetFarNPC()
  NearNPC = false
  StoreInUse = false
  Prompt_Menu, Prompt_Outfits = nil, nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenMenu()
  StoreInUse = true
  TriggerEvent('DokusCore:Clothing:Start:ViaNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UpdateClothes(ID, Arr, Cat)
  local Hash = Arr[Cat][TN(ID)]
  for k,v in pairs(Skin) do
    if CNumber[Cat] <= 1 then
      Citizen.InvokeNative(0xD710A5007C2AC539, PedID(), GetHashKey(Cat), 0)
      for k,v in pairs(Skin) do
        if Cat == "pants" or Cat == "boots" then
          if (Low(v.Type) == 'legs') then
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PedID(), TN(v.Hash),false,true,true)
          end
        end

        if Cat == "shirts_full" then
          if (Low(v.Type) == 'torso') then
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PedID(), TN(v.Hash),false,true,true)
          end
        end
      end
    else
      Citizen.InvokeNative(0xD3A7B003ED343FD9 , PedID(),  TN(Hash), false, true, true)
    end
  end
  Citizen.InvokeNative(0x704C908E9C405136, PedID())
  Citizen.InvokeNative(0xAAB86462966168CE, PedID(), 1)
  Citizen.InvokeNative(0xCC8CA3E88256E58F, PedID(), 0, 1, 1, 1, 0)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function reversedipairsiter(t, i)
  i = i - 1
  if i ~= 0 then return i, t[i] end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function reversedipairs(t)
  return reversedipairsiter, t, #t + 1
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetCamera(Zoom, Height)
  local PedID = PedID()
  DestroyCam(ClothCam, true)
  ClothCam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
	local CC = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.2, Zoom, Height)
	local CP = GetCoords(PedID)
	SetCamCoord(ClothCam, CC)
	PointCamAtCoord(ClothCam, CP.x, CP.y, (CP.z + Height))
	SetCamActive(ClothCam, true)
	RenderScriptCams(true, true, 500, true, true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetData()
  SendNUIMessage({ openSkinCreator = false })
  SetNuiFocus(false, false)
  SetCamActive(ClothCam, false)
  RenderScriptCams(false, true, 500, true, true)
  DisplayHud(true)
  DisplayRadar(true)
  DestroyCam(ClothCam, true)
  ClothCam, StoreInUse = nil, false
  SetFreeze(PedID(), false)
  SetInvincible(PedID(), false)
  Warned = false
  TriggerEvent('DokusCore:Skins:Load:User') Wait(500)
  TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  AlreadySaid = {}

  -- Walk the NPC back to the counter
  for k,v in pairs(_Clothing.NPCs) do
    if (Low(Loc) == Low(v.ID)) then
      ThisCoords, ThisHeading = v.Coords, v.Heading
      SetFreeze(ThisNPC, false) Wait(10)
      TaskGoToCoordAnyMeans(ThisNPC, v.Coords, 1.2, 0, 0, 786603, 0xbf800000)
      Wait(10000)
      TSC('DokusCore:Tailor:NPCStatus', { 'Set', { Loc, false } })
      Citizen.InvokeNative(0xAA5A7ECE2AA8FE70, ThisNPC, Round(TN(ThisHeading), 1))
      Wait(1000) SetFreeze(ThisNPC, true)
      ThisNPC, ThisCoords, ThisHeading = nil, nil, nil
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetPedClothingData()
  local Ignore = {}
  local Data = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
  if (Data.Clothing == nil) then return end
  local Dec = Decoded(Data.Clothing)
  if (Low(Data.Gender) == 'mp_male') then
    for i,p in pairs(Dec) do
      for k,v in pairs(MaleCloth) do
        if ((Low(i) == Low(k)) and not ArrayContains(Ignore, i)) then
          Tabi(Ignore, k)
          CNumber[k] = tonumber(p)
        end
      end
    end
  else
    for i,p in pairs(Dec) do
      for k,v in pairs(FemaleCloth) do
        if ((Low(i) == Low(k)) and not ArrayContains(Ignore, i)) then
          Tabi(Ignore, k)
          CNumber[k] = tonumber(p)
        end
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetClothingData()
  CNumber, MaleCloth, FemaleCloth = {}, {}, {}
  for k,v in reversedipairs(FemaleData) do
    CNumber[v.Type] = 1
    if (FemaleCloth[v.Type] == nil) then FemaleCloth[v.Type] = {} end
    Tabi(FemaleCloth[v.Type], v.Hash)
  end

  for k,v in reversedipairs(MaleData) do
    CNumber[v.Type] = 1
    if (MaleCloth[v.Type] == nil) then MaleCloth[v.Type] = {} end
    Tabi(MaleCloth[v.Type], v.Hash)
  end Wait(100)
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
function Error(Type)
  if (Type == 'InDev') then NoteObjective("ERROR", 'This Option is in developement!', 'Horn', 5000) end
  if (Type == 'NPCBusy') then NoteObjective("ERROR", "I'm currently busy with another customer, hold on for one moment. I'll be with you as soon as possible!", 'NPC', 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
