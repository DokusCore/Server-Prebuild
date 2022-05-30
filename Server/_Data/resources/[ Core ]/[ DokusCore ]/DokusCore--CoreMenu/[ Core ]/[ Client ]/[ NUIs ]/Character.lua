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
  NoteObjective("System", "You've saved your coordinates!", 'Check', 5000)
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
    if (User.Skin == '--') then return NoteObjective("Error", "You've no skin to load! Please create a skin first with /skin menu", 'Alert', 5000) end
    local Skin = Decoded(User.Skin)
    TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  NoteObjective("Error", 'Logging Out, and saving coords', 'Alert', 5000)
  TriggerEvent('DokusCore:MultiChar:Logout')
  SendNUIMessage({ Action = 'CloseMenu' }) CloseMenu()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
