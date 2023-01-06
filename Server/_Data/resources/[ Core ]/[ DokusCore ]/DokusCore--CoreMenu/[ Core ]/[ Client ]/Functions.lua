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
  NoteNPCTalk('AdminMenu v2', "You can open the new admin menu by tapping SHIFT while the core menu is open!", false, 5000)
  TriggerEvent('DokusCore:CoreMenu:ActPrompts')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenDCAdmin()
  TriggerEvent('DokusCore:Admin:OpenMenu')
  IsMainMPShown = false
  IsAnyMenuOpen = false
  ResetPrompts()
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
  Prompt_Zoning         = nil
  Prompt_AutoDriveStart = nil
  Prompt_AutoDriveStop  = nil
  Prompt_UnEqWeapon     = nil
  Prompt_HorseCall      = nil
  Prompt_HorseFollow    = nil
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
