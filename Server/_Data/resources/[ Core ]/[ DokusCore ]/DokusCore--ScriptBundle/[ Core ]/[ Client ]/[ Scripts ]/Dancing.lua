--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
-- Variables:
local Index = 1
local DanceDoPrompt = nil
local DanceEndPrompt = nil
local DanceNext = nil
local DancePrev = nil
local DancePrompts = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterCommand('dance', function()
  IsDancing = true
  TriggerEvent('DokusCore:ScriptBundle:DoDance')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local function SetupDancePrompt()
  CreateThread(function()
    local str = 'Dance'
    DanceDoPrompt = PromptRegisterBegin()
    PromptSetControlAction(DanceDoPrompt, _Keys.SPACEBAR)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(DanceDoPrompt, str)
    PromptSetEnabled(DanceDoPrompt, 1)
    PromptSetVisible(DanceDoPrompt, 1)
    PromptSetStandardMode(DanceDoPrompt,1)
    PromptSetGroup(DanceDoPrompt, DancePrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,DanceDoPrompt,true)
    PromptRegisterEnd(DanceDoPrompt)

    local str2 = 'Stop'
    DanceEndPrompt = PromptRegisterBegin()
    PromptSetControlAction(DanceEndPrompt, _Keys.DOWN)
    str2 = CreateVarString(10, 'LITERAL_STRING', str2)
    PromptSetText(DanceEndPrompt, str2)
    PromptSetEnabled(DanceEndPrompt, 1)
    PromptSetVisible(DanceEndPrompt, 1)
    PromptSetStandardMode(DanceEndPrompt,1)
    PromptSetGroup(DanceEndPrompt, DancePrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,DanceEndPrompt,true)
    PromptRegisterEnd(DanceEndPrompt)

    local str3 = 'Next'
    DanceNext = PromptRegisterBegin()
    PromptSetControlAction(DanceNext, _Keys.RIGHT)
    str3 = CreateVarString(10, 'LITERAL_STRING', str3)
    PromptSetText(DanceNext, str3)
    PromptSetEnabled(DanceNext, 1)
    PromptSetVisible(DanceNext, 1)
    PromptSetStandardMode(DanceNext,1)
    PromptSetGroup(DanceNext, DancePrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,DanceNext,true)
    PromptRegisterEnd(DanceNext)

    local str4 = 'Back'
    DancePrev = PromptRegisterBegin()
    PromptSetControlAction(DancePrev, _Keys.LEFT)
    str4 = CreateVarString(10, 'LITERAL_STRING', str4)
    PromptSetText(DancePrev, str4)
    PromptSetEnabled(DancePrev, 1)
    PromptSetVisible(DancePrev, 1)
    PromptSetStandardMode(DancePrev,1)
    PromptSetGroup(DancePrev, DancePrompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,DancePrev,true)
    PromptRegisterEnd(DancePrev)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:ScriptBundle:DoDance', function()
  SetupDancePrompt()
  while IsDancing do Wait(4)
    local PedID = PedID()
    local IsDead = IsEntityDead(PedID)
    local Hash = _ScriptBundle.Dancing.Dances[Index]
    local label  = CreateVarString(10, 'LITERAL_STRING', Hash[3])
    PromptSetActiveGroupThisFrame(DancePrompts, label)
    local Do   = Citizen.InvokeNative(0xC92AC953F0A982AE, DanceDoPrompt)
    local End  = Citizen.InvokeNative(0xC92AC953F0A982AE, DanceEndPrompt)
    local Next = Citizen.InvokeNative(0xC92AC953F0A982AE, DanceNext)
    local Prev = Citizen.InvokeNative(0xC92AC953F0A982AE, DancePrev)

    if (Do) then
      RequestAnimDict(Hash[1])
      while not HasAnimDictLoaded(Hash[1]) do Wait(100) end
      TaskPlayAnim(PedID, Hash[1], Hash[2], 1.0, 8.0, -1, 1, 0, false, false, false)
    end

    if (Next) then
      Index = (Index + 1)
      if (Index > 10) then Index = 1 end
    end

    if (Prev) then
      Index = (Index - 1)
      if (Index < 1) then Index = 10 end
    end

    if (End) then
      IsDancing = false
      Index = 1
      DanceDoPrompt = nil
      DanceEndPrompt = nil
      DanceNext = nil
      DancePrev = nil
      DancePrompts = GetRandomIntInRange(0, 0xffffff)
      ClearPedTasks(PedID)
      break
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
