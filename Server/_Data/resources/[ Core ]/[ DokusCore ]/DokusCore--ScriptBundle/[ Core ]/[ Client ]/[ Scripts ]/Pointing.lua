--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
local isPointing = false
local currAnim = nil

function GetPointRot()
    local cr = GetGameplayCamRelativeHeading()
    if cr >= 0 and cr < 135 then
        return 1
    elseif cr >= 135 then
        return 2
    elseif cr <= -136 then
        return 5
    elseif cr <= -46 then
        return 4
    elseif cr <= 0 then
        return 3
    end
end

function triggerPointing()
    while isPointing do
        Wait(0)
        GetPointRot()
        local dict = "ai_combat@aim_intro@veh_wagon@seat_fr@cowboy@targeted@unholstered@base@1h"
        if IsControlJustPressed(0, 0x80F28E95) then
            isPointing = false
            Wait(150)
            currAnim = nil
            StopAnimTask(PlayerPedId(), dict, currAnim, 1.0)
            ClearPedTasks(PlayerPedId())
            return
        end

        loadAnimDict(dict)
        local camRot = GetPointRot()
        if camRot == 1 then
            if currAnim ~= "left_-45" then
                currAnim = "left_-45"
                TaskPlayAnim(PlayerPedId(), dict, "left_-45", -1, -1, -1, 30, 0, false, false, false)
            end
        elseif camRot == 2 then
            if currAnim ~= "left_-135" then
                currAnim = "left_-135"
                TaskPlayAnim(PlayerPedId(), dict, "left_-135", -1, -1, -1, 30, 0, false, false, false)
            end
        elseif camRot == 3 then
            if currAnim ~= "right_45" then
                currAnim = "right_45"
                TaskPlayAnim(PlayerPedId(), dict, "right_45", -1, -1, -1, 30, 0, false, false, false)
            end
        elseif camRot == 4 then
            if currAnim ~= "right_135" then
                currAnim = "right_135"
                TaskPlayAnim(PlayerPedId(), dict, "right_135", -1, -1, -1, 30, 0, false, false, false)
            end
        elseif camRot == 5 then
            if currAnim ~= "back_left_-225" then
                currAnim = "back_left_-225"
                TaskPlayAnim(PlayerPedId(), dict, "back_left_-225", -1, -1, -1, 30, 0, false, false, false)
            end
        end
    end
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end

CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 0x80F28E95) then
            isPointing = true
            triggerPointing()
        end
    end
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
