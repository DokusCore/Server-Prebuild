--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ChangeLanguage', function(Data) return TriggerEvent('DokusCore:Core:Commands:SetLanguage', Data.Option) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SaveCoords', function()
  local Pos = GetCoords(PedID())
  local Coords = Encoded(Pos)
  if (CharID == 0) then return RestartError() end
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Steam, CharID, Coords } })
  Notify("You've saved your coordinates!", 'topCenter', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SkinMenu', function(Data)
  CloseMenu()
  if (Data.Option == 'OpenMenu') then
    local PedID = PedID()
    local Coords = GetCoords(PedID)
    TriggerEvent('DokusCore:SkinCreator:OpenMenu', PedID, Coords)
  elseif (Data.Option == 'LoadSkin') then
    CloseMenu()
    if (CharID == 0) then return RestartError() end
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
    if (User.Skin == '--') then return Notify("You've no skin to load! Please create a skin first with /skin menu") end
    local Skin = Decoded(User.Skin)
    TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  Notify('Logging Out, and saving coords')
  TriggerEvent('DokusCore:MultiChar:Logout')
  SendNUIMessage({ Action = 'CloseMenu' }) CloseMenu()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
