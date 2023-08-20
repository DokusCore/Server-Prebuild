local Dead = false
local deadcam = nil
local angleY = 0.0
local angleZ = 0.0
--------------------------------------------------------------------------------
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
CreateThread(function()
    while (not FrameReady()) do Wait(1000); end;
    while (not UserInGame()) do Wait(1000); end;
    DeathCam2(); DeathCam1();
    print('Init')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DeathCam1()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            if (deadcam and Dead) then
                ProcessCamControls()
            end
        end
    end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DeathCam2()
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            Citizen.Wait(500)
            if ((not Dead) and IsPedDeadOrDying(ped) and IsPlayerDead(ped)) then
                Dead = true
                exports.spawnmanager:setAutoSpawn(false);
                StartDeathCam();
                Wait(DeathCamTime * 1000);
                exports.spawnmanager:setAutoSpawn(true);
                exports.spawnmanager:spawnPlayer(); Wait(5000)
                DoScreenFadeIn(2000);
                EndDeathCam();
                TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { 50 })
                TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { 50 })
                TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
                TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
                TriggerEvent('DokusCore:Metabolism:Edit:Health', { 100.0 })
                Dead = false;
            end
        end
    end)
end
--------------------------------------------------
------------------- FUNCTIONS --------------------
--------------------------------------------------

-- initialize camera
function StartDeathCam()
    ClearFocus()

    local playerPed = PlayerPedId()
    deadcam = Citizen.InvokeNative(0x40C23491CE83708E,"DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(PlayerPedId()), 0, 0, 0, GetGameplayCamFov())

    SetCamActive(deadcam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

-- destroy camera
function EndDeathCam()
    ClearFocus()

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(deadcam, false)
    
    deadcam = nil
end

-- process camera controls
function ProcessCamControls()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(PlayerPedId())
    -- disable 1st person as the 1st person camera can cause some glitches
    Citizen.InvokeNative(0x05AB44D906738426)
    
    -- calculate new position
    local newPos = ProcessNewPosition()

    -- set coords of cam
    Citizen.InvokeNative(0xF9EE7D419EE49DE6,deadcam, newPos.x, newPos.y, newPos.z)
    
    -- set rotation
    Citizen.InvokeNative(0x948B39341C3A40C2,deadcam, playerCoords.x, playerCoords.y, playerCoords.z)
end

function ProcessNewPosition()
    local mouseX = 0.0
    local mouseY = 0.0
    
    -- keyboard
    if (IsInputDisabled(0)) then
        -- rotation
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 8.0
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 8.0
        
    -- controller
    else
        -- rotation
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 0.5
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 0.5
    end

    angleZ = angleZ - mouseX -- around Z axis (left / right)
    angleY = angleY + mouseY -- up / down
    -- limit up / down angle to 90°
    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    
    local pCoords = GetEntityCoords(PlayerPedId())
    
    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (0.5 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (0.5 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (0.5 + 0.5)
    }
    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
    local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
    local maxRadius = 3.5
    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords) < 0.5 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords)
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
    
    
    -- Debug x,y,z axis
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 0, 255, 255, false, false, 2, false, 0, false)
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, 0.03, 0.03, 5.0, 255, 0, 0, 255, false, false, 2, false, 0, false)
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 255, 0, 255, false, false, 2, false, 0, false)
    
    return pos
end
