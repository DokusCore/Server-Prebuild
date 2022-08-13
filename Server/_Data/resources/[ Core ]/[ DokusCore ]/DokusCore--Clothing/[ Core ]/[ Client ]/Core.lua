--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
SteamID, CharID = nil, nil
NPCs, Blips = {}, {}
InArea, InStore, NearNPC = false, false, false
Loc, StoreInUse, MenuInUse = nil, false, false
Warned = false
ChangingClothes = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Prompt_Menu   = nil
Prompt_Outfits = nil
Prompt_Pay    = nil
Group         = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AlreadySaid = {}
Dialog      = _Dialogs.Clothing
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
FemaleData = {}
MaleData = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Skin        = {}
CNumber     = {}
FemaleCloth = {}
MaleCloth   = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ClothCam = nil
Zoom, Offset = nil, nil
Heading = nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ThisNPC, ThisCoords, ThisHeading = nil, nil, nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Clothing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Sync.SteamID, Sync.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Clothing) then
    while not FrameReady() do Wait(1000) end
    for k,v in pairs(_Clothing.NPCs) do Tabi(Blips, SetBlip(v.Coords, 1195729388, 1.0, Dialog.NPCName)) end
    for k,v in pairs(_Clothing.NPCs) do Tabi(NPCs, { ID = v.ID, Hash = SpawnNPC(v.Hash, v.Coords, v.Heading) }) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Clothing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(5000)
      for k,v in pairs(_Clothing.Zones) do
        local Dist = GetDistance(v.Coords)
        if ((Loc == nil) and (Dist <= v.Radius)) then Loc = Low(v.ID) end
        if ((Loc ~= nill) and (Low(Loc) == Low(v.ID))) then
          if ((Dist > v.Radius) and (InArea)) then SetOutArea() end
          if ((Dist <= v.Radius) and not (InArea)) then SetInArea() end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Set clothing data on plugin start
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Clothing) then
    while not FrameReady() do Wait(1000) end
    FemaleData = TSC('DokusCore:Core:DBGet:Data:Clothing', { 'Female', 'All' }).Result
    MaleData = TSC('DokusCore:Core:DBGet:Data:Clothing', { 'Male', 'All' }).Result
    SetClothingData()
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Clothing) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } })
    local Dec = Decoded(Char.Result[1].Skin)
    local MySkin = Decoded(Dec.Skin)
    for k,v in pairs(MySkin) do Tabi(Skin, { Type = k, Hash = tonumber(v) }) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:CheckDistStore', function()
  while InArea do Wait(2500)
    for k,v in pairs(_Clothing.Stores) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius) and (InStore)) then SetOutStore() end
        if ((Dist <= v.Radius) and not (InStore)) then SetInStore() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:CheckDistNPC', function()
  while InStore do Wait(500)
    for k,v in pairs(_Clothing.NPCs) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius) and (NearNPC)) then SetFarNPC() end
        if ((Dist <= v.Radius) and not (NearNPC)) then SetNearNPC() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Clothing:ShowPrompt', function()
  ActPrompts()
  while ((NearNPC) and not (StoreInUse) and (not (MenuInUse))) do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'Tailor')
    PromptSetActiveGroupThisFrame(Group, pName)
    local ME = PromptHasHoldModeCompleted(Prompt_Menu)
    local MA = PromptHasHoldModeCompleted(Prompt_Outfits)
    -- local PA = PromptHasHoldModeCompleted(Prompt_Pay)
    if ((ME) and not (StoreInUse)) then OpenMenu() end
    if ((MA) and not (StoreInUse)) then TriggerEvent('DokusCore:Clothing:OutfitMenu') end
    -- if ((PA) and not (StoreInUse)) then TriggerEvent('DokusCore:Clothing:PayForClothes') end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
