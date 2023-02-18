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
          local Text = RandomDialog(MSG("GoodTravels"))
          local Random = Text[math.random(#Text)]
          NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
          SetFreeze(PedID, false)
          Cinema(true)
          TaskGoToCoordAnyMeans(PedID, 2789.3, -1497.6, 42.7, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(18000)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          SetGuarmaData()
          Wait(3500) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 1278.5, -6859.4, 43.3, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(SYS("Guarma").MSG, SYS("WelcomeTo").MSG) Wait(5000)
          Cinema(false)
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
          local Text = RandomDialog(MSG("GoodTravels"))
          local Random = Text[math.random(#Text)]
          NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
          SetFreeze(PedID, false)
          Cinema(true)
          TaskGoToCoordAnyMeans(PedID, 2789.3, -1497.6, 42.7, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(18000)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          Wait(3500) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 3299.3, -709.2, 43.3, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(SYS("Sisika").MSG, SYS("WelcomeTo").MSG) Wait(10000)
          Cinema(false)
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
          local Text = RandomDialog(MSG("GoodTravels"))
          local Random = Text[math.random(#Text)]
          NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
          SetFreeze(PedID, false)
          Cinema(true)
          UIFadeOut(2000) Wait(2000)
          SetCoords(PedID, v.Coords)
          SetHeading(PedID, v.Heading)
          if (Low(Loc) == 'guarma') then UnsetGuarmaData() end
          Wait(2000) UIFadeIn(5000)
          TaskGoToCoordAnyMeans(PedID, 2781.2, -1487.4, 42.4, 1.0, 0, 0, 786603, 0xbf800000)
          Wait(3000) NoteTopCenter(SYS("SaintDenis").MSG, SYS("WelcomeTo").MSG) Wait(5000)
          Cinema(false)
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
