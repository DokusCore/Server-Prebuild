--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Skins:Load:User', function()
  local Core   = GetAttributeCoreValue(PedID(), 0)
  local Sync   = TCTCC('DokusCore:Sync:Get:UserData')
  local CharID, Dec, Gender = Sync.CharID, Decoded(Sync.Skin), Sync.Gender
  local Skin, Face = Decoded(Dec.Skin), Decoded(Dec.Face)
  local Hash = GetHashKey(Up(Gender))
  RequestModel(Hash)
  while not HasModelLoaded(Hash) do Wait(10) end
  Citizen.InvokeNative(0xED40380076A31506, PlayerId(), Hash, false)
  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, PedID(), 0, 0)
  FixIssues(PedID(), Gender)
  SetPedSkin(PedID(), Gender, Skin, Face)
  SetModelAsNoLongerNeeded(Hash)
  Citizen.InvokeNative(0xC6258F41D86676E0, PedID(), 0, Core)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Skins:Load:NPC', function(ID, Data)
  local Dec  = Decoded(Data.Skin)
  local Skin = Decoded(Dec.Skin)
  local Face = Decoded(Dec.Face)
  LoadModel(Data.Gender)
  Citizen.InvokeNative(0xED40380076A31506, ID, GetHashKey(Up(Data.Gender)), false)
  Citizen.InvokeNative(0x77FF8D35EEC6BBC4, ID, 0, 0)
  FixIssues(ID, Data.Gender)
  SetNPCMenuSkins(ID, Data.Gender)
  SetPedSkin(ID, Data.Gender, Skin, Face)
  SetModelAsNoLongerNeeded(Data.Gender)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Skins:User:New', function(ID)
  NetworkGhosting(PedID(), true)
  SetEntityVisible(PedID(), false)
  SetEntityCoords(PedID(), -561.206, -3776.224, 239.597)
  SetFreeze(PedID(), true)
  SetTheiMaps() DisplayRadar(false)
  TriggerEvent('DokusCore:Skins:Spotlight', true)
  CreateNPCs()
  Wait(1000)
  UIFadeIn(500)
  DoStartCam() CreatePedCams()
  TriggerEvent('DokusCore:Skins:Activate:Prompts', true)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Skins:Spotlight', function(Bool)
  Spotlight = Bool
  while Spotlight do Wait(1)
    for k, v in pairs(_Skins.Light) do
      DrawLightWithRange(v.Coords, 255, 255, 255, v.Rot, v.Fov)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Skins:Activate:Prompts', function(Bool)
  ShowPrompt = Bool
  local Gender = nil
  SetPrompts()
  while true do Wait(1000)
    while ShowPrompt do Wait(1)
      local Name  = CreateVarString(10, 'LITERAL_STRING', MSG("SetGender").MSG)
      PromptSetActiveGroupThisFrame(Group, Name)
      local M = PromptHasHoldModeCompleted(Prompt_Male)
      local F = PromptHasHoldModeCompleted(Prompt_Female)
      local E = PromptHasHoldModeCompleted(Prompt_Enter)

      if (M) then
        Gender = true
        SelectionCamera(MaleCam, NPCs[1], 'MP_MALE', nil)
        ShowPrompt = false Wait(2000) ShowPrompt = true
      end

      if (F) then
        Gender = false
        SelectionCamera(FemaleCam, NPCs[2], 'MP_FEMALE', nil)
        ShowPrompt = false Wait(2000) ShowPrompt = true
      end

      if (E) then
        ShowPrompt = false
        UIFadeOut(2500) Wait(2600)
        if (Gender) then
          SetEntityCoords(NPCs[1], -558.56, -3781.16, 237.59)
          SetEntityHeading(NPCs[1], 87.21)
          SelectionCamera(MaleCam, NPCs[1], 'MP_MALE', 'Body')
          SendNUIMessage({ Action = 'Show', Gender = 'MP_MALE' })
          ResetNPCModel('MP_MALE')
        else
          SetEntityCoords(NPCs[2], -558.56, -3781.16, 237.59)
          SetEntityHeading(NPCs[2], 87.21)
          SelectionCamera(FemaleCam, NPCs[2], 'MP_FEMALE', 'Body')
          SendNUIMessage({ Action = 'Show', Gender = 'MP_FEMALE' })
          ResetNPCModel('MP_FEMALE')
        end

        SetNuiFocus(true, true)
        UIFadeIn(2500) Wait(2600)
      end
    end
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
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  ResetAllCameras()
  SetNuiFocus(false, false)
  SendNUIMessage({ action = 'Hide' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
