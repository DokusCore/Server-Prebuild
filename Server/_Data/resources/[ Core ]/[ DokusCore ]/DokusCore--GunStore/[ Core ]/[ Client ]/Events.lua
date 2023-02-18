--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:EnterStore', function(Data)
  if (not (AtStore)) then
    AtStore = true
    Loc = Low(Data.City)
    SetNPCToUse()
    SpawnCatalog();
    for k,v in pairs(_GunStore.Dialogs) do
      if (v.Welcome) then
        local Txt = RandomDialog(MSG("EnterStore"))
        local Random = Txt[math.random(#Txt)]
        NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000))
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Gunstore:ExitStore', function(Data)
  if (AtStore) then
    DeleteCatalog()
    AtStore, Loc = false, nil
    for k,v in pairs(_GunStore.Dialogs) do
      if (v.Goodbye) then
        ShowPrompts   = false
        Prompt_Menu   = nil
        Group         = GetRandomIntInRange(0, 0xffffff)
        local Txt = RandomDialog(MSG("ExitStore"))
        local Random = Txt[math.random(#Txt)]
        NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000))
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:NearCatalog', function(Data)
  if (not (NearNPC)) then
    NearNPC = true
    Loc = Low(Data.City)
    SetNPCToUse()
    for k,v in pairs(_GunStore.Dialogs) do
      local Txt = RandomDialog(MSG("NearNPC"))
      local Random = Txt[math.random(#Txt)]
      NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
    end
    TriggerEvent('DokusCore:GunStore:Start')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:Start', function(Data)
  local Zones = TSC('DokusCore:Core:DBGet:Zones', { 'All', 'Type', { 'NPC' } })
  for k,v in pairs(Zones.Result) do
    if (Low(v.City) == (Low(Loc))) then
      ShowPrompts = true
      TriggerEvent('DokusCore:GunStore:ShowPrompts')
      break
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:OpenCatalog', function()
  StoreInUse = true
  SetNuiFocus(true,true)
  SendNUIMessage({
    type = "OpenBookGui",
    value = true,
  })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:GunStore:NotNearCatalog', function()
  NearNPC = false
  StoreInUse = false
  ShowPrompts   = false
  Prompt_Menu   = nil
  Group         = GetRandomIntInRange(0, 0xffffff)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  if (#NPCs >= 1) then for k,v in pairs(NPCs) do DeleteEntity(v.NPC) end end
  if (#Blips >= 1) then for k,v in pairs(Blips) do RemoveBlip(v) end end
  if (#Props >= 1) then for k,v in pairs(Props) do DeleteEntity(v.Prop) end end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
