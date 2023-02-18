--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
SteamID, CharID = nil, nil
Loc, AliveNPCs, Blips = nil, {}, {}
ShowPrompt = true
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set Users SteamID
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTravel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Data.SteamID, Data.CharID
    UIFadeIn(1000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the map markers and spawn the bank npcs
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTravel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_FastTravel.Zones) do Tabi(Blips, SetBlip(v.Coords, -1505442625, 1.0, MSG("FastTravel").MSG)) end
    for k,v in pairs(_FastTravel.NPCs)  do Tabi(AliveNPCs, SpawnNPC(v.Hash, v.Coords, v.Heading, true)) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.FastTravel) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1000)
      for k,v in pairs(_FastTravel.Zones) do
        local Dist = GetDistance(v.Coords)
        if ((Dist <= v.Radius)) then
          InRange, Loc = true, v.ID
          if (Low(Loc) == 'sdenis') then SetDenisPrompts() end
          if (Low(Loc) == 'guarma') then SetGuarmaPrompts() end
          if (Low(Loc) == 'sisika jail') then SetJailPrompts() end
          while ((InRange) and (ShowPrompt)) do Wait(1)
            local Dist = GetDistance(v.Coords)
            if (Dist > v.Radius) then InRange = false Wait(100) end
            local Name  = CreateVarString(10, 'LITERAL_STRING', MSG("NPCName").MSG)
            PromptSetActiveGroupThisFrame(Group, Name)
            local G = PromptHasHoldModeCompleted(Prompt_Guarma)
            local C = PromptHasHoldModeCompleted(Prompt_Casino)
            local J = PromptHasHoldModeCompleted(Prompt_Jail)
            local S = PromptHasHoldModeCompleted(Prompt_Guarma_sDenis)
            local A = PromptHasHoldModeCompleted(Prompt_Jail_sDenis)
            if ((G)) then TriggerEvent('DokusCore:FastTravel:Teleport:Guarma') Wait(10000) end
            if ((C)) then TriggerEvent('DokusCore:FastTravel:Teleport:Casino') Wait(10000) end
            if ((J)) then TriggerEvent('DokusCore:FastTravel:Teleport:Jail')   Wait(10000) end
            if ((S)) then TriggerEvent('DokusCore:FastTravel:Teleport:sDenis') Wait(10000) end
            if ((A)) then TriggerEvent('DokusCore:FastTravel:Teleport:sDenis') Wait(10000) end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
