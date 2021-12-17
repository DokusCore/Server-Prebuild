--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  Notify('Logging Out, and saving coords')
  TriggerEvent('DokusCore:MultiChar:Logout')
  SendNUIMessage({ Action = 'CloseMenu' }) CloseMenu()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SaveCoords', function()
  local PedID = PlayerPedId()
  local Coords = GetEntityCoords(PedID)
  local Encoded = json.encode(Coords)
  local User = TSC('DokusCore:Core:GetCoreUserData')
  TSC('DokusCore:Core:DBSet:Characters', { 'Coords', { User.Steam, User.CharID, Encoded } })
  Notify("You've saved your coordinates!", 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SkinMenu', function(Data)
  CloseMenu()
  if (Data.Opt == 'OpenMenu') then
    local PedID = PlayerPedId()
    local Coords = GetEntityCoords(PedID)
    TriggerEvent('DokusCore:SkinCreator:OpenMenu', PedID, Coords)
  elseif (Data.Opt == 'LoadSkin') then
    CloseMenu()
    local Data = TSC('DokusCore:Core:GetCoreUserData')
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Data.Steam, Data.CharID } }).Result[1]
    if (User.Skin == nil) then return Notify("You've no skin to load! Please create a skin first with /skin menu") end
    local Skin = json.decode(User.Skin)
    TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ChangeLanguage', function(Data) return TriggerEvent('DokusCore:Core:Commands:SetLanguage', Data.Lang) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
