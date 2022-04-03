--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:UsableItems:Sync')
AddEventHandler('DokusCore:UsableItems:Sync', function(Data)
  local Table = nil
  Table = TableItems(Data[1])
  TriggerEvent('DokusCore:Sync:Set:ModuleData', { 'UsableItems', { Table } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
