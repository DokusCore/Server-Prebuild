--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('closeUI', function() UIFadeIn(1500) ToggleMenu(false) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('selectCharacter', function(Data)
  UIFadeOut(1500) Wait(1500)
  ToggleMenu(false)
  local PedID = PedID()
  local CharID = Data['cData']['CharID']
  local Steam = Data['cData']['Steam']
  local cName = Data['cData']['cName']
  UserID = CharID
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
  local Data = Decoded(Char.Result[1].Coords)
  local Coords = vector3(Data['x'], Data['y'], Data['z'])
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { CharID } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Coords', { Coords } })
  SetCoords(PedID, Coords)
  SetVisible(PedID, true)
  SetFreeze(PedID, false)



  -- Set user in game
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName', { cName } })

  -- Start the metabolism
  TriggerEvent('DokusCore:Metabolism:UserLoggedIn')

  -- Update the users hud
  -- TriggerEvent('DokusCore:Core:Hud:Update', { 'User' })
  -- TriggerEvent('DokusCore:Core:Hud:Toggle', true)
  UIFadeIn(1500) Wait(5000)

  -- Apply users skin
  local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
  if (User.Skin ~= '--') then
    local Skin = Decoded(User.Skin)
    TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('setupCharacters', function()
  local Array = {}
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'All', { Steam } })
  if not (Char.Exist) then SendNUIMessage({ action = "SetupSteam", value = Steam }) return end
  for k, v in pairs(Char.Result) do table.insert(Array, { Steam = Steam, CharID = v.CharID, cName = v.cName }) end
  SendNUIMessage({ action = "setupCharacters", characters = Array })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('createNewCharacter', function(Data)
  local source = source
  local PedID = PedID()
  local Steam, CharID = Data.Steam, Data.CharID
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { CharID } })
  UIFadeOut(1500) Wait(1500)
  UIFocus(false, false)
  ToggleMenu(false)
  local cChar = TSC('DokusCore:MultiChar:CreateNewCharacter', Data)
  if (cChar.Error) then IsError(cChar.ErrReason) return end
  local Config = _MultiCharacters.StartPositions[1]
  SetCoords(PedID, Config.Coords)
  SetHeading(PedID, Config.Heading)
  TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'TrainPass', 0.3) Wait(17000)
  if (_MultiCharacters.IntroSong.Enabled) then TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'RunHome', _MultiCharacters.IntroSong.Volume) end
  SetVisible(PedID, true)
  SetFreeze(PedID, false)
  Wait(2000)

  UserID = CharID
  UIFadeIn(15000)

  -- Set user in game
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName', { cName } })
  
  -- Open the skin menu
  if (_Modules.SkinCreator) then
    local pCoords = GetEntityCoords(PedID)
    TriggerEvent('DokusCore:SkinCreator:OpenMenu', PedID, pCoords)
  else
    -- TriggerEvent('DokusCore:Core:Hud:Toggle', true)
    -- TriggerEvent('DokusCore:Core:Hud:Update', { 'User' })
    TriggerEvent('DokusCore:Core:ShowTopNote', 'Welcome', _ServerName)
  end

  -- Give the user his / her starting items
  if (_MultiCharacters.GiveStartItems) then
    for k, v in pairs(_MultiCharacters.StartItems) do
      local Item, Amount, Type = string.lower(v.Item), v.Amount, v.Type
      TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, 'IN DEVELOPMENT', Item, Amount } })
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('removeCharacter', function(Data)
  TriggerServerEvent('DokusCore:Core:DBDel:Characters', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TriggerServerEvent('DokusCore:Core:DBDel:Banks', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TriggerServerEvent('DokusCore:Core:DBDel:Inventory', { 'User', 'All', { Data.Steam, Data.CharID } })
  TriggerServerEvent('DokusCore:Core:DBDel:Metabolism', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
