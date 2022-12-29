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
  return _("Inventory", Obj, Lang)
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
  ShowPrompts      = false
  ChopKey, StopKey = nil, nil
  pGroup           = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function CheckTree(GetHarvested)
  local Found = false
  for k, v in pairs(GetHarvested) do
    local Dist = GetDistance(v.Coords)
    if (Dist <= 2.0) then Found = true end
  end return Found
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetReward()
  local Item = _LumberJack.Items[ math.random(#_LumberJack.Items) ]
  local Name, Min, Max = Item.Item, Item.Amount.Min, Item.Amount.Max
  local Amount = Random(Min, Max)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')

  NoteObjective("Harvested", "You've harvested " .. Name .. " x" .. Amount, 'Check', 3000)

  local Index = { Sync.SteamID, Sync.CharID, Low(Name) }
  local Inv = TSC('DokusCore:Core:DBGet:Inventory', { 'User', 'Item', Index })
  if (Inv.Exist) then
    local Index = { Sync.SteamID, Sync.CharID, Low(Name), Amount, Inv.Result[1].Amount }
    TriggerServerEvent('DokusCore:Core:DBSet:Inventory', { 'User', 'AddItem', Index })
  else
    local Index = { Sync.SteamID, Sync.CharID, 'Mineral', Low(Name), Amount }
    TriggerServerEvent('DokusCore:Core:DBIns:Inventory', { 'User', 'InsertItem', Index })
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
function ErrorMsg(Type)
  if (Type == 'NoHatchet') then NoteObjective("System", "You've no hatchet to chop this tree!", "Horn", 5000) end
  if (Type == 'AlreadyHarvested') then NoteObjective("System", "This tree is already harvested!", "Horn", 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
