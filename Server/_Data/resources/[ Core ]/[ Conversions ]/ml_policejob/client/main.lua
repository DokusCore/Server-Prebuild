local HorseLoaded = nil

Citizen.CreateThread(function()
  local checkbox2 = false
  WarMenu.CreateMenu('perso', "Police")
  WarMenu.SetSubTitle('perso', 'Police Menu')
  WarMenu.CreateSubMenu('inv', 'perso', 'Police Horse')
  WarMenu.CreateSubMenu('inv1', 'perso', 'Your Options')


  while (not (FrameReady())) do Wait(1000) end
  while (not (UserInGame())) do Wait(1000) end
  while true do

    local ped = PedID()
    local coords = GetCoords(ped)

    if WarMenu.IsMenuOpened('perso') then



      if WarMenu.MenuButton('Police Options', 'inv1') then
      end

      if WarMenu.MenuButton('Police Horse', 'inv') then
      end

      WarMenu.Display()
    elseif WarMenu.IsMenuOpened('inv1') then

      if WarMenu.Button('Police Badge') then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x1FC12C9C, true, true, true)

      elseif WarMenu.Button('Cuff') then
        local closestPlayer, closestDistance = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then

          TriggerServerEvent("ml_policejob:cuffplayer", GetPlayerServerId(closestPlayer))
          print('cuffacept', closestPlayer, closestDistance)

        end
      elseif WarMenu.Button('UnCuff') then
        local closestPlayer, closestDistance = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then

          TriggerServerEvent("ml_policejob:uncuffplayer", GetPlayerServerId(closestPlayer))

        end
      elseif WarMenu.Button('Lasso Lock') then
        local closestPlayer, closestDistance = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then

          TriggerServerEvent("ml_policejob:lassoplayer", GetPlayerServerId(closestPlayer))

        end

      end

      WarMenu.Display()
    elseif WarMenu.IsMenuOpened('inv') then

      if WarMenu.Button('Horse Spawn') then
        if (HorseLoaded == nil) then
          local Horse = SpawnHorse()
          HorseLoaded = Horse
        else
          NoteObjective('System', "You've already spawned your police horse", 'Horn', 5000)
        end
      elseif WarMenu.Button('Horse Delete') then
        if (HorseLoaded ~= nil) then
          DeleteEntity(HorseLoaded)
          HorseLoaded = nil
        else
          NoteObjective('System', "You've not spawned your police horse!", 'Horn', 5000)
        end
      end

      WarMenu.Display()

    elseif whenKeyJustPressed(keys["U"]) then
      if (HasJob()) then TriggerEvent('ml_policejob:open') Wait(1000) end
    end

    Citizen.Wait(0)
  end
end)

-- pd station
Citizen.CreateThread(function()
  local checkbox2 = false
  WarMenu.CreateMenu('perso2', "Police")
  WarMenu.SetSubTitle('perso2', 'Police Menu')
  WarMenu.CreateSubMenu('inv3', 'perso2', 'Police clothing')
  WarMenu.CreateSubMenu('inv4', 'perso2', 'Police Weapons')
  WarMenu.CreateSubMenu('TP', 'perso2', 'Teleport')

  while true do

    local ped = PedID()
    local coords = GetEntityCoords(ped)

    if WarMenu.IsMenuOpened('perso2') then
      if WarMenu.MenuButton('Police Options', 'inv3') then
      end

      if WarMenu.MenuButton('Police Weapons', 'inv4') then
      end

      if WarMenu.MenuButton('Teleport', 'TP') then
      end

      WarMenu.Display()

    elseif WarMenu.IsMenuOpened('TP') then
      if WarMenu.Button('Valentine') then
        SetEntityCoords(ped, - 277.76, 804.97, 119.38)
      elseif WarMenu.Button('Blackwater') then
        SetEntityCoords(ped, - 764.14, - 1270.92, 44.04)
      elseif WarMenu.Button('Strawberry') then
        SetEntityCoords(ped, - 1811.91, - 353.65, 164.65)
      elseif WarMenu.Button('Rhodes') then
        SetEntityCoords(ped, 1359.61, - 1303.27, 77.77)
      elseif WarMenu.Button('Tumbleweed') then
        SetEntityCoords(ped, - 5530.48, - 2928.49, - 1.36)
      elseif WarMenu.Button('SaintDenis') then
        SetEntityCoords(ped, 2496.79, - 1302.06, 48.95)
      end

      WarMenu.Display()
    elseif WarMenu.IsMenuOpened('inv3') then


      if WarMenu.Button('put on Police Badge') then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x1FC12C9C, true, true, true)

      elseif WarMenu.Button('on duty Blackwater ped') then
        seteazaModel('S_M_M_AmbientBlWPolice_01')
      elseif WarMenu.Button('on duty SaintDenis ped') then
        seteazaModel('S_M_M_AmbientSDPolice_01')
      elseif WarMenu.Button('on duty Rhodes ped') then
        seteazaModel('CS_rhodeputy_01')
      elseif WarMenu.Button('on duty Valintine ped') then
        seteazaModel('S_M_M_VALDEPUTY_01')

      elseif WarMenu.Button('off duty refresh skin') then
        TriggerServerEvent("redemrp_skin:loadSkin")
        Citizen.Wait(1000)
        TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
      end

      WarMenu.Display()

    elseif WarMenu.IsMenuOpened('inv4') then
      if WarMenu.Button('Lasso') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_LASSO"), 500, true, 0)
      elseif WarMenu.Button('Revolver') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_REVOLVER_CATTLEMAN"), 500, true, 0)
      elseif WarMenu.Button('Repeater') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_REPEATER_HENRY"), 500, true, 0)
      elseif WarMenu.Button('Shotgun') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_SHOTGUN_PUMP"), 500, true, 0)
      elseif WarMenu.Button('Rifle') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK"), 500, true, 0)
      elseif WarMenu.Button('Lantern') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_MELEE_LANTERN_ELECTRIC"), 500, true, 0)
      elseif WarMenu.Button('Knife') then
        Citizen.InvokeNative(0xB282DC6EBD803C75, PedID(), GetHashKey("WEAPON_MELEE_KNIFE"), 500, true, 0)


      end

      WarMenu.Display()
    elseif (Vdist(coords.x, coords.y, coords.z, - 764.84, - 1271.85, 44.04) < 1.0) then --blackw
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    elseif (Vdist(coords.x, coords.y, coords.z, - 277.76, 804.97, 119.38) < 1.0) then --val
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    elseif (Vdist(coords.x, coords.y, coords.z, - 1811.91, - 353.65, 164.65) < 1.0) then --strw
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    elseif (Vdist(coords.x, coords.y, coords.z, 1359.61, - 1303.27, 77.77) < 1.0) then --rhod
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    elseif (Vdist(coords.x, coords.y, coords.z, - 5530.48, - 2928.49, - 1.36) < 1.0) then --tweed
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    elseif (Vdist(coords.x, coords.y, coords.z, 2496.79, - 1302.06, 48.95) < 1.0) then --saintD
      TriggerEvent("enter:pd")
      if whenKeyJustPressed(keys["G"]) then
        if (HasJob()) then
          TriggerEvent('ml_policejob:open2')
        end
      end
    end

    Citizen.Wait(0)

  end
end)


function seteazaModel(name)
  local model = GetHashKey(name)
  local player = PlayerId()

  if not IsModelValid(model) then return end
  PerformRequest(model)

  if HasModelLoaded(model) then
    -- SetPlayerModel(player, model, false)
    Citizen.InvokeNative(0xED40380076A31506, player, model, false)
    Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
    SetModelAsNoLongerNeeded(model)
  end
end

function PerformRequest(hash)
  RequestModel(hash, 0) -- RequestModel
  local times = 1
  while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, hash) do -- HasModelLoaded
    Citizen.InvokeNative(0xFA28FE3A6246FC30, hash, 0) -- RequestModel
    times = times + 1
    Citizen.Wait(0)
    if times >= 100 then break end
  end
end


RegisterNetEvent('enter:pd')
AddEventHandler('enter:pd', function()
  SetTextScale(0.5, 0.5)
  --SetTextFontForCurrentCommand(1)
  local msg = "Press [G] to access the pd menu."
  local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

  Citizen.InvokeNative(0xFA233F8FE190514C, str)
  Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent('ml_policejob:open2')
AddEventHandler('ml_policejob:open2', function(cb)
  WarMenu.OpenMenu('perso2')
  print ("openmenu")
end)

RegisterNetEvent('ml_policejob:open')
AddEventHandler('ml_policejob:open', function(cb)
  WarMenu.OpenMenu('perso')
  print ("openmenu")
end)

function whenKeyJustPressed(key)
  if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
    return true
  else
    return false
  end
end

function SpawnHorse()
  local localPed = PlayerPedId()
  local randomHorseModel = math.random(1, #Config.Horses)
  local model = GetHashKey(Config.Horses[randomHorseModel])
  local forward = Citizen.InvokeNative(0x2412D9C05BB09B97, localPed)
  local pos = GetEntityCoords(localPed)
  local myHorse = Citizen.InvokeNative(0xD49F9B0955C367DE, model, pos.x, pos.y, pos.z - 0.5, 180.0, true, true, true, true)
  TaskGoToEntity( myHorse, localPed, - 1, 7.2, 2.0, 0, 0 )
  Citizen.InvokeNative(0x283978A15512B2FE, myHorse, true)
  SetPedAsGroupMember(myHorse, 0) --Citizen.InvokeNative(0x9F3480FE65DB31B5, myHorse, 0)
  SetModelAsNoLongerNeeded(model) -- Citizen.InvokeNative(0x4AD96EF928BD4F9A, model)
  Citizen.InvokeNative(0xD3A7B003ED343FD9, myHorse, 0x1EE21489, true, true, true)
  Citizen.InvokeNative(0x23f74c2fda6e7c61, - 1230993421, myHorse)
  return myHorse
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--Police cuff
function GetClosestPlayer()
  local players, closestDistance, closestPlayer = GetActivePlayers(), - 1, - 1
  local playerPed, playerId = PlayerPedId(), PlayerId()
  local coords, usePlayerPed = coords, false

  if coords then
    coords = vector3(coords.x, coords.y, coords.z)
  else
    usePlayerPed = true
    coords = GetEntityCoords(playerPed)
  end

  for i = 1, #players, 1 do
    local tgt = GetPlayerPed(players[i])

    if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

      local targetCoords = GetEntityCoords(tgt)
      local distance = #(coords - targetCoords)

      if closestDistance == -1 or closestDistance > distance then
        closestPlayer = players[i]
        closestDistance = distance
      end
    end
  end
  return closestPlayer, closestDistance
end


RegisterNetEvent('ml_policejob:cuff')
AddEventHandler('ml_policejob:cuff', function()
  local playerPed = PlayerPedId()
  SetEnableHandcuffs(playerPed, true)

  print ("cuffplayer")

end)

--IsPedCuffed(playerPed, true)

RegisterNetEvent('ml_policejob:uncuff')
AddEventHandler('ml_policejob:uncuff', function()
  local playerPed = PlayerPedId()
  UncuffPed(playerPed)

  print ("uncuffplayer")

end)

RegisterNetEvent('ml_policejob:hogtie')
AddEventHandler('ml_policejob:hogtie', function()
  isLasso = not isLasso
  local playerPed = PlayerPedId()

  Citizen.CreateThread(function()
    if isLasso then
    TaskKnockedOutAndHogtied(playerPed, false, false)
    SetEnableHandcuffs(playerPed, true)
    DisablePlayerFiring(playerPed, true)
    SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
    SetPedCanPlayGestureAnims(playerPed, false)
    DisplayRadar(false)
  elseif not isLasso then
    ClearPedTasksImmediately(playerPed, true, false)
    ClearPedSecondaryTask(playerPed)
    SetEnableHandcuffs(playerPed, false)
    DisablePlayerFiring(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, true)
    DisplayRadar(true)
  end
  end)
end)
