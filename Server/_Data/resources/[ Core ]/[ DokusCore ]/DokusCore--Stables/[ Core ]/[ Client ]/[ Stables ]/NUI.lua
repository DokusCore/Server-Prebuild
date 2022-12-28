--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ShowInStock', function()
  NoteObjective("System", SYS("InDevelopment").MSG, Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('RentOutHorse', function(Data)
  NoteObjective("System", SYS("InDevelopment").MSG, Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('AskForBasicCare', function(Data)
  NoteObjective("System", SYS("InDevelopment").MSG, 'Horn', Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DoBasicNeeds', function(Data)
  NoteObjective("System", SYS("InDevelopment").MSG, 'Horn', Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TrainMyHorse', function(Data)
  NoteObjective("System", SYS("InDevelopment").MSG, 'Horn', Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('BreedMyHorse', function(Data)
  NoteObjective("System", SYS("InDevelopment").MSG, 'Horn', Floor(SYS("InDevelopment").Time * 1000))
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('RescueMyHorse', function(Data)
  NoteObjective("System", 'Your horse is now set inactive', 'Horn', 5000)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  DeleteEntity(Sync.HorseID) MyActiveHorse = nil
  local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, false }
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'InUse', Index })
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'IsStored', Index })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseActive', { false } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseID', { nil } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseName', { nil } })
  NoteNPCTalk(MSG("NPCName").MSG, "We're going to search for your horse, this could take some time", false, 7000)
  Wait((1 * 60) * 1000)
  NoteObjective("System", 'Your horse is rescued and back at the stable', 'Horn', 10000)
  local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, false }
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'InUse', Index })
  local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, true }
  TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'IsStored', Index })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("CloseStable", function()
  ExitMenu()
  ShowPrompts = true
  TriggerEvent('DokusCore:Stables:ShowPrompts')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("loadHorse", function(Data)
  local Model = Data.Model
  if (HorseLoaded == Model) then return end
  local Hash = GetHashKey(Model)
  WaitLoadModel(Model)

  for k,v in pairs(_Stables.HorsePos) do
    if (Low(Area()) == (Low(v.ID))) then
      if (IsHorseLoaded()) then DeleteEntity(HorseLoaded) end
      HorseLoaded = CreatePed(Model, v.Coords[1], v.Coords[2], (v.Coords[3] - 0.98), v.Heading, false, 0)
      Citizen.InvokeNative(0x283978A15512B2FE, HorseLoaded, true)
      Citizen.InvokeNative(0x58A850EAEE20FAA3, HorseLoaded)
      SetVehicleHasBeenOwnedByPlayer(HorseLoaded, true)
      break
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("SelectHorse", function(Data)
  local Model = nil
  local ID, Name = Data.ID, Data.Name
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'All', { Sync.SteamID, Sync.CharID } } }
  local Horse = TSC('DokusCore:Core:DBGet:Stables', Index)

  -- Check the users horse, load / save the model
  for k,v in pairs(Horse.Result) do
    if (Low(v.Name) == (Low(Name))) then
      if (HorseLoaded == v.Model) then return end
      WaitLoadModel(v.Model)
      Model = v.Model
    end
  end

  -- Get the position that the horse needs to be displayed
  for k,v in pairs(_Stables.HorsePos) do
    if (Low(Area()) == (Low(v.ID))) then
      if (IsHorseLoaded()) then DeleteEntity(HorseLoaded) end
      local NewHorse = SpawnHorse(Model, v.Coords, v.Heading)
      HorseLoaded = NewHorse
      -- SendNUIMessage({ Customize = true })
      break
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback("BuyHorse", function(Data)
  local Model, Price = Data.Model, Data.Price
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { Sync.SteamID, Sync.CharID } }
  local User = TSC('DokusCore:Core:DBGet:Characters', Index)
  local Money = User.Result[1].Money

  if (Price > Money) then
    NoteNPCTalk(MSG("NPCName").MSG, MSG("NoMoney").MSG, true, Floor(MSG("NoMoney").Time * 1000))
    -- TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    SetNuiFocus(false, false)
    SendNUIMessage({ Action = 'Hide' })
    local Index = { Model = Model, Price = Price, Money = Money }
    TextEntry(MSG("NameHorse").MSG, 'Client', 'DokusCore:Stables:BuyHorse', Index)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TakeOutHorse', function(Data)
  local NPCTakesHorse = false
  local Name = Data.Name
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'Name', { Sync.SteamID, Sync.CharID, Name } } }
  local Horse = TSC('DokusCore:Core:DBGet:Stables', Index).Result[1]
  local xName, xModel = Horse.Name, Horse.Model

  -- Cancel if horse is already in use.
  if (not (Horse.IsStored) or (Horse.IsStored == 0)) then
    if ((Horse.InUse) or (Horse.InUse == 1)) then
      NoteNPCTalk(MSG('NPCName').MSG, 'Your horse is already in use!', false, 5000)
      return
    end
  end

  ExitMenu()


  -- Check if the NPC will take the horse or not
  for k,v in pairs(_Stables.NPCs) do
    if (Low(Area()) == (Low(v.ID))) then
      NPCTakesHorse = v.NPCTakesHorse
    end
  end

  -- Spawn the horse
  local ID, Coords, Heading = nil, nil, nil
  for k,v in pairs(_Stables.HorseSpawn) do
    if (Low(Area()) == (Low(v.ID))) then
      ID, Coords, Heading = v.ID, v.Coords, v.Heading
      WaitLoadModel(xModel)
      MyActiveHorse = CreatePed(xModel, Coords, Heading, true, 0)
      TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseID', { MyActiveHorse } })
      TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseName', { xName } })
      TriggerEvent('DokusCore:Sync:Set:UserData', { 'HorseActive', { true } })
      Citizen.InvokeNative(0x283978A15512B2FE, MyActiveHorse, true)
      Citizen.InvokeNative(0x58A850EAEE20FAA3, MyActiveHorse)
      Citizen.InvokeNative(0xB8B6430EAD2D2437, MyActiveHorse, GetHashKey("PLAYER_HORSE"))
      Citizen.InvokeNative(0x4DB9D03AC4E1FA84, MyActiveHorse, -1, -1, 0)
      SetVehicleHasBeenOwnedByPlayer(MyActiveHorse, true)
      local Index = { Sync.SteamID, Sync.CharID, xName, true }
      TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'InUse', Index })
      local Index = { Sync.SteamID, Sync.CharID, xName, false }
      TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'IsStored', Index })
    end
  end

  if (not (NPCTakesHorse)) then
    NoteNPCTalk(MSG("NPCName").MSG, MSG("HorseReady").MSG, true, Floor(MSG("HorseReady").Time * 1000))
    ExitMenu()
    ShowPrompts = true
    TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    -- Walk the NPC to the horse
    NPCFetchingHorse = true
    SetFreeze(UseThisNPC, false)
    NoteNPCTalk(MSG("NPCName").MSG, MSG("FetchHorse").MSG, false, Floor(MSG("FetchHorse").Time * 1000))
    TaskGoToCoordAnyMeans(UseThisNPC, Coords, 1.5, 0, 0, 786603, 0xbf800000)

    -- Wait for the NPC to reach the horse
    WaitToTakeTheHorse(Coords) Wait(3000)

    -- Mount the NPC on the horse.
    for x, c in pairs(_Stables.HorseSpawn) do
      if (Low(Area()) == (Low(c.ID))) then
        TaskMountAnimal(UseThisNPC, MyActiveHorse, 15000, -1, 1.0, 1, 0, 0)
        Wait(4000)
      end
    end

    -- Let the NPC drive back to the player
    TaskGoToEntity(UseThisNPC, PedID(), -1, 2.0, 1.5, 0, 0)
    WaitToReturnToPlayer(UseThisNPC) Wait(2000)
    Citizen.InvokeNative(0x5337B721C51883A9, UseThisNPC, 1, 1)
    NoteNPCTalk(MSG("NPCName").MSG, MSG("HorseFetched").MSG, false, Floor(MSG("HorseFetched").Time * 1000))

    -- Let the NPC walk back to its starting position
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Area()) == (Low(v.ID))) then
        TaskGoToCoordAnyMeans(UseThisNPC, v.Coords, 1.5, 0, 0, 786603, 0xbf800000)
        WaitForNPCToReturn(v.Coords) Wait(3000)
        SetPedDesiredHeading(UseThisNPC, v.Heading)
        ExitMenu()
        ResetPrompts()
        NearNPC, StoreInUse = true, false
        NPCFetchingHorse = false
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
