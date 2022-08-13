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
        if ((Dist <= v.Radius[4]) and not (CloseNPC)) then InShopRange() end
        if ((Dist > v.Radius[4]) and (CloseNPC)) then OutShopRange() end
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
  local Data = Decoded(Boat.Meta)
  local CanBuy, Price = Data.CanBuy, Data.BuyPrice
  if (Low(CanBuy) == 'false') then NoteNPCTalk(Dialog.NPCName, "I'am sorry, I'am currently not able to sell this boat", 5000) return end
  local Char = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { SteamID, CharID } }).Result[1]
  local Money = TN(Char.Money)

  -- Check if user has enough money
  if (Money < Price) then NoteNPCTalk(Dialog.NPCName, "You do not have enough money to buy this boat!", 5000) return end

  -- Continue if the user has enoug money
  for i,p in pairs(_Boats.NPCs) do
    for k,v in pairs(p) do
      if (Low(Loc) == Low(p.ID)) then
        TriggerServerEvent('DokusCore:Core:DBSet:Characters', { 'Money', { SteamID, CharID, TN(Money - Price) }})
        TriggerServerEvent('DokusCore:Core:DBIns:Boats', { 'User', 'Single', { SteamID, CharID, Boat.Item, Boat.Name, Loc, Loc, Encoded(p.SpawnPos.Coords) }})
        NoteNPCTalk(Dialog.NPCName, "You've bought yourself a boat, that is awesome!", 5000)
        NoteNPCTalk(Dialog.NPCName, "Here are the peddles. I wish you sooo much fun!", 5000)
        return -- Stop the loop as it loops more then once
      end
    end
  end

end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Boats:Sell', function(Boat)
  local Data = Decoded(Boat.Meta)
  local CanSell, Price = Data.CanSell, Data.SellPrice
  local Boats = TSC('DokusCore:Core:DBGet:Boats', { 'User', 'All', { SteamID } })
  local Result, BoatID = Boats.Result, Boats.BID

  -- Stop user is this boat can not be sold.
  if (Low(CanSell) == 'false') then NoteNPCTalk(Dialog.NPCName, "I'am sorry, I'am currently not able to buy this boat", 5000) return end

  -- Check if the user has this boat.
  for k, v in pairs(Result) do
    if (Low(v.BID) == (Low(BoatID))) then
      
    end
  end

  
  if not GetUserBoats() then NoteNPCTalk(Dialog.NPCName, "I'am sorry, I can't buy a boat that's not in your name", 5000) print("B") return end
  print("Sell")
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

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
