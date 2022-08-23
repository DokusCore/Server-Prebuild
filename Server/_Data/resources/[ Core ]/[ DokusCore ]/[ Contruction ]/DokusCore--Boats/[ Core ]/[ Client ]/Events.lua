--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:CheckDistStore', function()
  while InArea do Wait(1)
    for k,v in pairs(_Boats.NPCs) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nil) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius[2]) and (InRange)) then SetOutRange() end
        if ((Dist <= v.Radius[2]) and not (InRange)) then SetInRange() end
      end
    end
  end Wait(2500)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:CheckDistNPC', function()
  while InRange do Wait(1)
    for k,v in pairs(_Boats.NPCs) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist > v.Radius[3]) and (NearNPC)) then SetFarNPC() end
        if ((Dist <= v.Radius[3]) and not (NearNPC)) then SetNearNPC() end
      end
    end
  end Wait(1500)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:CheckCloseNPC', function()
  while NearNPC do Wait(500)
    for k,v in pairs(_Boats.NPCs) do
      local Dist = GetDistance(v.Coords)
      if ((Loc ~= nill) and (Low(v.ID) == Low(Loc))) then
        if ((Dist <= v.Radius[4]) and not (CloseNPC) and (Ready)) then InShopRange() end
        if ((Dist > v.Radius[4]) and (CloseNPC) and (Ready)) then OutShopRange() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:ShowPrompts', function()
  ActPrompts()
  if (_Boats.AutoOpenMenu) then
    StoreInUse = true
    TriggerEvent('DokusCore:Boats:OpenMenu')
    TriggerEvent('DokusCore:Stores:BackSpace')
  else
    while ((ShowPrompts) and not (StoreInUse)) do Wait(1)
      local pName = CreateVarString(10, 'LITERAL_STRING', Dialog.NPCName)
      PromptSetActiveGroupThisFrame(Group, pName)
      local M = PromptHasHoldModeCompleted(Prompt_Menu)
      if ((M) and not (StoreInUse)) then
        StoreInUse = true
        TriggerEvent('DokusCore:Boats:OpenMenu')
        TriggerEvent('DokusCore:Stores:BackSpace')
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:Buy', function(Boat)
  -- Anti glitch.
  PauseScript = true
  MenuPaused = true

  -- Variables
  local Meta = Decoded(Boat.Meta)
  local CanBuy, Price = Meta.CanBuy, Meta.BuyPrice
  if (Low(CanBuy) == 'false') then NoteNPCTalk(Dialog.NPCName, "I'am sorry, I'am currently not able to sell this boat", true, 5000) PauseScript, MenuPaused = false, false return end
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
  local Money = TN(Char.Money)

  -- Check if user has enough money
  if (Money < Price) then NoteNPCTalk(Dialog.NPCName, "You do not have enough money to buy this boat!", true, 5000) PauseScript, MenuPaused = false, false  return end

  -- Check if the user already has this boat.

  -- Continue if the user has enoug money
  for i,p in pairs(_Boats.NPCs) do
    for k,v in pairs(p) do
      if (Low(Loc) == Low(p.ID)) then
        -- Let the user create a name for the boat.
        TextEntry('Boat Name', 'Client', 'DokusCore:Boats:SetBoatName', nil)
        TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Money', { SteamID, CharID, TN(Money - Price) }})
        TriggerServerEvent('DokusCore:Core:DBIns:Boats', { 'User', 'Single', { SteamID, CharID, Boat.Item, UserBoatName, Loc, Loc, Encoded(p.SpawnPos.Coords) }})
        NoteNPCTalk(Dialog.NPCName, "You've bought yourself a boat, that is awesome!", true, 5000)
        NoteNPCTalk(Dialog.NPCName, "Here are the peddles. I wish you sooo much fun!", true, 5000)
        PauseScript = false
        MenuPaused = false
        return -- Stop the loop as it loops more then once
      end
    end
  end

  -- Reset Ani glitch
  PauseScript = false
  MenuPaused = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:Sell', function(Boat)
  -- Anti glitch.
  PauseScript = true
  MenuPaused  = true

  -- Variables
  local Name, BID, Hanger, ID, Price = Boat.Name, Boat.BID, Boat.Hanger, Boat.ID, nil

  -- Set the price for the selling boat
  for k,v in pairs(BoatArr) do
    local Dec = Decoded(v.Meta)
    if (Low(v.Item) == Low(BID)) then
      Price = TN(Dec.SellPrice)
    end
  end

  for k,v in pairs(UserBoats) do
    if (Low(Loc) == (Low(Hanger))) then
      if (TN(v.ID) == TN(ID)) then
        table.remove(UserBoats, k)
        local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
        local Money = TN(Char.Money)
        TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Money', { SteamID, CharID, TN(Money + Price) }})
        TriggerServerEvent('DokusCore:Core:DBDel:Boats', { 'User', 'Single', 'Name', { v.Name } })
        NoteNPCTalk(Dialog.NPCName, "You've sold your boat, that is awesome!", true, 5000)
        NoteNPCTalk(Dialog.NPCName, "Here is your money, I hope you had fun!", true, 5000)
        PauseScript = false
        MenuPaused  = false
      end
    else
      NoteNPCTalk(Dialog.NPCName, "You've not stored this boat in this hangar!", true, 5000)
      PauseScript = false
      MenuPaused  = false
    end
  end

  PauseScript = false
  MenuPaused  = false
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:SetBoatName', function(Name) UserBoatName = Name.Result end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(Name)
  if (GetCurrentResourceName() ~= Name) then return end
  for k,v in pairs(NPCs) do DeleteEntity(v) end
  for k,v in pairs(Blips) do RemoveBlip(v) end
  Prompt_Menu, Group = nil, GetRandomIntInRange(0, 0xffffff)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
