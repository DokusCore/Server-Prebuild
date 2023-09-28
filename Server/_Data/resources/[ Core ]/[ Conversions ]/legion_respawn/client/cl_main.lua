
local newCharacter = false
local pressed = false
local code
local revived = false
RegisterCommand("kill", function(source, args, rawCommand) -- COMANDO MATE-SE/ KILL YOURSELF COMMAND
    local _source = source
    if Config.kysCommand then
        local pl = Citizen.InvokeNative(0x217E9DC48139933D)
        local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
        Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
    end
end, false)


RegisterNetEvent("legion_respawn:TransferCode")
AddEventHandler("legion_respawn:TransferCode", function(c)
    if code == nil then
        code = c
    end
end)

RegisterNetEvent("legion_respawn:gotRevive")
-- AddEventHandler("legion_respawn:gotRevive", function(c)
AddEventHandler("legion_respawn:gotRevive", function()
    -- if c ~= code then return end

    DoScreenFadeOut(500)
    Wait(500)
    revived = true
    Wait(1000)
    RespawnCamera(GetEntityCoords(PlayerPedId()))

    local PedID = PedID()
    TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { 50 })
    TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { 50 })
    TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
    TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
    TriggerEvent('DokusCore:Metabolism:Edit:Health', { 100.0 })
end)

RegisterCommand("revive", function(source, args, rawCommand)
    -- print(code)
    -- if args[1] ~= nil then
    --     TriggerServerEvent('legion_respawn:revive', tonumber(args[1]) , code)
    -- else
    --     TriggerServerEvent('legion_respawn:revive', source , code) 
    -- end

    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Status = Low(GetUserChar(SteamID, Sync.CharID).Group)
    local Admin, Owner = Low(_Moderation.Admin), Low(_Moderation.SuperAdmin)
    if ((Status ~= Admin) or (Status ~= Owner)) then return NoteObjective("Error", "You're not a admin or owner!", "Horn", 10000); end
    if (args[1] == nil) then return NoteObjective("Error", "You've not supplied a server id!", "Horn", 10000); end
    TriggerServerEvent('legion_respawn:revive', tonumber(args[1]));
end)

RegisterNetEvent("legion_respawn:KillPlayer")
AddEventHandler("legion_respawn:KillPlayer", function(c)
    if c ~= code then return end
    local pl = Citizen.InvokeNative(0x217E9DC48139933D)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
    Citizen.InvokeNative(0x697157CED63F18D4, ped, 500000, false, true, true)
end)


local onPlayerDead = false
Citizen.CreateThread(function()
    while true do
        Wait(0)
        while IsPlayerDead(PlayerId()) and not revived do
            Wait(1)
            local timer = GetGameTimer()+Config.RespawnTime
            while timer >= GetGameTimer() and not revived do
                if revived == false then

                    if onPlayerDead == false then
                        -- ON PLAYER DEAD STUFF
                        --
                        --
                        --

                        DisplayHud(false)
                        DisplayRadar(false)
                        exports.spawnmanager:setAutoSpawn(false)
                        Citizen.InvokeNative(0xFA08722A5EA82DA7, "LensDistDrunk")
                        Citizen.InvokeNative(0xFDB74C9CC54C3F37, 1.0)
                        TriggerServerEvent("legion_respawn:DeadTable", "add" , code)
                        AnimpostfxPlay("DeathFailMP01")
                        StartDeathCam()
                        onPlayerDead = true
                    end

                    Wait(1)
                    ProcessCamControls()
                    DrawTxt(Config.LocaleTimer .. " " .. tonumber(string.format("%.0f", (((GetGameTimer() - timer) * -1)/1000))), 0.50, 0.80, 0.7, 0.7, true, 255, 255, 255, 255, true)
                    

                else
                    break
                end
            end
            while true do
                Wait(0)
                ProcessCamControls()
                DrawTxt("Press E to Respawn", 0.50, 0.45, 1.0, 1.0, true, 255, 255, 255, 255, true)
                if IsControlJustReleased(0, 0xDFF812F9) or revived then
                    break
                end
            end
            respawn(not revived)
            revived = false
            onPlayerDead = false
            TriggerServerEvent("legion_respawn:DeadTable", "remove" , code)
        end
    end
end)


function respawn(changetown)
    if changetown then
        SendNUIMessage({
            type = 1,
            showMap = true
        })
        SetNuiFocus(true, true)
    end
    EndDeathCam()
    AnimpostfxStop("DeathFailMP01")
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    DestroyAllCams(true)

    local pl = Citizen.InvokeNative(0x217E9DC48139933D)
    local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
    local coords = GetEntityCoords(ped, false)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    FreezeEntityPosition(ped, true)
    Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
    Citizen.InvokeNative(0x0E3F4AF2D63491FB)
end

RegisterNetEvent("legion_respawn:respawn")
AddEventHandler("legion_respawn:respawn", function(new)
    newCharacter = new
    respawn(new)
end)

RegisterNetEvent("legion_respawn:respawnCoords")
AddEventHandler("legion_respawn:respawnCoords", function(coords , c)
    if c ~= code then return end
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 1,
        showMap = false
    })
    FreezeEntityPosition(ped, false)

    ShutdownLoadingScreen()
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 59.95, true, true, false)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    ClearPedTasksImmediately(ped)
    ClearPlayerWantedLevel(PlayerId())
    FreezeEntityPosition(ped, false)
    SetPlayerInvincible(PlayerId(), false)
    SetEntityVisible(ped, true)
    SetEntityCollision(ped, true)
    TriggerEvent('playerSpawned')
    Citizen.InvokeNative(0xF808475FA571D823, true)
    NetworkSetFriendlyFireOption(true)
    RespawnCamera(coords)
    TriggerServerEvent("legion_respawn:registerCoords", coords)
    SavePosition()
end)

RegisterNUICallback('select', function(spawn, cb)
    local coords = Config[spawn][math.random(#Config[spawn])]
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 1,
        showMap = false
    })
    FreezeEntityPosition(ped, false)

    ShutdownLoadingScreen()
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 59.95, true, true, false)
    local ped = PlayerPedId()
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    ClearPedTasksImmediately(ped)
    ClearPlayerWantedLevel(PlayerId())
    FreezeEntityPosition(ped, false)
    SetPlayerInvincible(PlayerId(), false)
    SetEntityVisible(ped, true)
    SetEntityCollision(ped, true)
    TriggerEvent('playerSpawned', spawn)
    Citizen.InvokeNative(0xF808475FA571D823, true)
    NetworkSetFriendlyFireOption(true)
	if newCharacter then
	   TriggerServerEvent("redemrp_skin:loadSkin")
	end
    RespawnCamera(coords)
    TriggerServerEvent("legion_respawn:registerCoords", coords)
    SavePosition()
end)

local saving = false
function SavePosition()
    if not saving then
        Citizen.CreateThread(function()
            while true do
                Wait(15000)
                local coords = GetEntityCoords(PlayerPedId())
                TriggerServerEvent("legion_respawn:registerCoords", {x = coords.x, y = coords.y, z = coords.z})
            end
        end)
        saving = true
    end
end

function RespawnCamera(_coords)
    DoScreenFadeIn(500)
    local coords = _coords
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 621.67,374.08,873.24, 300.00,0.00,0.00, 100.00, false, 0) -- CAMERA COORDS
    PointCamAtCoord(cam, coords.x,coords.y,coords.z+200)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    DoScreenFadeIn(500)
    Citizen.Wait(500)

    cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x,coords.y,coords.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam3, coords.x,coords.y,coords.z+200)
    SetCamActiveWithInterp(cam3, cam, 3700, true, true)
    Citizen.Wait(3700)

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x,coords.y,coords.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, coords.x,coords.y,coords.z+2)
    SetCamActiveWithInterp(cam2, cam3, 3700, true, true)
    RenderScriptCams(false, true, 500, true, true)
    Citizen.Wait(500)
    SetCamActive(cam, false)
	FreezeEntityPosition(PlayerPedId(), false)
    DestroyCam(cam, true)
    DestroyCam(cam2, true)
    DestroyCam(cam3, true)
    DisplayHud(true)
    DisplayRadar(true)
    Citizen.Wait(3000)

end
--=============================================================-- DRAW TEXT SECTION--=============================================================--
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)


    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    Citizen.InvokeNative(0xADA9255D, 1);
	SetTextFontForCurrentCommand(7)
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end

--=============================================================-- CAMERA SECTION--=============================================================--

local cam = nil

local isDead = false

local angleY = 0.0
local angleZ = 0.0

function StartDeathCam()
    Citizen.CreateThread(function()
        ClearFocus()

        local playerPed = PlayerPedId()

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())
        ShakeCam(cam, "DRUNK_SHAKE", 0.5)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 1000, true, false)
    end)
end


function EndDeathCam()
    Citizen.CreateThread(function()
        ClearFocus()
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(cam, false)
        cam = nil
    end)
end


function ProcessCamControls()
    Citizen.CreateThread(function()

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)


            DisableFirstPersonCamThisFrame()

            local newPos = ProcessNewPosition()

            SetCamCoord(cam, newPos.x, newPos.y, newPos.z)

            PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
    end)
end

function ProcessNewPosition()
    local mouseX = 0.0
    local mouseY = 0.0


    -- keyboard
    if (IsInputDisabled(0)) then
        -- rotation
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 3.0
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 3.0

        -- controller
    else
        -- rotation
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 1.0
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 1.0
    end
    angleZ = angleZ - mouseX -- around Z axis (left / right)
    angleY = angleY + mouseY -- up / down
    -- limit up / down angle to 90°
    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end

    local pCoords = GetEntityCoords(PlayerPedId())

    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (1.5 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (1.5 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (1.5 + 0.5)
    }
    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
    local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

    local maxRadius = 1.5
    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords) < 1.5 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords)
    end

    local offset = {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }

    local pos = {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }

    return pos
end
