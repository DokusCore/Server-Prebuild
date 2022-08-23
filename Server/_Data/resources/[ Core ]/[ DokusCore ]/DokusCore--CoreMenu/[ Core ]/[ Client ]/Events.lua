--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:CoreMenu:ActPrompts', function()
  while IsMainMPShown do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'DokuCore')
    PromptSetActiveGroupThisFrame(Group, pName)
    local Menu   = PromptHasHoldModeCompleted(Prompt_Settings)
    local Invent = PromptHasHoldModeCompleted(Prompt_Invent)
    local Admin  = PromptHasHoldModeCompleted(Prompt_AdminMenu)
    if ((Menu) and (not (IsUserMenuOpen))) then OpenUserMenu() end
    if ((Invent) and (not IsInventOpen)) then OpenInventory() end
    if ((Admin) and (not IsAdminMenuOpen)) then OpenAdminMenu() end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:CoreMenu:InventoryClosed', function() IsInventOpen = false end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:CoreMenu:OpenMenu', function(Menu)
  IsAnyMenuOpen = true
  SetNuiFocus(true, true)
  SendNUIMessage({ Action = 'SetMenu',   Menu = Menu })
  if (Menu[1] == 'UserMenu')       then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.UserMenu  })      end
  if (Menu[1] == 'AdminMenu')      then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.AdminMenu })      end
  if (Menu[1] == 'TeleportMenu')   then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.TeleportMenu })   end
  if (Menu[1] == 'ModuleSyncMenu') then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.ModuleSyncMenu }) end
  if (Menu[1] == 'CharacterMenu')  then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.CharacterMenu })  end
  if (Menu[1] == 'SettingsMenu')   then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.SettingsMenu })   end
  if (Menu[1] == 'MusicMenu')      then SendNUIMessage({ Action = 'IndexKeys', Menu = _CoreMenu.MusicMenu })      end
  SendNUIMessage({ Action = 'OpenMenu' })
end)









































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
