--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local str = 'Open Menu'
    Prompt_Settings = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Settings, _Keys.SPACEBAR)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Settings, str)
    PromptSetEnabled(Prompt_Settings, true)
    PromptSetVisible(Prompt_Settings, true)
    PromptSetHoldMode(Prompt_Settings, true)
    PromptSetGroup(Prompt_Settings, Group)
    PromptRegisterEnd(Prompt_Settings)

    local str = 'Inventory'
    Prompt_Invent = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Invent, _Keys.X)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Invent, str)
    PromptSetEnabled(Prompt_Invent,  true)
    PromptSetVisible(Prompt_Invent,  true)
    PromptSetStandardMode(Prompt_Invent, true)
    PromptSetGroup(Prompt_Invent, Group)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_Invent, true)
    PromptRegisterEnd(Prompt_Invent)

    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Status = Low(GetUserGroup(SteamID, Sync.CharID))
    local Admin, Owner = Low(_Moderation.Admin), Low(_Moderation.SuperAdmin)
    if ((Status == Admin) or (Status == Owner)) then
      local str = 'Admin Menu'
      Prompt_AdminMenu = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AdminMenu, _Keys.G)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AdminMenu, str)
      PromptSetEnabled(Prompt_AdminMenu,  true)
      PromptSetVisible(Prompt_AdminMenu,  true)
      PromptSetStandardMode(Prompt_AdminMenu, true)
      PromptSetGroup(Prompt_AdminMenu, Group)
      Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_AdminMenu, true)
      PromptRegisterEnd(Prompt_AdminMenu)

      local str = 'Start Zoning'
      Prompt_Zoning = PromptRegisterBegin()
      PromptSetControlAction(Prompt_Zoning, _Keys.Z)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_Zoning, str)
      PromptSetEnabled(Prompt_Zoning, true)
      PromptSetVisible(Prompt_Zoning, true)
      PromptSetHoldMode(Prompt_Zoning, true)
      PromptSetGroup(Prompt_Zoning, Group)
      PromptRegisterEnd(Prompt_Zoning)
    end

    -- Show prompt when mounted
    local Mount = IsPedOnMount(PedID())
    if ((Mount) and (not (AutoMoveOn))) then
      local str = 'Auto Move'
      Prompt_AutoDriveStart = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AutoDriveStart, _Keys.SHIFT)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AutoDriveStart, str)
      PromptSetEnabled(Prompt_AutoDriveStart, true)
      PromptSetVisible(Prompt_AutoDriveStart, true)
      PromptSetHoldMode(Prompt_AutoDriveStart, true)
      PromptSetGroup(Prompt_AutoDriveStart, Group)
      PromptRegisterEnd(Prompt_AutoDriveStart)
    elseif ((Mount) and (AutoMoveOn)) then
      local str = 'Stop Auto Move'
      Prompt_AutoDriveStop = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AutoDriveStop, _Keys.SHIFT)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AutoDriveStop, str)
      PromptSetEnabled(Prompt_AutoDriveStop, true)
      PromptSetVisible(Prompt_AutoDriveStop, true)
      PromptSetHoldMode(Prompt_AutoDriveStop, true)
      PromptSetGroup(Prompt_AutoDriveStop, Group)
      PromptRegisterEnd(Prompt_AutoDriveStop)
    end

    -- Show prompt when weapon in hands
    local HasWeapon = Citizen.InvokeNative(0x3B390A939AF0B5FC, PedID())
    if (HasWeapon ~= false) then
      local str = 'Unequipt Weapon'
      Prompt_UnEqWeapon = PromptRegisterBegin()
      PromptSetControlAction(Prompt_UnEqWeapon, _Keys.B)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_UnEqWeapon, str)
      PromptSetEnabled(Prompt_UnEqWeapon,  true)
      PromptSetVisible(Prompt_UnEqWeapon,  true)
      PromptSetStandardMode(Prompt_UnEqWeapon, true)
      PromptSetGroup(Prompt_UnEqWeapon, Group)
      Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_UnEqWeapon, true)
      PromptRegisterEnd(Prompt_UnEqWeapon)
    end




  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
