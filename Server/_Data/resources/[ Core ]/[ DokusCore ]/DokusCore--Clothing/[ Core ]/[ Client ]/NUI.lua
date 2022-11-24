--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('updateClothes', function(Data)
  if (_Clothing.DialogChance >= 1) then
    local Invert = ( 100 - _Clothing.DialogChance)
    if (Invert <= 2) then Invert = 2 end
    if (Invert > 100) then Invert = 100 end
    local Chance = math.floor(Round((Invert / 2), 0))
    local Random = math.random(0, Invert)
    if (Random == Chance) then
      local Txt = RandomDialog(MSG("Reactions"))
      local Random = Txt[math.random(#Txt)]
      NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, false, Floor(Random.Time * 1000))
    end
  end

  AFKCount = 0

  for k,v in pairs(Data) do
    if ((CNumber[k] ~= TN(v)) and (v ~= nil)) then
      CNumber[k] = TN(v)
      if (IsPedMale(PedID())) then
         UpdateClothes(v, MaleCloth, k)
      else
        UpdateClothes(v, FemaleCloth, k)
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ResetCam', function(Data)
  for k,v in pairs(_Clothing.Posing) do
    if (Low(Loc) == Low(v.ID)) then
      Zoom, Offset = v.Camera[1], v.Camera[2]
      SetCamera(Zoom, Offset)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Camera', function(Data)
  local ZM, OFF = Data.zoom, Data.offset
  if (ZM  ~= nil) then Zoom = (Zoom + ZM) end
  if (OFF ~= nil) then Offset = (Offset + OFF) end
  if ((ZM ~= nil) and (OFF ~= nil)) then SetCamera((Zoom + ZM), (Offset + OFF)) end
  if ((ZM == nil) and (OFF ~= nil)) then SetCamera(Zoom, (Offset + OFF)) end
  if ((ZM ~= nil) and (OFF == nil)) then SetCamera((Zoom + ZM), Offset) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Heading', function(Data)
  local H = GetEntityHeading(PedID())
  Heading = (H + Data.Heading)
  SetEntityHeading(PedID(), Heading)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('exit', function()
  DetectAFK = false
  IsNewCharacter = false
  AFKCount = 0
  ResetData()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('saveClothes', function(Data)
  local PedID = PedID()
  local Clothes = Encoded(Data)
  local Name = Data.name
  local Outfit, Stop = false, false
  if (Name ~= "") then Outfit = true end

  -- Safe the clothing to the characters table.
  if ((Outfit) or ((not (Outfit) and (Warned)))) then
    NoteNPCTalk("Tailor", "That is a fine choice you've made if I may say so myself", false, 5000)
    -- NoteNPCTalk('Tailor', "That will be a total of $"..TS(TotalPrice)..". Please follow me to the counter to pay for the clothing.", false, 7000)
    TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Clothing', { SteamID, CharID, Clothes } })
    SetFreeze(PedID, false) ResetData() Stop = true
    -- TriggerEvent('DokusCore:Clothing:PayForClothes')
  end

  -- Safe the outfit if the player wanted to
  if (Outfit) then
    TriggerServerEvent('DokusCore:Core:DBIns:Outfits', { 'User', { SteamID, CharID, Name, Clothes } })
    NoteNPCTalk("Tailor", "Your outfit will be delivered to your dressing room as soon as possible.", true, 5000)
  end

  -- Warn the player if he / she did not set a outfit name
  if (not (Outfit) and not (Warned) and not (Stop)) then
    Warned = true
    NoteNPCTalk('Tailor', 'Are you sure you do not want to safe your outfit for later? Without a outfit name it will not be saved to your dressing room!', true, 5000)
    NoteNPCTalk('Tailor', 'If you are sure you do not want to safe your outfit then click yes again. If not, then give the outfit a name first!', true, 5000)
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
