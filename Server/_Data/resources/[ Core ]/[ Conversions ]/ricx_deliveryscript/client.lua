local IsMission = false
local MissionX,MissionY,MissionZ = nil,nil,nil
local RewardM, RewardXP, RewardO = 0,0,0
local CurrentJobName
local CurrentJobFailedText
local CurrentJobFailedTextDuration
local object1
local MissionObjectModel
local Missionblip
local JobBlips = {
    { name = Config.D1.JobBlipName, sprite = Config.D1.JobBlipSprite, x = Config.D1.JobBlipCoords.X, y = Config.D1.JobBlipCoords.Y, z = Config.D1.JobBlipCoords.Z} --
}
local playercoords
local AllBlip = {}

RegisterNetEvent('ricx_deliveryjob_start')
AddEventHandler('ricx_deliveryjob_start', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.D1DELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.D1DELIVERY[route].CP.x, Config.D1DELIVERY[route].CP.y, Config.D1DELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.D1.Reward, Config.D1.XP, Config.D1DELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.D1DELIVERY[route].CP.x, Config.D1DELIVERY[route].CP.y, Config.D1DELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.D1DELIVERY[route].CP.x, Config.D1DELIVERY[route].CP.y, Config.D1DELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.D1.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.D1.MissionBlipName)
            MissionObjectModel = Config.D1Prop.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.D1Prop.BoneID, Config.D1Prop.PX, Config.D1Prop.PY, Config.D1Prop.PZ, Config.D1Prop.PRX, Config.D1Prop.PRY, Config.D1Prop.PRZ, false, false, true, false, 0, true, false, false)
            -- TriggerEvent("redem_roleplay:NotifyLeft", Config.D1.JobName, Config.D1.JobStartText, 'menu_textures', 'log_gang_bag', Config.D1.StartTextDuration*1000)
            NoteNPCTalk('Delivery', Config.D1.JobStartText, false, 5000)
            CurrentJobName = Config.D1.JobName
            CurrentJobFailedText = Config.D1.FailedText
            CurrentJobFailedTextDuration = Config.D1.FailedTextDuration
            else
                -- TriggerEvent("redem_roleplay:NotifyLeft", Config.D1.JobName, Config.D1.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.D1.AlreadyTextDuration*1000)
                NoteNPCTalk('Delivery', Config.D1.AlreadyInJobText, false, 5000)
            end
        end
    else
        -- TriggerEvent("redem_roleplay:NotifyLeft", Config.D1.JobName, Config.D1.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.D1.HasWeaponTextDuration*1000)
        NoteNPCTalk('Delivery', Config.D1.HasWeaponText, false, 5000)
    end
end)

Citizen.CreateThread(function()
    for i, v in pairs(JobBlips) do
        AllBlip[i] = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
        SetBlipSprite(AllBlip[i], v.sprite, 1)
        SetBlipScale(AllBlip[i], 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, AllBlip[i], v.name)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        playercoords = GetEntityCoords(PlayerPedId())
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.D1.JobBlipCoords.X,Config.D1.JobBlipCoords.Y,Config.D1.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(1 , _Keys.SPACEBAR) then
                        TriggerEvent("ricx_deliveryjob_start")
                    end
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsMission then
            DisableControlAction(0, 0xCEFD9220, true)--E ENTER
            DisableControlAction(0, 0xB2F377E8, true) -- F MELEE
            DisableControlAction(0, 0x8FFC75D6, true) -- SHIFT SPRINT
            -- DisableControlAction(0, 0xD9D0E1C0, true) -- SPACE JUMP
            DisableControlAction(0, 0xAC4BD4F1, true) -- TAB WEAPON SELECT
            DisableControlAction(0, 0x4CC0E2FE, true) -- B INVENTORY
            if not IsEntityPlayingAnim(PlayerPedId(), "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 3) then -- Check if the player is playing the Hold and Grab anim
                RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
                while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                        Citizen.Wait( 100 )
                end
                TaskPlayAnim(PlayerPedId(), "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            end
            if IsPedSwimming(PlayerPedId()) or IsPedFalling(PlayerPedId()) or Citizen.InvokeNative(0x59643424B68D52B5,PlayerPedId()) or IsPedDeadOrDying(PlayerPedId(), true) then --Fail if the player is swimming, falling or climbing
                IsMission = false
                RemoveBlip(Missionblip)
                SetGpsMultiRouteRender(false)
                DeleteObject(object1)
                ClearPedTasksImmediately(PlayerPedId())
                -- TriggerEvent("redem_roleplay:NotifyLeft", CurrentJobName, CurrentJobFailedText, 'menu_textures', 'cross', CurrentJobFailedTextDuration*1000)
                NoteNPCTalk('Delivery', CurrentJobFailedText, false, 5000)
                CurrentJobName = nil
                CurrentJobFailedText = nil
                CurrentJobFailedTextDuration = nil
                MissionX,MissionY,MissionZ = nil, nil, nil
                RewardM,RewardXP, RewardO = nil, nil, nil
                object1, Missionblip = nil, nil
            end
            if playercoords then
                if GetDistanceBetweenCoords(playercoords.x,playercoords.y,playercoords.z, MissionX,MissionY,MissionZ, true) < 2.0 then
                    local msg = "~o~Finish delivery [SPACEBAR]"
                    SetTextScale(1.5, 1.5)
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    print("Wait")
                    if IsControlJustPressed(1, _Keys.SPACEBAR) then
                      print("Pass")
                        SetGpsMultiRouteRender(false)
                        RemoveBlip(Missionblip)
                        DeleteObject(object1)
                        ClearPedTasksImmediately(PlayerPedId())
                        local rewardmoney = RewardM*RewardO
                        local rewardedxp = RewardXP*RewardO
                        -- TriggerEvent("redem_roleplay:NotifyLeft", CurrentJobName, 'Job Done! Your payment: ~o~~h~$'..rewardmoney..' ~e~ (+'..rewardedxp..' XP)', 'generic_textures', 'tick', 6000)
                        NoteNPCTalk('Delivery', 'Job Done! Your payment: ~o~~h~$'..rewardmoney, false, 5000)
                        -- TriggerServerEvent("ricx_deliveryjob_reward",rewardmoney, rewardedxp)

                        local Sync = TCTCC('DokusCore:Sync:Get:UserData')
                        local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
                        local User = TSC('DokusCore:Core:DBGet:Characters', Index)
                        local Money = User.Result[1].Money

                        local Index = { 'Payment', { Sync.SteamID, Sync.CharID, (Money + rewardmoney) } }
                        TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)

                        IsMission = false
                        CurrentJobName = nil
                        CurrentJobFailedText = nil
                        CurrentJobFailedTextDuration = nil
                        MissionX,MissionY,MissionZ = nil, nil, nil
                        RewardM,RewardXP, RewardO = nil, nil, nil
                        object1, Missionblip = nil, nil
                    end
                end
            end
        end
    end
end)



AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    IsMission = false
    CurrentJobName = nil
    CurrentJobFailedText = nil
    CurrentJobFailedTextDuration = nil
    MissionX,MissionY,MissionZ = nil, nil, nil
    RewardM,RewardXP, RewardO = nil, nil, nil
    SetGpsMultiRouteRender(false)
    ClearPedTasksImmediately(PlayerPedId())
    if Missionblip then
        print("Blip Deleted: "..Missionblip)
        RemoveBlip(Missionblip)
    end
    for i, v in pairs(AllBlip) do
        print("Blip deleted: "..AllBlip[i])
        RemoveBlip(AllBlip[i])
    end
    if object1 then
        DeleteObject(object1)
        print("Object deleted: "..object1)
    end
    Missionblip, object1 = nil, nil
end)
