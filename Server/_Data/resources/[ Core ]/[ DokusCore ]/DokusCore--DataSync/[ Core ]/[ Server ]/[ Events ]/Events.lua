--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Sync:Set:ObjectData')
AddEventHandler('DokusCore:Sync:Set:ObjectData', function(a)
  if (Low(a[1]) == 'interactable') then SetIntObjects(a[2]) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Sync:Del:ObjectData')
AddEventHandler('DokusCore:Sync:Del:ObjectData', function(a)
  if (Low(a[1]) == 'interactable') then DelIntObjects(a[2][1]) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Sync:Set:SystemData')
AddEventHandler('DokusCore:Sync:Set:SystemData', function(a)
  if (Low(a[1]) == 'systemready') then _Sys.SystemReady = a[2] end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Sync:Modules:Version')
AddEventHandler('DokusCore:Sync:Modules:Version', function(a)
  local Name, Version = a[1], a[2][1]
  table.insert(_Mod.Versions, { Name = Name, Version = Version })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:Sync:Get:Modules:Version')
AddEventHandler('DokusCore:Sync:Get:Modules:Version', function()
  TriggerEvent('DokusCore:Core:Set:PluginVersions', _Mod.Versions)
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
