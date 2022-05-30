--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
	if (GetCurrentResourceName() == Name) then
    for k,v in pairs(Blips) do RemoveBlip(v) end
    for k,v in pairs(CounterNPCs) do DeleteEntity(v) end
    for k,v in pairs(ProstNPCs) do DeleteEntity(v) end
    for k,v in pairs(Camera) do DeleteEntity(v) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the prompts for the counter options
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Bathing:StartCounter', function()
  ActivateHotelPrompts()
  while ((InRange) and not (TakingABath)) do Wait(0)
    for k,v in pairs(_Bathing.Zones) do
      if ((v.ID == nil) or (Loc == nil)) then ResetData() break end
      if (Low(v.ID) == Low(Loc)) then
        local Name  = CreateVarString(10, 'LITERAL_STRING', 'Hotel '..v.ID)
        PromptSetActiveGroupThisFrame(Group, Name)
        local B = PromptHasHoldModeCompleted(Prompt_Bathing)
        if ((B) and not (TakingABath)) then TriggerEvent('DokusCore:Bathing:TakingABath', { Deluxe = false }) Wait(3000) end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Bathing:TakingABath', function(Data)
  TakingABath = true
  local PedID = PedID()
  for k,v in pairs(_Bathing.WalkLoc) do
    if (Low(v.ID) == Low(Loc)) then

      -- Make a callback check to see if this bath is already in use. ~~!!

			NoteObjective('Bathing House', "You'll find the bath down the hallway, have a pleasant time!", 'NPC', 7000)
      print("logging", v.Coords) Wait(7000)
      TaskGoToCoordAnyMeans(PedID, v.Coords, 1.0, 0, 0, 786603, 0xbf800000)
      Wait(v.Time * 1000)
      UIFadeOut(2000) Wait(4000)

      -- Start Bathing
      LoadScenes()
      LoadModel(`P_CS_RAG02X`)
		  local rag = CreateObject(`P_CS_RAG02X`, GetEntityCoords(PlayerPedId()), false, false, false, false, true)
		  table.insert(ProstNPCs, rag)
		  SetModelAsNoLongerNeeded(`P_CS_RAG02X`)
		  SetPedCanLegIk(PlayerPedId(), false)
		  SetPedLegIkMode(PlayerPedId(), 0)
		  ClearPedTasksImmediately(PlayerPedId(), true, true)
		  local animscene = Citizen.InvokeNative(0x1FCA98E33C1437B3, 'script@mini_game@bathing@BATHING_INTRO_OUTRO_VALENTINE', 0, "s_regular_intro", false, true)
		  SetAnimSceneEntity(animscene, "ARTHUR", PlayerPedId(), 0)
		  SetAnimSceneEntity(animscene, "Door", N_0xf7424890e4a094c0(142240370, 0), 0)
		  LoadAnimScene(animscene)
		  while not Citizen.InvokeNative(0x477122B8D05E7968, animscene, 1, 0) do Wait(10) end --// _IS_ANIM_SCENE_LOADED
		  -- TriggerMusicEvent("MG_BATHING_START")
		  StartAnimScene(animscene)
      UIFadeIn(2000) Wait(500)
      while Citizen.InvokeNative(0x3FBC3F51BF12DFBF, animscene, Citizen.ResultAsFloat()) <= 0.3 do Wait(0) end
		  -- UndressCharacter()
      -- local Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
      -- Tabi(Camera, Cam)
      -- N_0x69d65e89ffd72313(true, true)
      -- SetCamCoord(Cam, GetFinalRenderedCamCoord(), 0.0, 0.4, 0.5)
      -- SetCamRot(Cam, GetFinalRenderedCamRot(1), 1)
      -- SetCamFov(Cam, GetFinalRenderedCamFov())
      -- RenderScriptCams(true, true, 0, true, false, 0)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
