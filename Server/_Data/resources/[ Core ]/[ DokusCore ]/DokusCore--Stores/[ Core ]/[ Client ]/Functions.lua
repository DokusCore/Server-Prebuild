--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function Notify(txt, pos, time)
  TriggerEvent("pNotify:SendNotification", {
    text = "<height='40' width='40' style='float:left; margin-bottom:10px; margin-left:20px;' />"..txt,
    type = "success", timeout = time, layout = pos, queue = "right"
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Reset()
  MenuOpen = false
  MenuPage = nil
  InRange, InArea = false, false
  PromptStore, Loc = nil, nil
  OpenStoreGroup = GetRandomIntInRange(0, 0xffffff)
  Items, Valutas, Consumables, Tools, Minerals = {}, {}, {}, {}, {}
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SpawnStoreNPC(_, Coords, Heading)
  local _ = GetHashKey(_)
  while not HasModelLoaded(_) do RequestModel(_) Wait(1) end
  local StoreNPCs = Citizen.InvokeNative(0xD49F9B0955C367DE, _, Coords, Heading, 0, 0, 0, Citizen.ResultAsInteger())
  table.insert(AliveNPCs, StoreNPCs)
  Citizen.InvokeNative(0x1794B4FCC84D812F, StoreNPCs, 1) -- SetEntityVisible
  Citizen.InvokeNative(0x0DF7692B1D9E7BA7, StoreNPCs, 255, false) -- SetEntityAlpha
  Citizen.InvokeNative(0x283978A15512B2FE, StoreNPCs, true) -- SetRandomOutfitVariation
  Citizen.InvokeNative(0x7D9EFB7AD6B19754, StoreNPCs, true) -- FreezeEntityPosition
  Citizen.InvokeNative(0xDC19C288082E586E, StoreNPCs, 1, 1) --SetEntityAsMissionEntity
  Citizen.InvokeNative(0x919BE13EED931959, StoreNPCs, - 1) -- TaskStandStill
  Citizen.InvokeNative(0xC80A74AC829DDD92, StoreNPCs, _) -- SET_PED_RELATIONSHIP_GROUP_HASH
  Citizen.InvokeNative(0x4AD96EF928BD4F9A, StoreNPCs) -- SetModelAsNoLongerNeeded
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OpenShop()
  Citizen.CreateThread(function()
    local str = "Open Store"
    PromptShop = PromptRegisterBegin()
    PromptSetControlAction(PromptShop, _Keys['LALT'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(PromptShop, str)
    PromptSetEnabled(PromptShop, true)
    PromptSetVisible(PromptShop, true)
    PromptSetHoldMode(PromptShop, true)
    PromptSetGroup(PromptShop, OpenStoreGroup)
    PromptRegisterEnd(PromptShop)
  end)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetDistance(Coords)
  local Ped = PlayerPedId()
  local pCoords = GetEntityCoords(Ped)
  local Dist = Vdist(pCoords, Coords)
  return Dist
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetAllItems()
  local Data = TSC('DokusCore:Core:DBGet:Stores', { 'All' })
  if (Data.Exist) then
    for k,v in pairs(Data.Result) do
      if (Low(v.Type) == 'consumable') then table.insert(Consumables, v) end
      if (Low(v.Type) == 'item') then table.insert(Items, v) end
      if (Low(v.Type) == 'valuta') then table.insert(Valutas, v) end
      if (Low(v.Type) == 'tool') then table.insert(Tools, v) end
      if (Low(v.Type) == 'mineral') then table.insert(Minerals, v) end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Handling when an item is sold
--------------------------------------------------------------------------------
function SellItem(Data)
  print("Buying Item")
  for k,v in pairs(Data) do
    -- body...
    print(k,v)
  end
end
