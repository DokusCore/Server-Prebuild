--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:SayHello', function(Data)
  if (not (AtStable)) then
    AtStable = true
    Loc = Low(Data.City)
    SetNPCToUse()
    SetHorseDecoys()
    for k,v in pairs(_Stables.Dialogs) do
      if (v.Welcome) then
        local Txt = RandomDialog(PedID(), Dialog.EnterStore)
        local Random = Txt[math.random(#Txt)]
        NoteNPCTalk(Dialog.NPCName, Random.Msg, true, (Random.Time * 1000))
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Stables:SayGoodbye', function(Meta)
  if (AtStable) then
    AtStable = false
    UseThisNPC = nil
    DelHorseDecoys()
    for k,v in pairs(_Stables.Dialogs) do
      if (v.Welcome) then
        local Txt = RandomDialog(PedID(), Dialog.ExitStore)
        local Random = Txt[math.random(#Txt)]
        NoteNPCTalk(Dialog.NPCName, Random.Msg, true, (Random.Time * 1000))
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
    if (Low(Loc) == (Low(v.Stabled))) then
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
  local Model, Price = Data.Data.Model, Data.Data.Price
  local Name, Money = Data.Result, Data.Data.Money
  NoteObjective("Success", "You've named your horse: "..Name, "Check", 5000)
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
  NoteNPCTalk(Dialog.NPCName, "Your horse is now ready! It was a pleasure doing business with you.", true, 5000)
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
    if (Low(Loc) == (Low(v.ID))) then
      NPCTakesHorse = v.NPCTakesHorse
    end
  end

  if (not (NPCTakesHorse)) then
    DeleteEntity(MyActiveHorse) MyActiveHorse = nil
    NoteNPCTalk(Dialog.NPCName, "Your horse is stored, we will take great care of it!", true, 5000)
    ExitMenu() ShowPrompts = true
    TriggerEvent('DokusCore:Stables:ShowPrompts')
  else
    SetFreeze(UseThisNPC, false)
    TaskMountAnimal(UseThisNPC, MyActiveHorse, 20000, -1, 1.0, 1, 0, 0)
    while (not (IsPedOnMount(UseThisNPC))) do Wait(500) end

    for k,v in pairs(_Stables.HorseDrop) do
      if (Low(Loc) == (Low(v.ID))) then
        TaskGoStraightToCoord(UseThisNPC, v.Coords, 1.5, 10000, 1, 1, 1)
        WaitToStoreTheHorse(v.Coords)
        Citizen.InvokeNative(0x5337B721C51883A9, UseThisNPC, 1, 1)
      end
    end

    -- Let the NPC walk back to its starting position
    for k,v in pairs(_Stables.NPCs) do
      if (Low(Loc) == (Low(v.ID))) then
        TaskGoToCoordAnyMeans(UseThisNPC, v.Coords, 1.5, 0, 0, 786603, 0xbf800000)
        WaitForNPCToReturn(v.Coords) Wait(3000)
        DeleteEntity(MyActiveHorse) MyActiveHorse = nil
        SetPedDesiredHeading(UseThisNPC, v.Heading)
        ExitMenu()
        ResetPrompts()
        NearNPC, StoreInUse = true, false
        ShowPrompts = true
        TriggerEvent('DokusCore:Stables:ShowPrompts')
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
  if (MyActiveHorse ~= nil) then DeleteEntity(MyActiveHorse) end
  if (IsHorseLoaded()) then DeleteEntity(HorseLoaded) end
  RenderScriptCams(false, false, 1, true, true)
  if (PlayerCam ~= nil) then SetCamActive(PlayerCam, false) DestroyCam(PlayerCam) end
  if (StableCam ~= nil) then SetCamActive(StableCam, false) DestroyCam(StableCam) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
