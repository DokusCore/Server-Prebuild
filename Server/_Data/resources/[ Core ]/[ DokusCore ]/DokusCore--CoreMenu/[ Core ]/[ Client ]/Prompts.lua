--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function ActPrompts()
  CreateThread(function()
    local Obj = TCTCC('DokusCore:UsableItems:Get:CloseObjData')
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Status = Low(GetUserChar(SteamID, Sync.CharID).Group)
    local Admin, Owner = Low(_Moderation.Admin), Low(_Moderation.SuperAdmin)
    local Mount = IsPedOnMount(PedID())

    local str = MSG("OpenMenu").MSG
    Prompt_Settings = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Settings, _Keys.SPACEBAR)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Settings, str)
    PromptSetEnabled(Prompt_Settings,  true)
    PromptSetVisible(Prompt_Settings,  true)
    PromptSetStandardMode(Prompt_Settings, true)
    PromptSetGroup(Prompt_Settings, Group)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_Settings, true)
    PromptRegisterEnd(Prompt_Settings)

    local str = MSG("Inventory").MSG
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


    if ((Status == Admin) or (Status == Owner)) then
      local str = MSG("AdminMenu").MSG
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

      local str = 'Admin Menu v2'
      Prompt_AdminMenuV2 = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AdminMenuV2, _Keys.TAB)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AdminMenuV2, str)
      PromptSetEnabled(Prompt_AdminMenuV2,  true)
      PromptSetVisible(Prompt_AdminMenuV2,  true)
      PromptSetStandardMode(Prompt_AdminMenuV2, true)
      PromptSetGroup(Prompt_AdminMenuV2, Group)
      Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_AdminMenuV2, true)
      PromptRegisterEnd(Prompt_AdminMenuV2)

      local str = MSG("Zoning").MSG
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
    if ((Mount) or (Mount == 1) and (not (AutoMoveOn))) then
      local str = MSG("StartMove").MSG
      Prompt_AutoDriveStart = PromptRegisterBegin()
      PromptSetControlAction(Prompt_AutoDriveStart, _Keys.SHIFT)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_AutoDriveStart, str)
      PromptSetEnabled(Prompt_AutoDriveStart, true)
      PromptSetVisible(Prompt_AutoDriveStart, true)
      PromptSetHoldMode(Prompt_AutoDriveStart, true)
      PromptSetGroup(Prompt_AutoDriveStart, Group)
      PromptRegisterEnd(Prompt_AutoDriveStart)
    elseif ((Mount) or (Mount == 1) and (AutoMoveOn)) then
      local str = MSG("StopMove").MSG
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

    if (Obj.Item == nil) then
      if (not (Mount) and (Sync.HorseID ~= nil)) then
        local Dist = GetDistance(GetCoords(Sync.HorseID))
        if (Dist <= _Stables.Horse.Call.Radius) then
          local str = 'Horse Call'
          Prompt_HorseCall = PromptRegisterBegin()
          PromptSetControlAction(Prompt_HorseCall, _Keys.E)
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Prompt_HorseCall, str)
          PromptSetEnabled(Prompt_HorseCall, true)
          PromptSetVisible(Prompt_HorseCall, true)
          PromptSetHoldMode(Prompt_HorseCall, true)
          PromptSetGroup(Prompt_HorseCall, Group)
          PromptRegisterEnd(Prompt_HorseCall)
        end

        if (Dist <= _Stables.Horse.Follow.Radius) then
          local str = 'Horse Follow'
          Prompt_HorseFollow = PromptRegisterBegin()
          PromptSetControlAction(Prompt_HorseFollow, _Keys.F)
          str = CreateVarString(10, 'LITERAL_STRING', str)
          PromptSetText(Prompt_HorseFollow, str)
          PromptSetEnabled(Prompt_HorseFollow, true)
          PromptSetVisible(Prompt_HorseFollow, true)
          PromptSetHoldMode(Prompt_HorseFollow, true)
          PromptSetGroup(Prompt_HorseFollow, Group)
          PromptRegisterEnd(Prompt_HorseFollow)
        end
      end
    end

    -- Show prompt when weapon in hands
    local HasWeapon = Citizen.InvokeNative(0x3B390A939AF0B5FC, PedID())
    if (HasWeapon ~= false) then
      local str = MSG("Unequipt").MSG
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

    if (Obj.Item ~= nil) then
      local str = 'Object Menu'
      Prompt_ObjMenu = PromptRegisterBegin()
      PromptSetControlAction(Prompt_ObjMenu, _Keys.E)
      str = CreateVarString(10, 'LITERAL_STRING', str)
      PromptSetText(Prompt_ObjMenu, str)
      PromptSetEnabled(Prompt_ObjMenu,  true)
      PromptSetVisible(Prompt_ObjMenu,  true)
      PromptSetHoldMode(Prompt_ObjMenu, true)
      PromptSetGroup(Prompt_ObjMenu, Group)
      Citizen.InvokeNative(0xC5F428EE08FA7F2C, Prompt_ObjMenu, true)
      PromptRegisterEnd(Prompt_ObjMenu)
    end
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
