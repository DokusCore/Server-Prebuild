--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Spawner:User:Login', function()
  local Sync   = TCTCC('DokusCore:Sync:Get:UserData')
  local Char   = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Sync.SteamID, Sync.CharID } })
  if (Sync.CharID == 0) then return RestartCharPicker() end
  local Dec    = Decoded(Char.Result[1].Coords)
  local Coords = vec3(Dec.x, Dec.y, Dec.z)
  SetCoords(PedID(), Coords)
  SetVisible(PedID(), true)
  SetInvincible(PedID(), false)
  SetFreeze(PedID(), false)
  NetworkGhosting(PedID(), false)

  -- Update DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Coords',     { Coords    } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive',      { true      } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true      } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Skin',       { Char.Result[1].Skin   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Gender',     { Char.Result[1].Gender } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName',      { Char.Result[1].cName  } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharMoney',  { Char.Result[1].Money  } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharGold',   { Char.Result[1].Gold   } })

  -- Continue
  TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
  TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  DisplayHud(true) DisplayRadar(true)
  UIFadeIn(5000)

  -- Log
  CreateLog('Spawner', 'Login', 'User logged in to the map')

  -- Update all depending plugins
  TriggerEvent('DokusCore:Metabolism:ShowHud', true)
  -- TriggerEvent('DokusCore:CoreMenu:SetData',  { 'Login' })
  TriggerEvent('DokusCore:Metabolism:UserLoggedIn')
  TriggerEvent('DokusCore:Inventory:User:Login')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Spawner:User:Logout', function()
  local Sync   = TCTCC('DokusCore:Sync:Get:UserData')
  local Coords = Encoded(GetCoords(PedID()))
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Coords', { Sync.SteamID, Sync.CharID, Coords } })
  SetVisible(PedID(), false)
  SetInvincible(PedID(), true)
  SetFreeze(PedID(), true)
  NetworkGhosting(PedID(), true)
  DisplayHud(false) DisplayRadar(false)

  -- Update DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Coords',     { nil   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { false } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharID',     { 0     } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Skin',       { nil   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Gender',     { nil   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName',      { nil   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharMoney',  { 0     } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharGold',   { 0     } })
  -- TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive', { false } })

  -- Log
  CreateLog('Spawner', 'Logout', 'User logged out from the map')

  -- Update Depening Plugins
  TriggerEvent('DokusCore:Metabolism:ShowHud', false)
  -- TriggerEvent('DokusCore:CoreMenu:SetData',  { 'Logout' })
  TriggerEvent('DokusCore:Metabolism:UserLoggedOut')
  TriggerEvent('DokusCore:Inventory:User:Logout')

  -- Logout the user
  TriggerEvent('DokusCore:Characters:BackToCamp')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Spawner:User:New', function()
  local Sync  = TCTCC('DokusCore:Sync:Get:UserData')
  -- TriggerEvent('DokusCore:Spawner:DisableAllControls', true)

  -- Get random starting area
  SpawnPos = TSC('DokusCore:Spawner:GetRoute')
  TSC('DokusCore:Spawner:RouteInUse', SpawnPos.ID)

  -- Get the coords of the tailer
  local tCoords = nil
  for k,v in pairs(Tailor) do
    if (Low(v.City) == Low(SpawnPos.City)) then
      tCoords = v.Coords
    end
  end

  -- Set Vehicle Despawn Coords
  local dCoords = nil
  for k,v in pairs(Despawn) do
    if (Low(v.City) == Low(SpawnPos.City)) then
      dCoords = v.Coords
    end
  end

  -- Spawn the player and start the cutscene
  local SP = SpawnPos.sCoords
  local Offset = vec3((SP[1] - 24.1), (SP[2] + 3.6), SP[3])
  local TxtWelcome = RandomDialog(MSG("Welcome"))
  local TxtAdvice = RandomDialog(MSG("Advice"))
  local TxtTailor = RandomDialog(MSG("Tailor"))
  local TxtGoodbye = RandomDialog(MSG("Goodbye"))
  local rWelcome = TxtWelcome[math.random(#TxtWelcome)]
  local rAdvice  = TxtAdvice[math.random(#TxtAdvice)]
  local rTailor  = TxtTailor[math.random(#TxtTailor)]
  local rGoodbye = TxtGoodbye[math.random(#TxtGoodbye)]
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Sync.SteamID, Sync.CharID } }).Result[1]
  TriggerServerEvent('DokusCore:Core:DBIns:Metabolism', { 'User', 'All', { Sync.SteamID, Sync.CharID, 100.0, 100.0, 100.0 } })
  NetworkGhosting(PedID(), true)
  SetVisible(PedID(), false)
  SetCoords(PedID(), Offset)
  SetFreeze(PedID(), false)
  SetInvincible(PedID(), true)
  SetHeading(PedID(), SpawnPos.Heading)
  RenderCam(false, false, 1, true, true) Wait(100)
  TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
  TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
  DisplayRadar(true) DisplayHud(true)
  TriggerEvent('DokuCore:Spawner:StopMusicPrompt')
  local R = Song[ math.random(#Song) ]
  if (_Spawner.PlaySong) then TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', R.Song, R.Volume) end
  VehicleID = SpawnVehicle('STAGECOACH001X', SP, SpawnPos.Heading)
  DriverID = CreateDriver(PedID(), 'CS_BivCoachDriver', SP)
  SetPedIntoVehicle(DriverID, VehicleID, -1) Wait(500)
  SetPedIntoVehicle(PedID(), VehicleID, 2) Wait(500)
  SetVisible(PedID(), true)
  local InVeh  = GetVehiclePedIsIn
  local GetMod = GetEntityModel(InVeh(PedID()))
  DriveToCoords(DriverID, InVeh(DriverID, false), SpawnPos.eCoords, 10.0, 1.0, GetMod, 67633207, 15.0, false)
  Citizen.InvokeNative(0x971D38760FBC02EF, DriverID, true) Wait(5000)
  UIFadeIn(25000) Cinema(true) Wait(5000)
  NoteObjective(MSG("DriverName").MSG, rWelcome.MSG, 'NPC', Floor(rWelcome.Time * 1000))
  NoteObjective(MSG("DriverName").MSG, rAdvice.MSG, 'NPC', Floor(rAdvice.Time * 1000))
  TriggerEvent('DokusCore:Spawner:Spawn:RandomChatter', true)
  DriveToDestination(SpawnPos.eCoords)
  NoteObjective(MSG("DriverName").MSG, rTailor.MSG, 'NPC', Floor(rTailor.Time * 1000))
  NoteObjective(MSG("DriverName").MSG, rGoodbye.MSG, 'NPC', Floor(rGoodbye.Time * 1000))
  Cinema(false) DisableControls = false

  -- Update DataSync
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Alive',      { true        } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'UserInGame', { true        } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Skin',       { Char.Skin   } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Gender',     { Char.Gender } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'cName',      { Char.cName  } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharMoney',  { Char.Money  } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'CharGold',   { Char.Gold   } })

  -- Update users inventory
  if (_Spawner.GiveStartItems) then
    for k,v in pairs(_Spawner.StartItems) do
      local Item, Amount, Type = string.lower(v.Item), v.Amount, v.Type
      TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', { Sync.SteamID, Sync.CharID, Type, Item, Amount } })
    end
  end


  ShowPrompt = false
  WaitForUserToLeaveVehicle(PedID()) Wait(3000) Cinema(true)

  -- Continue
  TaskVehicleDriveToCoord(DriverID, VehicleID, dCoords, 10.0, 1.0, 'STAGECOACH001X', 67633207, 5.0, false)
  Wait(3000) TriggerEvent('DokusCore:Spawner:Spawn:DeleteVehicle')
  TaskGoToCoordAnyMeans(PedID(), tCoords, 1.0, 0, 0, 786603, 0xbf800000) --Wait(25000)
  WalkUserToTailor()

  -- Set Route back to false so it can be used
  TriggerEvent('DokusCore:Spawner:ResetRoute', { SpawnPos.ID })
  SpawnPos = nil

  -- Continue
  Cinema(false) DisplayHud(true) DisplayRadar(true)
  NetworkGhosting(PedID(), false)

  -- Fade the current playing music
  TriggerEvent('DokusCore:Core:MP:Music:MusicFade')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Spawner:Spawn:RandomChatter', function(Bool)
  Wait(15000) Chatter = Bool
  while Chatter do Wait(1)
    local Talk = RandomDialog(MSG("DriverTalk"))
    local R = Talk[math.random(#Talk)]
    NoteObjective(MSG("DriverName").MSG, R.MSG, 'NPC', Floor(R.Time * 1000))
    local R = math.random(20, 60)
    Wait((R * 1000))
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Spawner:Spawn:DeleteVehicle', function()
  Wait(30000) DeleteVehicle(VehicleID)
  Citizen.InvokeNative(0x971D38760FBC02EF, DriverID, false)
  DeleteEntity(DriverID) DriverID, VehicleID = nil, nil
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  DeleteVehicle(VehicleID) DeleteEntity(DriverID)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- RegisterNetEvent('DokusCore:Spawner:DeathRespawn', function(ID)
--   SetInvincible(ID, true) SetVisible(ID, false) Wait(5000)
--   local PedID = PedID()
--   TriggerEvent('DokusCore:Metabolism:Edit:Hunger', { 50 })
--   TriggerEvent('DokusCore:Metabolism:Edit:Thirst', { 50 })
--   TriggerEvent('DokusCore:Skins:Load:User') Wait(3000)
--   TriggerEvent('DokusCore:Clothing:User:Load:Clothing')
--   TriggerEvent('DokusCore:Metabolism:Edit:Health', { 100.0 })
--   SetInvincible(ID, false) SetVisible(ID, true)
-- end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokuCore:Spawner:StopMusicPrompt', function()
  local Cine = true
  local Playing = true
  ShowPrompt = true
  HidePrompt = false
  ActPrompts()
  while (ShowPrompt) do Wait(0)
    local pName = CreateVarString(10, 'LITERAL_STRING', MSG("Cutscene").MSG)
    PromptSetActiveGroupThisFrame(Group, pName)
    local S = PromptHasHoldModeCompleted(Prompt_Stop)
    local C = Citizen.InvokeNative(0xC92AC953F0A982AE, Prompt_Cinema)
    local O = PromptHasHoldModeCompleted(Prompt_Out)

    if ((S) and (Playing)) then
      Playing = false
      ShowPrompt = true
      HidePrompt = false
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', 'None', 0)
      Notify(MSG("MusicOn").MSG, "TopCenter", Floor(MSG("MusicOn").Time * 1000))
      Wait(1500)
    elseif ((S) and (not (Playing))) then
      Playing = true
      ShowPrompt = true
      HidePrompt = false
      local R = Song[ math.random(#Song) ]
      TriggerEvent('DokusCore:Core:MP:Music:PlayOnUser', R.Song, R.Volume)
      Notify(MSG("MusicOff").MSG, "TopCenter", Floor(MSG("MusicOff").Time * 1000))
      Wait(1500)
    end

    if (O) then
      NoteNPCTalk(MSG("DriverName").MSG, MSG("ErrStepOut").MSG, false, Floor(MSG("ErrStepOut").Time * 1000))
    end

    if (C) then
      Cine = not Cine
      Citizen.InvokeNative(0xCE7A90B160F75046, Cine)
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
