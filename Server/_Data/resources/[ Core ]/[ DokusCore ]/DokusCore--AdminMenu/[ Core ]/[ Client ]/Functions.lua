--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
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
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Inventory", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetAllUsers()
    local players = {}
    for i = 0, 2000 do
        if NetworkIsPlayerActive(i) then
          local IDs = TSC('DokusCore:Core:GetUserIDs', { 'source', { GetPlayerServerId(i) } })
          table.insert(players, {id = GetPlayerServerId(i), name = GetPlayerName(i), steam = IDs[1]})
        end
    end
    return players
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
