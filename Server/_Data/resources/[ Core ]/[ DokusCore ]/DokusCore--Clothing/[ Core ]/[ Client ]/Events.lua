--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:Start', function()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  CharID = Sync.CharID
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:Start:ViaNPC', function()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  CharID = Sync.CharID

  -- Set the NPC status busy server wide.
  local SetBusy = TSC('DokusCore:Tailor:NPCStatus', { 'Set', { Loc, true } })
  local Txt = RandomDialog(PedID(), Dialog.EnterMenu)
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(Dialog.NPCName, Random.Msg, false, (Random.Time * 1000))

  -- Get NPC
  for k,v in pairs(NPCs) do
    if (Low(v.ID) == (Low(Loc))) then
      ThisNPC = v.Hash
    end
  end

  for k,v in pairs(_Clothing.NPCPosing) do
    if (Low(Loc) == Low(v.ID)) then
      ThisCoords, ThisHeading = v.Coords, v.Heading
      SetFreeze(ThisNPC, false)
      TaskGoToCoordAnyMeans(ThisNPC, v.Coords, 1.2, 0, 0, 786603, 0xbf800000)
    end
  end Wait(2500)


  -- SetFreeze(PedID(), true)
  SetInvincible(PedID(), true)
  -- SetFreeze(PedID(), false)

  for k,v in pairs(_Clothing.Posing) do
    if (Low(Loc) == Low(v.ID)) then
      TaskGoToCoordAnyMeans(PedID(), v.Coords, 0.7, 0, 0, 786603, 0xbf800000)
      UIFadeOut(5000) Wait(5000)
      SetCoords(PedID(), v.Coords)
      SetHeading(PedID(), v.Heading)
      SetFreeze(ThisNPC, true)
      SetCoords(ThisNPC, ThisCoords)
      SetHeading(ThisNPC, ThisHeading)
      UIFadeIn(5000)

      -- Set Camera
      Zoom, Offset = v.Camera[1], v.Camera[2]
      SetCamera(Zoom, Offset)

      local List = MaleCloth
      if (not (IsPedMale(PedID()))) then List = FemaleCloth end
      SendNUIMessage({
        openSkinCreator = true,
        elements = List,
        numbers = CNumber,
        translation = _Clothing.Labels
      })

      -- Open the menu
      SetNuiFocus(true, true)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:Start:NewUser', function()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local IsBusy = TSC('DokusCore:Tailor:NPCStatus', { 'Get', { Loc } })
  CharID = Sync.CharID
  if (IsBusy) then Error('PleaseWait') return end
  SetInvincible(PedID(), true)

  -- Set the NPC status busy server wide.
  local Txt = RandomDialog(PedID(), Dialog.EnterMenu)
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(Dialog.NPCName, Random.Msg, false, (Random.Time * 1000))

  for k,v in pairs(NPCs) do
    if (Low(v.ID) == (Low(Loc))) then
      ThisNPC = v.Hash
    end
  end

  for k,v in pairs(_Clothing.NPCPosing) do
    if (Low(Loc) == Low(v.ID)) then
      ThisCoords, ThisHeading = v.Coords, v.Heading
      SetFreeze(ThisNPC, false)
      TaskGoToCoordAnyMeans(ThisNPC, v.Coords, 1.2, 0, 0, 786603, 0xbf800000)
    end
  end Wait(7000)

  for k,v in pairs(_Clothing.Posing) do
    if (Low(Loc) == Low(v.ID)) then
      TaskGoToCoordAnyMeans(PedID(), v.Coords, 0.7, 0, 0, 786603, 0xbf800000)
      UIFadeOut(5000) Wait(5000)
      SetCoords(PedID(), v.Coords)
      SetHeading(PedID(), v.Heading)
      SetFreeze(ThisNPC, true)
      SetCoords(ThisNPC, ThisCoords)
      SetHeading(ThisNPC, ThisHeading)
      UIFadeIn(5000)

      -- Set Camera
      Zoom, Offset = v.Camera[1], v.Camera[2]
      SetCamera(Zoom, Offset)

      local List = MaleCloth
      if (not (IsPedMale(PedID()))) then List = FemaleCloth end
      SendNUIMessage({
        openSkinCreator = true,
        elements = List,
        numbers = CNumber,
        translation = _Clothing.Labels
      })

      -- Open the menu
      SetNuiFocus(true, true)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:User:Load:Clothing', function()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Sync.SteamID, Sync.CharID } })
  local Data = Decoded(Char.Result[1].Clothing)
  local Gender = Char.Result[1].Gender
  if (Data == nil) then return end

  if (Low(Gender) == 'mp_male') then
    for k,v in pairs(Data) do
      if ((TN(v) ~= 1) and (Low(TS(k)) ~= 'name')) then
        local Hash = MaleCloth[k][TN(v)]
        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PedID(),  TN(Hash), false, true, true)
      end
    end
  elseif (Low(Gender) == 'mp_female') then
    for k,v in pairs(Data) do
      if ((TN(v) ~= 1) and (Low(TS(k)) ~= 'name')) then
        local Hash = FemaleCloth[k][TN(v)]
        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PedID(),  TN(Hash), false, true, true)
      end
    end
  end

  Citizen.InvokeNative(0x704C908E9C405136, PedID())
  Citizen.InvokeNative(0xAAB86462966168CE, PedID(), 1)
  Citizen.InvokeNative(0xCC8CA3E88256E58F, PedID(), 0, 1, 1, 1, 0)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:NPC:Load:Clothing', function(NPC, CharData)
  for k,v in pairs(CharData) do
    local ID, Cloth, Gender = v.CharID, Decoded(v.Clothing), v.Gender
    if (Cloth == nil) then return end
    if (Low(Gender) == 'mp_male') then
      for k,v in pairs(Cloth) do
        if ((TN(v) ~= 1) and (Low(TS(k)) ~= 'name')) then
          local Hash = MaleCloth[k][TN(v)]
          Citizen.InvokeNative(0xD3A7B003ED343FD9 , NPC[ID],  TN(Hash), false, true, true)
        end
      end
    elseif (Low(Gender) == 'mp_female') then
      for k,v in pairs(Cloth) do
        if ((TN(v) ~= 1) and (Low(TS(k)) ~= 'name')) then
          local Hash = FemaleCloth[k][TN(v)]
          Citizen.InvokeNative(0xD3A7B003ED343FD9 , NPC[ID],  TN(Hash), false, true, true)
        end
      end
    end

    Citizen.InvokeNative(0x704C908E9C405136, NPC[ID])
    Citizen.InvokeNative(0xAAB86462966168CE, NPC[ID], 1)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, NPC[ID], 0, 1, 1, 1, 0)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(NPCs) do DeleteEntity(v.Hash) end
  for k,v in pairs(Blips) do RemoveBlip(v) end
  SetCamActive(ClothCam, false)
  DestroyCam(ClothCam)
  DisplayHud(true) DisplayRadar(true)
  DestroyCam(ClothCam, true)
  SetFreeze(PedID(), false)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
