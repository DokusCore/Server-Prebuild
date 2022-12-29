--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:SayHello', function(Data)
  if (not (AtStable)) then
    AtStable = true
    Loc = Low(Data.City)

    -- Spawn the NPC
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Area()) == Low(v.ID)) then
        Tabi(NPCs, { City = v.ID, NPC = SpawnNPC(v.Hash, v.Coords, v.Heading) })
      end
    end

    SetNPCToUse()
    SetHorseDecoys()

    -- Send hello message
    for k,v in pairs(_Stables.Dialogs) do
      if (v.Welcome) then
        local Txt = RandomDialog(MSG("EnterStore"))
        local Random = Txt[math.random(#Txt)]
        NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:SayGoodbye', function(Meta)
  if (AtStable) then
    while (NPCFetchingHorse) do Wait(1000) end
    
    for k,v in pairs(_Stables.Dialogs) do
      if (v.Welcome) then
        local Txt = RandomDialog(MSG("ExitStore"))
        local Random =w Txt[math.random(#Txt)]
        NoteNPCTalk(MSG("NPCName").MSG, Random.MSG, true, Floor(Random.Time * 1000))
      end
    end

    -- Remove the NPC from the area
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Area()) == Low(v.ID)) then
        DelHorseDecoys()
        ResetPrompts()
        DeleteEntity(NPCs[k].NPC)
        table.remove(NPCs, k)
        UseThisNPC = nil
        AtStable = false
        StoreInUse = false
        ShowPrompts = false
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Start', function(Data)
  local Zones = TSC('DokusCore:Core:DBGet:Zones', { 'All', 'Type', { 'NPC' } })
  for k,v in pairs(Zones.Result) do
    if (Low(v.City) == (Low(Data.City))) then
      Loc = Low(Data.City)
      ShowPrompts = true
      TriggerEvent('DokusCore:Stables:ShowPrompts')
      break
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:Stop', function(Meta) ResetPrompts() end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:OpenMenu', function()
  CreateCamera()
  SetNuiFocus(true, true)
  local Horses = {}
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'User', 'Single', { 'Horse', 'All', { Sync.SteamID, Sync.CharID } } }
  local User = TSC('DokusCore:Core:DBGet:Stables', Index)

  -- For each horse insert into table.
  for k,v in pairs(User.Result) do
    if (Low(Area()) == (Low(v.Stabled))) then
      Tabi(Horses, v)
    end
  end

  SendNUIMessage({ Customize = false })
  SendNUIMessage({ Action = "Show" })
  SendNUIMessage({ Action = "Store", DataShop = getShopData() })
  SendNUIMessage({ DataHorse = Horses }) Wait(100)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:BuyHorse', function(Data)
  if (not (Data.Result)) then ErrorMsg("NoHorseName") return end
  local Model, Price = Data.Data.Model, Data.Data.Price
  local Name, Money = Data.Result, Data.Data.Money
  if ((#Name == 0) or (Name == '')) then ErrorMsg("NoHorseName") return end
  NoteObjective("Success", MSG("HorseNamed").MSG .. Name, "Check", Floor(MSG("HorseNamed").Time * 1000))
  ExitMenu()
  local Payment = TN( Money - Price )
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { 'Payment', { Sync.SteamID, Sync.CharID, Payment } }
  TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)

  local Index = {
    Sync.SteamID, Sync.CharID, 'Horse', Loc, Name, false, true,
    Model, nil, nil, 100, 100, 100, 100, 100, TN(Round((Price / 2), 2))
  }

  TriggerServerEvent('DokusCore:Core:DBIns:Stables', { 'Horse', Index })
  NoteNPCTalk(MSG("NPCName").MSG, MSG("HorseBought").MSG, true, Floor(MSG("HorseBought").Time * 1000))
  StoreInUse = false
  ShowPrompts = true
  TriggerEvent('DokusCore:Stables:ShowPrompts')
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:StoreHorse', function()
  local NPCTakesHorse = false

  -- Check if the NPC will take the horse or not
  for k,v in pairs(_Stables.NPCs) do
    if (Low(Area()) == (Low(v.ID))) then
      NPCTakesHorse = v.NPCTakesHorse
    end
  end

  if (not (NPCTakesHorse)) then
    DeleteEntity(MyActiveHorse) MyActiveHorse = nil
    NoteNPCTalk(MSG("NPCName").MSG, MSG("HorseStored").MSG, true, Floor(MSG("HorseStored").Time * 1000))
    ExitMenu() ShowPrompts = true
    TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    NPCFetchingHorse = true
    SetFreeze(UseThisNPC, false)
    TaskMountAnimal(UseThisNPC, MyActiveHorse, 20000, -1, 1.0, 1, 0, 0)
    while (not (IsPedOnMount(UseThisNPC))) do Wait(500) end

    for k,v in pairs(_Stables.HorseDrop) do
      if (Low(Area()) == (Low(v.ID))) then
        TaskGoStraightToCoord(UseThisNPC, v.Coords, 1.5, 10000, 1, 1, 1)
        WaitToStoreTheHorse(v.Coords)
        Citizen.InvokeNative(0x5337B721C51883A9, UseThisNPC, 1, 1)
      end
    end

    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, false }
    TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'InUse', Index })
    local Index = { Sync.SteamID, Sync.CharID, Sync.HorseName, true }
    TriggerServerEvent('DokusCore:Core:DBSet:Stables', { 'User', 'Single', 'IsStored', Index })

    -- Let the NPC walk back to its starting position
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Area()) == (Low(v.ID))) then
        TaskGoToCoordAnyMeans(UseThisNPC, v.Coords, 1.5, 0, 0, 786603, 0xbf800000)
        WaitForNPCToReturn(v.Coords) Wait(3000)
        DeleteEntity(MyActiveHorse) MyActiveHorse = nil
        SetPedDesiredHeading(UseThisNPC, v.Heading)
        ExitMenu()
        ResetPrompts()
        NearNPC, StoreInUse = true, false
        ShowPrompts = true
        TriggerEvent('DokusCore:Stables:ShowPrompts')
        NPCFetchingHorse = false
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(NPCs) do DeleteEntity(v.NPC) end
  for k,v in pairs(Blips) do RemoveBlip(v) end
  for k,v in pairs(HorseDecoys) do DeleteEntity(v) end
  RenderScriptCams(false, false, 1, true, true)
  if (IsFollowing) then ClearPedTasksImmediately(MyActiveHorse) end
  if (PlayerCam ~= nil) then SetCamActive(PlayerCam, false) DestroyCam(PlayerCam) end
  if (StableCam ~= nil) then SetCamActive(StableCam, false) DestroyCam(StableCam) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
