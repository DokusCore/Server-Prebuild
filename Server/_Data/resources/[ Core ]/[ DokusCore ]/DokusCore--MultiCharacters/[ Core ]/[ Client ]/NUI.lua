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
  local Char =  TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } })
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

  -- Apply users skin -- NEED TO BE BUILD -=--- <<<<<<<<<<<<<<<<<<<<<<<<<
  Wait(1000) DoScreenFadeIn(1500)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('setupCharacters', function()
  local Array = {}
  local Steam = TSC('DokusCore:Core:GetUserIDs', { 'User' })[1]
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'All', { Steam } })
  if not (Char.Exist) then SendNUIMessage({ action = "SetupSteam", value = Steam }) return end
  for k,v in pairs(Char.Result) do
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
  TriggerEvent('DokusCore:Core:Sounds:PlayOnUser', 'TrainPass', 1.0) Wait(15000)
  SetEntityVisible(PedID, true)
  FreezeEntityPosition(PedID, false)

  -- Give the user his / her starting items
  if (_MultiCharacters.GiveStartItems) then
    for k,v in pairs(_MultiCharacters.StartItems) do
      local Item, Amount, Type = string.lower(v.Item), v.Amount, v.Type
      TSC('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Steam, CharID, Type, Item, Amount } })
    end
  end

  PlayerID = CharID
  DoScreenFadeIn(15000) Wait(6000)
  TriggerEvent('DokusCore:Core:ShowTopNote', 'Welcome', _ServerName)
  TSC('DokusCore:Core:Hud:Toggle', true)
  TSC('DokusCore:Core:Hud:Update', { 'User' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('removeCharacter', function(Data)
  TSC('DokusCore:Core:DBDel:Characters', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TSC('DokusCore:Core:DBDel:Banks', { 'User', 'Single', { Data.Steam, Data.CharID } })
  TriggerEvent('DokusCore:MultiChar:ChooseChar')
end)











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------