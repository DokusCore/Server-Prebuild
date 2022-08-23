--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
BoatArr = {}
UserBoats = {}
NPCs, Blips = {}, {}
SteamID, CharID = nil, nil
InArea, InRange = false, false
NearNPC, CloseNPC = false, false
ShowPrompts, Loc = false, nil
StoreInUse = false
MenuPage = nil
PauseScript = false
Ready = false
MenuPaused = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
UserBoatName = nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Dialog = _Dialogs.Boats
Prompt_Menu, Group = nil, GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Boats) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Sync.SteamID, Sync.CharID
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Create the blip and the NPC on the map
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Boats) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    for k,v in pairs(_Boats.NPCs) do Tabi(Blips, SetBlip(v.Coords, 2033397166, 1.0, Dialog.NPCName)) end
    for k,v in pairs(_Boats.NPCs) do Tabi(NPCs, SpawnNPC(v.Hash, v.Coords, v.Heading)) end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Store all the boats in an array from the database
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Boats) then Wait(2000)
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    local Data = TSC('DokusCore:Core:DBGet:Items', { 'All' }).Result
    for k,v in pairs(Data) do if (Low(v.Type) == 'boat') then Tabi(BoatArr, v) end end
    Ready = true
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Check the range of the player when the player is far.
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Boats) then
    while not FrameReady() do Wait(1000) end
    while not UserInGame() do Wait(1000) end
    while true do Wait(1)
      for k,v in pairs(_Boats.NPCs) do
        local Dist = GetDistance(v.Coords)
        if ((Loc == nil) and (Dist <= v.Radius[1])) then Loc = Low(v.ID) end
        if ((Loc ~= nill) and (Low(Loc) == Low(v.ID))) then
          if ((Dist > v.Radius[1]) and (InArea)) then SetOutArea() end
          if ((Dist <= v.Radius[1]) and not (InArea)) then SetInArea() end
        end
      end
    end Wait(5000)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
