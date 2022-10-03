--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
local DanceDoPrompt
local DanceEndPrompt
local DanceNext
local DancePrev
local DancePrompts = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local dancing = false
local index = 1
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Prompts = {
    Do = 0x39336A4F,
    End = 0xD8F73058,
    Prev = 0x3C3DD371,
    Next = 0x446258B6,
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Dances = {
    {"script_mp@emotes@dance@wild@b@male@unarmed@full_looped", "action_alt1_lf", "Dance 1"},
    {"script_mp@emotes@dance@confident@b@male@unarmed@full_looped", "action_alt1_lf", "Dance 2"},
    {"script_mp@emotes@dance@drunk@a@male@unarmed@full", "fullbody", "Dance 3"},
    {"ai_react@audience_dance_overlays@stand_lean_left", "high_01", "Dance 4"},
    {"ai_react@audience_dance_overlays@stand_lean_left", "high_02", "Dance 5"},
    {"script_mp@emotes@dance@graceful@a@male@unarmed@full_looped", "action_alt1_lf", "Dance 6"},
    {"script_mp@emotes@dance@graceful@a@male@unarmed@full_looped", "action_alt2_lf", "Dance 7"},
    {"script_mp@emotes@dance@wild@a@male@unarmed@full_looped", "action_alt1_back_fwd", "Dance 8"},
    {"script_mp@emotes@dance@confident@a@male@unarmed@full_looped", "action_alt1_lf_front", "Dance 9"},
    {"amb_misc@world_human_drunk_dancing@male@male_b@idle_a", "idle_b", "Dance 10"},
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetupDancePrompt()
    Citizen.CreateThread(function()
        local str = 'Dance'
        DanceDoPrompt = PromptRegisterBegin()
        PromptSetControlAction(DanceDoPrompt, Prompts.Do)
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
        PromptSetControlAction(DanceEndPrompt, Prompts.End)
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
        PromptSetControlAction(DanceNext, Prompts.Next)
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
        PromptSetControlAction(DancePrev, Prompts.Prev)
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
Citizen.CreateThread(function()
    SetupDancePrompt()
    while true do
        Citizen.Wait(4)
        RegisterCommand('dance', function()
            dancing = not dancing
        end)
        if dancing == true and not IsEntityDead(PlayerPedId()) then
            local label  = CreateVarString(10, 'LITERAL_STRING', Dances[index][3])
            PromptSetActiveGroupThisFrame(DancePrompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,DanceDoPrompt) then
                if index then
                    RequestAnimDict(Dances[index][1])
                    while not HasAnimDictLoaded(Dances[index][1]) do
                        Citizen.Wait(0)
                    end

                    TaskPlayAnim(PlayerPedId(), Dances[index][1], Dances[index][2], 1.0, 8.0, -1, 1, 0, false, false, false)
                end
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,DanceEndPrompt) then
                dancing = false
                ClearPedTasksImmediately(PlayerPedId())
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,DanceNext) then
                index = index + 1
                if index > #Dances then
                    index = 1
                end
            end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,DancePrev) then
                index = index - 1
                if index == 0 then
                    index = #Dances
                end
            end
        end
    end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	   return
	end
    dancing = false
    ClearPedTasksImmediately(PlayerPedId())
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
