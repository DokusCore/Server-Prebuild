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
    -- TriggerEvent('DokusCore:Skins:Open:Menu')
    NoteObjective("System", "This function is currently unavailable", 'Horn', 5000)
  elseif (Data.Option == 'LoadSkin') then
    CloseMenu()
    if (CharID == 0) then return RestartError() end
    local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Steam, CharID } }).Result[1]
    if (User.Skin == '--') then return NoteObjective("Error", "You've no skin to load! Please create a skin first with /skin menu", 'Alert', 5000) end
    TriggerEvent('DokusCore:Skins:Load:User') Wait(500)
    TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Logout', function()
  CloseMenu()
  SendNUIMessage({ Action = 'CloseMenu' })
  NoteObjective("Logging Out", 'Logging Out, and saving coords', 'Horn', 5000)
  TriggerEvent('DokusCore:Characters:BackToCamp')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------






























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
