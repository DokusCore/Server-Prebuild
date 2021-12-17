--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
function OpenBank(Lang)
  CreateThread(function()
    local str = _('Banking_MenuText', Lang)
    PromptBank = PromptRegisterBegin()
    PromptSetControlAction(PromptBank, _ActionKey)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(PromptBank, str)
    PromptSetEnabled(PromptBank, true)
    PromptSetVisible(PromptBank, true)
    PromptSetHoldMode(PromptBank, true)
    PromptSetGroup(PromptBank, OpenBankGroup)
    PromptRegisterEnd(PromptBank)
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
function Notify(txt, pos, time)
  TriggerEvent("pNotify:SendNotification", {
    text = "<height='40' width='40' style='float:left; margin-bottom:10px; margin-left:20px;' />"..txt,
    type = "success", timeout = time, layout = pos, queue = "right"
  })
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------










--------------------------------------------------------------------------------
