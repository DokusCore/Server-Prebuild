--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
function FrameReady()
  local Data = TCTCC('DokuCore:Sync:Get:CoreData')
  return Data.FrameReady
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UserInGame()
  local Data = TCTCC('DokusCore:Sync:Get:UserData')
  return Data.UserInGame
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function MSG(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("Scavenger", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SYS(Obj)
  local Lang = TCTCC('DokusCore:Sync:Get:UserData').Language
  return _("System", Obj, Lang)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  Prompt_Bush = nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoAnimation(PedID)
  local Hash = 'mech_pickup@plant@berries'
  RequestAnimDict(Hash)
  TaskPlayAnim(PedID, Hash, "enter_lf", 1.0, - 0.5, - 1, 0, 0, true, 0, false, 0, false) Wait(2500)
  TaskPlayAnim(PedID, Hash, "base", 1.0, - 0.5, - 1, 0, 0, true, 0, false, 0, false) Wait(4100)
  ClearPedTasks(PedID)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CheckBush(GetHarvested)
  local Found = false
  for k, v in pairs(GetHarvested) do
    local Dist = GetDistance(v)
    if (Dist <= 2.0) then Found = true end
  end return Found
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetReward()
  local Rewards = {}
  local List = _Scavenger.BushHarvest.Items
  for k, v in pairs(List) do
    if (Low(v.ID) == (Low(Type))) then
      Tabi(Rewards, v)
    end
  end

  local Random = Rewards [ Random(#Rewards) ]
  if (Random.Amount > 0) then
    local Description = MSG("Rewards").MSG .. " " .. Random.Amount .. " " .. Random.Name
    NoteObjective(MSG("Name").MSG, Description, "Check", Floor(MSG("Rewards").Time * 1000))
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    local Index = { Sync.SteamID, Sync.CharID, Random.Item }
    local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
    if (Inv.Exist) then
      local Index = { Sync.SteamID, Sync.CharID, Random.Item, Random.Amount, Inv.Result[1].Amount }
      TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
    else
      local Index = { Sync.SteamID, Sync.CharID, Random.Type, Random.Item, Random.Amount }
      TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', Index })
    end
  end

end
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
