--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:Object:Interact:Campfire', function()
  local ID, Item, Coords, Meta = nil, nil, nil, nil
  local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables

  for k,v in pairs(NearObjData) do
    if (Low(k) == 'id') then ID = v end
    if (Low(k) == 'item') then Item = v end
    if (Low(k) == 'coords') then Coords = v end
    if (Low(k) == 'meta') then Meta = Decoded(v) end
  end

  for k,v in pairs(Obj) do
    if (Low(v.Item) == Low(Item)) then
      if (v.ID == ID) then
        local Meta = Decoded(v.Meta)
        if (Meta.InUse) then ErrorMsg('ObjInUse') return end
        if (not (Meta.InUse)) then
          TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { ID } })
          local Meta = { Active = Meta.Active, InUse = true, Expire = Meta.Expire, Time = Meta.Time }
          local Encode = Encoded(Meta)
          local Index = { ID, Item, Coords, Encode }
          TriggerServerEvent('DokusCore:Sync:Set:ObjectData', { 'Interactable', Index })
          Wait(100) TriggerEvent('DokusCore:UsableItems:Object:Campfire:OpenMenu', ID, Item, Coords, Meta)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:Object:Campfire:OpenMenu', function(ID, Item, Coords, Meta)
  ShowMenu = true
  ShowObjPrompts = true

  if (not (ObjMenuOpen)) then
    ResetPrompts()
    ObjMenuOpen = 'Main'
    ActObjectPrompts(ObjMenuOpen)
  end

  -- While the main menu is open
  while (ShowMenu) do Wait(1)
    while (ShowObjPrompts) do Wait(1)
      while (ObjMenuOpen == 'Main') do Wait(1)
        local pName = CreateVarString(10, 'LITERAL_STRING', 'Campfire')
        PromptSetActiveGroupThisFrame(Group, pName)
        local FuelMenu = PromptHasHoldModeCompleted(Campfire_AddFuel)
        local Des = PromptHasHoldModeCompleted(Campfire_Destroy)
        local Exit = PromptHasHoldModeCompleted(Prompt_Exit)

        if (FuelMenu) then
          ResetPrompts()
          ObjMenuOpen = 'FuelMenu'
          ActObjectPrompts(ObjMenuOpen)
        end

        if (Des) then
          ShowObjPrompts = false
          TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { ID } })
          DeleteEntity(ID)
          TriggerServerEvent('DokusCore:Core:DBDel:Objects', { 'ItemID', { ID } })
          IntObjects = {}
          NearObjData = {}
          ObjInUse          = false
          IsPlacing         = false
          IsNearObject      = false
          ObjID, ObjPos     = nil, nil
          ShowObjPrompts       = false
          Campfire_Destroy  = nil
          Group             = GetRandomIntInRange(0, 0xffffff)
          SyncIntObj()
        end

        if (Exit) then
          TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { ID } })
          local Meta = { Active = Meta.Active, InUse = false, Expire = Meta.Expire, Time = Meta.Time }
          local Encode = Encoded(Meta)
          local Index = { ID, Item, Coords, Encode }
          TriggerServerEvent('DokusCore:Sync:Set:ObjectData', { 'Interactable', Index })

          ShowObjPrompts       = false
          IntObjects        = {}
          NearObjData       = {}
          ObjInUse          = false
          IsPlacing         = false
          IsNearObject      = false
          ObjID, ObjPos     = nil, nil
          ShowObjPrompts       = false
          ResetPrompts()
          SyncIntObj()
        end
      end

      while (ObjMenuOpen == 'FuelMenu') do Wait(1)
        local pName = CreateVarString(10, 'LITERAL_STRING', 'Campfire')
        PromptSetActiveGroupThisFrame(Group, pName)
        local Lumber = PromptHasHoldModeCompleted(Campfire_Fuel_Lumber)
        local Logs = PromptHasHoldModeCompleted(Campfire_Fuel_Logs)
        local Bark = PromptHasHoldModeCompleted(Campfire_Fuel_Bark)
        local Back = PromptHasHoldModeCompleted(Campfire_Fuel_Back)

        if (Lumber) then NREntry('Amount', 'Client', 'DokusCore:UsableItems:Object:Campfire:AddFuel', { Item = 'Lumber', ID = ID }) end
        if (Logs)   then NREntry('Amount', 'Client', 'DokusCore:UsableItems:Object:Campfire:AddFuel', { Item = 'Log', ID = ID }) end
        if (Bark)   then NREntry('Amount', 'Client', 'DokusCore:UsableItems:Object:Campfire:AddFuel', { Item = 'Bark', ID = ID }) end

        if (Back) then
          ResetPrompts()
          ObjMenuOpen = 'Main'
          ActObjectPrompts(ObjMenuOpen)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:UsableItems:Object:Campfire:AddFuel', function(Data)
  ObjMenuOpen = nil
  ShowObjPrompts = false
  local Amount, Item, ID = TN(Data.Result), Low(Data.Data.Item), TN(Data.Data.ID)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { Sync.SteamID, Sync.CharID, Item }
  local Inv  = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
  if (not (Inv.Exist)) then ErrorMsg('NotEnoughFuel') return end
  if (Inv.Result[1].Amount < Amount) then ErrorMsg('NotEnoughFuel') return end

  ClearPedTasks(PedID())
  local AniData = Inter['Campfire'].Fuel[TS(Data.Data.Item)].Anim
  local Anim = _UsableItems.Animations[AniData[1]]
  TaskStartScenarioInPlace(PedID(), GetHashKey(Anim), AniData[2], true, false, false, false) Wait(AniData[2])
  local Index = { Sync.SteamID, Sync.CharID, Data.Data.Item, Amount, Inv.Result[1].Amount }
  TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'RemoveItem', Index })

  local Obj = TSC('DokusCore:Sync:Get:ObjectData').Interactables
  for k,v in pairs(Inter) do
    if (Low(k) == 'campfire') then
      for i,p in pairs(Obj) do
        if (p.ID == ID) then
          TriggerServerEvent('DokusCore:Sync:Del:ObjectData', { 'Interactable', { ID } })
          local Dec = Decoded(p.Meta)
          local Unix = TSC('DokusCore:Core:System:GetUnix')
          local Extention = Inter['Campfire'].Fuel[Data.Data.Item].Time
          local Expire = (Dec.Expire + ((Extention * Amount) * 60))
          local Meta = { Active = Dec.Active, InUse = Dec.InUse, Expire = Expire }
          local Encode = Encoded(Meta)
          local Index = { ID, Item, Coords, Encode }
          NearObjData.Meta = Encode
          TriggerServerEvent('DokusCore:Sync:Set:ObjectData', { 'Interactable', Index })
          TriggerServerEvent('DokusCore:Core:DBSet:Objects', { 'Unix', { ID, Expire } })
          NoteObjective('Campfire', Data.Data.Item .. " added, fire time extended by " .. ((Extention * Amount)) .. " Minutes", 'Check', 5000)
        end
      end
    end
  end

  ObjMenuOpen = 'FuelMenu'
  ShowObjPrompts = true
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
