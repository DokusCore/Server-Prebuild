--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Delete all NPCs when the resource stops
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(AliveNPCs) do DeleteEntity(v) end
  for k,v in pairs(Blips) do RemoveBlip(v) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:FastTravel:Teleport:Guarma', function()
  local PedID = PedID()
  for k,v in pairs(_FastTravel.Locations) do
    if (v.ID == Loc) then
      for k,v in pairs(v.Data) do
        if (Low(v.ID) == 'guarma') then
          ShowPrompt = false
          SetFreeze(PedID, true)
          local Random = Dialog.GoodTravels[math.random(#Dialog.GoodTravels)]
          NoteNPCTalk(Dialog.NPCName, Random, true, 5000)
          SetFreeze(PedID, false)
          TaskGoToCoordAnyMeans(PedID, 2789.3, -1497.6, 42.7, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(18000)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          SetGuarmaData()
          Wait(3500) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 1278.5, -6859.4, 43.3, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(_Dialogs.Guarma, _Dialogs.Welcome)
          ResetData()
          ShowPrompt = true
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:FastTravel:Teleport:Jail', function()
  local PedID = PedID()
  for k,v in pairs(_FastTravel.Locations) do
    if (v.ID == Loc) then
      for k,v in pairs(v.Data) do
        if (Low(v.ID) == 'sisika jail') then
          ShowPrompt = false
          SetFreeze(PedID, true)
          local Random = Dialog.GoodTravels[math.random(#Dialog.GoodTravels)]
          NoteNPCTalk(Dialog.NPCName, Random, true, 5000)
          SetFreeze(PedID, false)
          TaskGoToCoordAnyMeans(PedID, 2789.3, -1497.6, 42.7, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(18000)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          Wait(3500) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 3299.3, -709.2, 43.3, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(_Dialogs.Jail, _Dialogs.Welcome)
          ResetData()
          ShowPrompt = true
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:FastTravel:Teleport:sDenis', function()
  local PedID = PedID()
  for k,v in pairs(_FastTravel.Locations) do
    if (v.ID == Loc) then
      for k,v in pairs(v.Data) do
        if (Low(v.ID) == 'sdenis') then
          ShowPrompt = false
          SetFreeze(PedID, true)
          local Random = Dialog.GoodTravels[math.random(#Dialog.GoodTravels)]
          NoteNPCTalk(Dialog.NPCName, Random, true, 5000)
          SetFreeze(PedID, false)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          if (Low(Loc) == 'guarma') then UnsetGuarmaData() end
          Wait(2000) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 2781.2, -1487.4, 42.4, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(_Dialogs.SaintDenis, _Dialogs.Welcome)
          ResetData()
          ShowPrompt = true
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------












--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
