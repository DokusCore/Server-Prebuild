--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('ShowInStock', function()
  NoteObjective('Stock', "The stock will be added in a later version!", 'Horn', 5000);
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('RentOutHorse', function(Data)
  NoteObjective("System", "This function is in development!", 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('AskForBasicCare', function(Data)
  NoteObjective("System", "This function is in development!", 'Horn', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('DoBasicNeeds', function(Data)
  NoteObjective("System", "This function is in development!", 'Horn', 5000)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TrainMyHorse', function(Data)
  NoteObjective("System", "This function is in development!", 'Horn', 5000)
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
    if (Low(Loc) == (Low(v.ID))) then
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
    if (Low(Loc) == (Low(v.ID))) then
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
    NoteNPCTalk(Dialog.NPCName, "You've not enough money to buy this horse I am afraid!", true, 5000)
    -- TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    SetNuiFocus(false, false)
    SendNUIMessage({ Action = 'Hide' })
    local Index = { Model = Model, Price = Price, Money = Money }
    TextEntry('Name your horse', 'Client', 'DokusCore:Stables:BuyHorse', Index)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TakeOutHorse', function(Data)
  ExitMenu()
  local NPCTakesHorse = false
  local Name = Data.Name
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'Name', { Sync.SteamID, Sync.CharID, Name } } }
  local Horse = TSC('DokusCore:Core:DBGet:Stables', Index).Result[1]
  local xName, xModel = Horse.Name, Horse.Model

  -- Check if the NPC will take the horse or not
  for k,v in pairs(_Stables.NPCs) do
    if (Low(Loc) == (Low(v.ID))) then
      NPCTakesHorse = v.NPCTakesHorse
    end
  end

  -- Spawn the horse
  local ID, Coords, Heading = nil, nil, nil
  for k,v in pairs(_Stables.HorseSpawn) do
    if (Low(Loc) == (Low(v.ID))) then
      ID, Coords, Heading = v.ID, v.Coords, v.Heading
      WaitLoadModel(xModel)
      MyActiveHorse = CreatePed(xModel, Coords, Heading, false, 0)
      Citizen.InvokeNative(0x283978A15512B2FE, MyActiveHorse, true)
      Citizen.InvokeNative(0x58A850EAEE20FAA3, MyActiveHorse)
      Citizen.InvokeNative(0xB8B6430EAD2D2437, MyActiveHorse, GetHashKey("PLAYER_HORSE"))
      Citizen.InvokeNative(0x4DB9D03AC4E1FA84, MyActiveHorse, -1, -1, 0)
      SetVehicleHasBeenOwnedByPlayer(MyActiveHorse, true)
    end
  end

  if (not (NPCTakesHorse)) then
    NoteNPCTalk(Dialog.NPCName, "You're horse is ready at his stable!", true, 5000)
    ExitMenu()
    ShowPrompts = true
    TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    -- Walk the NPC to the horse
    SetFreeze(UseThisNPC, false)
    NoteNPCTalk(Dialog.NPCName, "Sure thing, one moment let me get your horse!", false, 5000)
    TaskGoToCoordAnyMeans(UseThisNPC, Coords, 1.5, 0, 0, 786603, 0xbf800000)

    -- Wait for the NPC to reach the horse
    WaitToTakeTheHorse(Coords) Wait(3000)

    -- Mount the NPC on the horse.
    for x, c in pairs(_Stables.HorseSpawn) do
      if (Low(Loc) == (Low(c.ID))) then
        TaskMountAnimal(UseThisNPC, MyActiveHorse, 15000, -1, 1.0, 1, 0, 0)
        Wait(4000)
      end
    end

    -- Let the NPC drive back to the player
    TaskGoToEntity(UseThisNPC, PedID(), -1, 2.0, 1.5, 0, 0)
    WaitToReturnToPlayer(UseThisNPC) Wait(2000)
    Citizen.InvokeNative(0x5337B721C51883A9, UseThisNPC, 1, 1)
    NoteNPCTalk(Dialog.NPCName, "Here you go sir, as healthy as it ever was!", false, 5000)

    -- Let the NPC walk back to its starting position
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Loc) == (Low(v.ID))) then
        TaskGoToCoordAnyMeans(UseThisNPC, v.Coords, 1.5, 0, 0, 786603, 0xbf800000)
        WaitForNPCToReturn(v.Coords) Wait(3000)
        SetPedDesiredHeading(UseThisNPC, v.Heading)
        ExitMenu()
        ResetPrompts()
        NearNPC, StoreInUse = true, false
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
