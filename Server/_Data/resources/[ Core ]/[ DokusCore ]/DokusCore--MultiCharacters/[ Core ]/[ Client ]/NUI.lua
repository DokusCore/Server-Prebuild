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
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
  local Bank = TSC('DokusCore:Core:DBGet:Banks', { 'User', 'All', 'Bank', { Steam, CharID } })
  local Data = Decoded(Char.Coords)
  local Coords = vector3(Data['x'], Data['y'], Data['z'])
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID', { CharID } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Coords', { Coords } })
  SetCoords(PedID, Coords)
  SetVisible(PedID, true)
  SetFreeze(PedID, false)

  -- Sync all user Data with DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName', { cName } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharMoney', { Char.Money } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharGold', { Char.Gold } })

  -- Set Bank / Money to sync with DataSync
  if (Bank.Exist) then
    local BankMoney, BankGold = {}, {}
    for k,v in pairs(Bank.Result) do table.insert(BankMoney, { Loc = v.Bank, Money = v.Money }) end
    for k,v in pairs(Bank.Result) do table.insert(BankGold,  { Loc = v.Bank, Gold = v.Gold   }) end
    local BM, BG = json.encode(BankMoney), json.encode(BankGold)
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankMoney', { BM } })
    TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetBankGold', { BG } })
  end

  -- Set data for all plugins.
  TriggerEvent('DokusCore:Metabolism:UserLoggedIn')
  TriggerEvent('DokusCore:Inventory:User:Login')

  -- Update DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive', { true } })

  --Continue
  UIFadeIn(1500) Wait(5000) DisplayRadar(true)

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
  TriggerEvent('DokusCore:Core:MP:Sounds:PlayOnUser', 'TrainPass', 0.3) Wait(10000)
  if (_MultiCharacters.IntroSong.Enabled) then TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'RunHome', _MultiCharacters.IntroSong.Volume) end
  SetVisible(PedID, true)
  SetFreeze(PedID, false)
  Wait(2000)

  UserID = CharID
  UIFadeIn(15000)
  DisplayRadar(true)

  -- Set user in game
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName', { cName } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharMoney', { cChar.Money } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'SetCharGold', { cChar.Gold } })

  -- Open the skin menu
  if (_Modules.SkinCreator) then
    local pCoords = GetEntityCoords(PedID)
    TriggerEvent('DokusCore:SkinCreator:OpenMenu', PedID, pCoords)
  else
    TriggerEvent('DokusCore:Core:ShowTopNote', 'Welcome', _ServerName)
  end

  -- Update DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive', { true } })

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
