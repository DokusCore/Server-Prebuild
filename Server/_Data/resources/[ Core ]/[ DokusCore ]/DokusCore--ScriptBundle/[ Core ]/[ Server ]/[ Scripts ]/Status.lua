--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- Display a scene status on your character that sticks until you remove it.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Array = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:ScriptBundle:Status:Set')
AddEventHandler('DokusCore:ScriptBundle:Status:Set', function(Data)
  local Source = source
  local Text = tostring(Data.Result)
  local Stat = { Text = Text, ServerID = Source }
  Array[#Array + 1] = Stat
  TriggerClientEvent('DokusCore:ScriptBundle:Status:Activate', -1, Array)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterServerEvent('DokusCore:ScriptBundle:Status:Delete')
AddEventHandler('DokusCore:ScriptBundle:Status:Delete', function()
  local Source = source
  if (Array[1] ~= nil) then
    for k,v in pairs(Array) do
      if (Array[k].ServerID == Source) then
        table.remove(Array, k)
        break
      end
    end
  end
  TriggerClientEvent('DokusCore:ScriptBundle:Status:Activate', -1, Array)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
