--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
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
  return _("CoreMenu", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenMenu()
  IsMainMPShown = true
  ActPrompts()
  TriggerEvent('DokusCore:CoreMenu:ActPrompts')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenDCAdmin()
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Status = Low(GetUserChar(Sync.SteamID, Sync.CharID).Group)
  local Admin, Owner = Low(_Moderation.Admin), Low(_Moderation.SuperAdmin)
  if ((Status == Admin) or (Status == Owner)) then
    IsMainMPShown = false
    IsAnyMenuOpen = false
    IsAdminMenuOpen = false
    TriggerEvent('DokusCore:Admin:OpenMenu')
    ResetPrompts()
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CloseMenu()
  SetNuiFocus(false, false)
  IsMainMPShown = false
  IsAnyMenuOpen = false
  ResetPrompts()
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenUserMenu()
  IsMainMPShown = false
  IsUserMenuOpen = true
  TriggerEvent('DokusCore:CoreMenu:OpenMenu', { 'UserMenu' })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenAdminMenu()
  IsMainMPShown = false
  IsAdminMenuOpen = true
  TriggerEvent('DokusCore:CoreMenu:OpenMenu', { 'AdminMenu' })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenAdminMenuV2()
  IsMainMPShown = false
  IsAdminMenuOpen = true
  TriggerEvent('DokusCore:CoreMenu:OpenMenu', { 'AdminMenuV2' })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetAllMenus()
  IsMainMPShown    = false
  IsInventOpen     = false
  IsUserMenuOpen   = false
  IsAdminMenuOpen  = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  Prompt_Settings       = nil
  Prompt_Invent         = nil
  Prompt_AdminMenu      = nil
  Prompt_AdminMenuV2    = nil
  Prompt_Zoning         = nil
  Prompt_AutoDriveStart = nil
  Prompt_AutoDriveStop  = nil
  Prompt_UnEqWeapon     = nil
  Prompt_HorseCall      = nil
  Prompt_HorseFollow    = nil
  Prompt_HorseStay      = nil
  Prompt_ObjMenu        = nil
  Group                 = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenInventory()
  IsInventOpen = true
  CloseMenu()
  TriggerEvent('DokusCore:Inventory:OpenInventory')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoAutoMove()
  AutoMoveOn = true
  Cinema(true)
  TaskGoToCoordAnyMeans(PedID(), GetWaypointCoords(), 20.0, 0, 0, 786603, 0xbf800000)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function EndAutoMove()
  AutoMoveOn = false
  Cinema(false)
  ClearPedTasks(PedID())
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
