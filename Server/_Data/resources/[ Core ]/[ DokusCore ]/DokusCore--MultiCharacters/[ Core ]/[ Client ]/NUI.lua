--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('closeUI', function() DoScreenFadeIn(1500) ToggleMenu(false) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Wait for user to connect to the servers
--------------------------------------------------------------------------------
RegisterNUICallback('selectCharacter', function(Data)
  DoScreenFadeOut(1500) Wait(1500)
  ToggleMenu(false)
  local PedID = PlayerPedId()
  local CharID = Data['cData']['CharID']
  local Steam = Data['cData']['Steam']
  PlayerID = CharID
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
  local Data = json.decode(Char.Result[1].Coords)
  local Coords = vector3(Data['x'], Data['y'], Data['z'])
  TSC('DokusCore:Core:SetCoreUserData', { 'CharID', { CharID } })
  TSC('DokusCore:Core:SetCoreUserData', { 'Coords', { Coords } })
  SetEntityCoords(PedID, Coords)
  SetEntityVisible(PedID, true)
  FreezeEntityPosition(PedID, false)

  -- Update the users hud
  TSC('DokusCore:Core:Hud:Update', { 'User' })
  TSC('DokusCore:Core:Hud:Toggle', true)
  DoScreenFadeIn(1500) Wait(5000)

  -- Apply users skin
  local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
  if (User.Skin ~= '--') then
    local Skin = json.decode(User.Skin)
    TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
  end


end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('setupCharacters', function()
  local Array = {}
  local Steam = TSC('DokusCore:Core:GetUserIDs', { 'User' })[1]
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'All', { Steam } })
  if not (Char.Exist) then SendNUIMessage({ action = "SetupSteam", value = Steam }) return end
  for k, v in pairs(Char.Result) do
    local CharID, cName = v.CharID, v.cName
    table.insert(Array, { Steam = Steam, CharID = CharID, cName = cName })
  end
  SendNUIMessage({ action = "setupCharacters", characters = Array })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('createNewCharacter', function(Data)
  local source = source
  local PedID = PlayerPedId()
  local Steam, CharID = Data.Steam, Data.CharID
  TSC('DokusCore:Core:SetCoreUserData', { 'CharID', { CharID } })
  DoScreenFadeOut(1500) Wait(1500)
  SetNuiFocus(false, false)
  ToggleMenu(false)
  local cChar = TSC('DokusCore:MultiChar:CreateNewCharacter', Data)
  if (cChar.Error) then IsError(cChar.ErrReason) return end
  local Config = _MultiCharacters.StartPositions[1]
  SetCoords(PedID, Config.Coords, Config.Heading)
  TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'TrainPass', 0.3) Wait(17000)
  if (_MultiCharacters.IntroSong.Enabled) then TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'RunHome', _MultiCharacters.IntroSong.Volume) end
  SetEntityVisible(PedID, true)
  FreezeEntityPosition(PedID, false)
  Wait(2000)

  PlayerID = CharID
  DoScreenFadeIn(15000)

  -- Open the skin menu
  if (_Modules.SkinCreator) then
    local pCoords = GetEntityCoords(PedID)
    TriggerEvent('DokusCore:SkinCreator:OpenMenu', PedID, pCoords)
  else
    TSC('DokusCore:Core:Hud:Toggle', true)
    TSC('DokusCore:Core:Hud:Update', { 'User' })
    TriggerEvent('DokusCore:Core:ShowTopNote', 'Welcome', _ServerName)
  end

  -- Give the user his / her starting items
  if (_MultiCharacters.GiveStartItems) then
    for k, v in pairs(_MultiCharacters.StartItems) do
      local Item, Amount, Type = string.lower(v.Item), v.Amount, v.Type
      TSC('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, Type, Item, Amount } })
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('removeCharacter', function(Data)
  TSC('DokusCore:Core:DBDel:Characters', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TSC('DokusCore:Core:DBDel:Banks', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TSC('DokusCore:Core:DBDel:Inventory', { 'User', 'All', { Data.Steam, Data.CharID } })
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
end)











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
