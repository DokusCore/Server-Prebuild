--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CloseMenu()
  SetNuiFocus(false, false) Radar(true)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenMenu()
  SetNuiFocus(true, true) Radar(false)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function APWarning()
  AutoPlayWarning = true
  Notify('AutoPlay is now turned on! It will keep playing music until you stop it!', 'TopRight', 10000) Wait(11000)
  Notify('NOTE: The music list is containing copywrited music! Watch out if your streaming!', 'TopRight', 30000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
