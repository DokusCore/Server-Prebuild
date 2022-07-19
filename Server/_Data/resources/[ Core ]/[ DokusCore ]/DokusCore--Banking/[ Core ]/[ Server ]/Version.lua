--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
-- DO NOT: Remove the version updater below! This is what gives you feetback
-- when there is a new update available. Removing will result in the system
-- unable to check for updates, and will result in startup errors.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  local Name = GetCurrentResourceName()
  local Version = GetResourceMetadata(Name, 'version')
  TriggerEvent('DokusCore:Sync:Modules:Version', { Name, { Version } })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------











--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
