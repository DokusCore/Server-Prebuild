local starting = false
local already = false
local count = {}
local createdped = {}
local pressing = false
local gpsx = 0.0
local gpsy = 0.0
local gpsz = 0.0
local Blips = {}

CreateThread(function()
  Tabi(Blips, SetBlip(vec3(-1820.71, -572.15, 156.0), 305281166, 1.0, 'Fighting Club'))
end)

AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(Blips) do RemoveBlip(v) end
end)

function missionstart()
  --Elige el array de coordenadas(lugar)
  local randomNCoords = math.random(21)
  local chossenCoords = {}
  -- print(randomNCoords)

  if randomNCoords == 1 then
    chossenCoords = Config.Coordenates.coords
  elseif randomNCoords == 2 then
    chossenCoords = Config.Coordenates.coords2
  elseif randomNCoords == 3 then
    chossenCoords = Config.Coordenates.coords3
  elseif randomNCoords == 4 then
    chossenCoords = Config.Coordenates.coords4
  elseif randomNCoords == 5 then
    chossenCoords = Config.Coordenates.coords5
  elseif randomNCoords == 6 then
    chossenCoords = Config.Coordenates.coords6
  elseif randomNCoords == 7 then
    chossenCoords = Config.Coordenates.coords7
  elseif randomNCoords == 8 then
    chossenCoords = Config.Coordenates.coords8
  elseif randomNCoords == 9 then
    chossenCoords = Config.Coordenates.coords9
  elseif randomNCoords == 10 then
    chossenCoords = Config.Coordenates.coords10
  elseif randomNCoords == 11 then
    chossenCoords = Config.Coordenates.coords11
  elseif randomNCoords == 12 then
    chossenCoords = Config.Coordenates.coords12
  elseif randomNCoords == 13 then
    chossenCoords = Config.Coordenates.coords13
  elseif randomNCoords == 14 then
    chossenCoords = Config.Coordenates.coords14
  elseif randomNCoords == 15 then
    chossenCoords = Config.Coordenates.coords15
  elseif randomNCoords == 16 then
    chossenCoords = Config.Coordenates.coords16
  elseif randomNCoords == 17 then
    chossenCoords = Config.Coordenates.coords17
  elseif randomNCoords == 18 then
    chossenCoords = Config.Coordenates.coords18
  elseif randomNCoords == 19 then
    chossenCoords = Config.Coordenates.coords19
  elseif randomNCoords == 20 then
    chossenCoords = Config.Coordenates.coords20
  elseif randomNCoords == 21 then
    chossenCoords = Config.Coordenates.coords21
  end


  for k, item in pairs(chossenCoords) do
    --Take a random model
    local modelNumeroRandom = math.random(32)
    local modelRandom = Config.models[modelNumeroRandom].hash
    local _hash = GetHashKey(modelRandom)
    RequestModel(_hash)
    if not HasModelLoaded(_hash) then
      RequestModel(_hash)
    end

    while not HasModelLoaded(_hash) do Wait(1) end

    -- print(modelNumeroRandom)

    createdped[k] = CreatePed(_hash, item.x, item.y, item.z, true, true, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])
    gpsx = item.x
    gpsy = item.y
    gpsz = item.z

    -- SET_PED_MAX_HEALTH
    --Ped becomes agressive to the player
    TaskCombatPed(createdped[k], PlayerPedId())
    count[k] = createdped[k]
    -- print(count[k])
  end
  --StartGpsMultiRoute(6, true, true)

  -- Add the points
  -- AddPointToGpsMultiRoute(gpsx, gpsy, gpsz)
  -- AddPointToGpsMultiRoute(gpsx, gpsy, gpsz)

  -- Set the route to render
  --SetGpsMultiRouteRender(true)

  starting = true
  Wait(1000)
  Citizen.CreateThread(function()
    local x = #chossenCoords
    local pl = Citizen.InvokeNative(GetPlayerGroup(0x217E9DC48139933D))
    while starting == true do
      Citizen.Wait(0)
      for k, v in pairs(createdped) do
        if IsEntityDead(v) then
          if count[k] ~= nil then
            x = x - 1
            count[k] = nil
            if x == 0 then
              --TriggerEvent("vorp:TipRight", Config.ObjectivesKilledMessage, 4000)
              -- print(Config.ObjectivesKilledMessage)
              -- print('pay')
              --TriggerServerEvent('borp_fightclub:AddSomeMoney')

              local Sync = TCTCC('DokusCore:Sync:Get:UserData')
              local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
              local Char = TSC('DokusCore:Core:DBGet:Characters', Index)
              local Money = Char.Result[1].Money
              local Rewards = ((((Config.Payment / 100) * 10) + Money) + Config.Payment)
              local Index = { 'Payment', { Sync.SteamID, Sync.CharID, TN(Rewards) } }
              TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
              NoteObjective('Fighting Club', "You've got payed $"..((Config.Payment / 100) * 10), 'Check', 5000)
              stopmission()
            end
          end
        end
        if IsPlayerDead(pl) then
          --TriggerEvent("vorp:TipRight", Config.DeadMessage, 4000)
          -- print('dead')
          stopmission()
        end
      end
    end
  end)
end

function stopmission()
  Wait(5000)
  pressing = false
  starting = false
  already = false
  --SetGpsMultiRouteRender(false)
  for k, v in pairs(createdped) do
    DeletePed(v)
    Wait(500)
  end
  table.remove{createdped}
  table.remove{count}
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
  local str = CreateVarString(10, "LITERAL_STRING", str)
  SetTextScale(w, h)
  SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
  SetTextCentre(centre)
  if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
  Citizen.InvokeNative(0xADA9255D, 1);
  DisplayText(str, x, y)
end

function startdialog()
  Citizen.CreateThread(function()
    local timetocheck = 600
    while timetocheck >= 0 do
      Citizen.Wait(0)
      DrawTxt(Config.KillingMessage, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
      timetocheck = timetocheck - 1
    end
  end)
end

local InRange = false
local ShowText = false
Citizen.CreateThread(function()
  while true do Wait(500)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local _source = source
    for k, v in pairs(Config.Locations) do
      local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
      if (distance < 1.5 and (not already) and (not (InRange))) then
        InRange, ShowText = true, true
        while (InRange) do Wait(0)
          local coords = GetEntityCoords(playerPed)
          local distance = GetDistanceBetweenCoords(coords, v['x'], v['y'], v['z'], true)
          if (distance > 1.5) then InRange, ShowText = false, false end
          if (ShowText) then DrawTxt(Config.HuntingMessage, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true) end
          if IsControlJustPressed(2, 0xC7B5340A) and not pressing then
            ShowText = false
            local Sync = TCTCC('DokusCore:Sync:Get:UserData')
            local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
            local Char = TSC('DokusCore:Core:DBGet:Characters', Index)
            local Money = Char.Result[1].Money

            if (Money >= Config.Payment) then
              NoteObjective('Fighting Club', "you've payed 1$ dollar to fight", 'Check', 3000)
              local Index = { 'Payment', { Sync.SteamID, Sync.CharID, TN(Money - Config.Payment) } }
              TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
              stopmission()
              pressing = true
              missionstart()
              startdialog()
              already = true
              InRange = false
              ShowText = true
            end
          end
        end
      end
    end
  end
end)
