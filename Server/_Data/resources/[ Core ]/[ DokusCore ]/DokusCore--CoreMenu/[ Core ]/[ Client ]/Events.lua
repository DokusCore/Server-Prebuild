--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:CoreMenu:ActPrompts', function()
  while IsMainMPShown do Wait(1)
    local pName = CreateVarString(10, 'LITERAL_STRING', 'DokuCore')
    PromptSetActiveGroupThisFrame(Group, pName)
    local Menu   = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_Settings)
    local Invent = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_Invent)
    local Admin  = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_AdminMenu)
    local Zoning  = PromptHasHoldModeCompleted(Prompt_Zoning)
    local AutoStart = PromptHasHoldModeCompleted(Prompt_AutoDriveStart)
    local AutoStop  = PromptHasHoldModeCompleted(Prompt_AutoDriveStop)
    local Unequipt  = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_UnEqWeapon)
    if ((Menu) and (not (IsUserMenuOpen))) then OpenUserMenu() end
    if ((Invent) and (not IsInventOpen)) then OpenInventory() end
    if ((Admin) and (not IsAdminMenuOpen)) then OpenAdminMenu() end
    if (AutoStart) then DoAutoMove()  return end
    if (AutoStop)  then EndAutoMove() return end
    if (Unequipt)  then TriggerEvent('DokusCore:GunStore:Weapon:Unequipt', false) return end

    if ((Zoning)) then
      IsMainMPShown = false
      TriggerEvent('DokusZones:Start:Zoning')
      CloseMenu()
      ResetPrompts()
      break
    end
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
