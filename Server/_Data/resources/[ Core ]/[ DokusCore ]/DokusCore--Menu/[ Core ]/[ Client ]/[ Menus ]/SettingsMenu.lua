--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('OpenSettingsMenu', function()
  local MN, MT, MO = nil, nil, nil
  for k,v in pairs(_DokusMenus.SettingsMenu) do MN, MT, MO = v.MenuName, v.MenuTitle, v.MenuOptions end
  SendNUIMessage({ MenuName = MN, MenuTitle = MT, MenuOptions = MO })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
