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
function OpenMenu()
  IsMainMPShown = true
  ActPrompts()
  TriggerEvent('DokusCore:CoreMenu:ActPrompts')
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
  Prompt_Settings  = nil
  Prompt_Invent    = nil
  Prompt_AdminMenu = nil
  Group         = GetRandomIntInRange(0, 0xffffff)
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





















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------








































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
