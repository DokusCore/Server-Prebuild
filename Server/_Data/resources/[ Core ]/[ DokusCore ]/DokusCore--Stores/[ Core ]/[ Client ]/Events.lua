--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  ResetPrompts()
  if (#NPCs ~= 0) then for k,v in pairs(NPCs)  do DeleteEntity(v) end end
  if (#Blips ~= 0) then for k,v in pairs(Blips) do RemoveBlip(v) end end
  if (#cNPCs ~= 0) then for k,v in pairs(cNPCs) do DeleteEntity(v.NPC) end end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:Enter', function()
  local Txt = RandomDialog(MSG('EnterStore'))
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000)) Wait(500)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:Exit', function()
  local Txt = RandomDialog(MSG('ExitStore'))
  local Random = Txt[math.random(#Txt)]
  NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000)) Wait(500)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:In:Zone:NPC', function()
  ActPrompts() ShowPrompts = true
  while (ShowPrompts) do Wait(1)
    if (not (PausePrompts)) then
      local pName = CreateVarString(10, 'LITERAL_STRING', MSG("BlipName").MSG)
      PromptSetActiveGroupThisFrame(Group, pName)
      local P = PromptHasHoldModeCompleted(Prompt_Buy)
      local S = PromptHasHoldModeCompleted(Prompt_Sell)
      if ((P) and not (StoreInUse)) then OpenGeneralBuyStore() end
      if ((S) and not (StoreInUse)) then OpenGeneralSellStore() end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:Out:Zone:NPC', function()
  ResetPrompts()
  ShowPrompts  = false
  PausePrompts = false
  StoreInUse   = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stores:In:Zone:Custom:NPC', function(Data)
  ActPrompts() ShowPrompts = true
  while (ShowPrompts) do Wait(1)
    if (not (PausePrompts)) then
      local pName = CreateVarString(10, 'LITERAL_STRING', Data.NPCName)
      PromptSetActiveGroupThisFrame(Group, pName)
      local P = PromptHasHoldModeCompleted(Prompt_Buy)
      local S = PromptHasHoldModeCompleted(Prompt_Sell)
      if ((P) and not (StoreInUse)) then OpenCustomBuyStore() end
      if ((S) and not (StoreInUse)) then OpenCustomSellStore() end
    end
  end
end)
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






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
