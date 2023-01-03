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
  return _("Stables", Obj, Lang)
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
  NPC_OpenMenu     = nil
  NPC_GetQuest     = nil
  NPC_EndQuest     = nil
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
function ChopChop(PedID, Data)
  local MaxChop, Count = Random(1, 5), 0
  local C = GetCoords(PedID)
  local pname = 'p_axe02x'
  local Prop = nil
  local boneIndex = GetEntityBoneIndexByName(PedID, "SKEL_R_Finger12")
  SetFreeze(PedID, true) Wait(2000)
  RequestAnimDict("amb_work@world_human_tree_chop@male_a@idle_b")
  while not HasAnimDictLoaded("amb_work@world_human_tree_chop@male_a@idle_b") do Wait(100) end
  Prop = CreateObject(GetHashKey(pname), C.x, C.y, C.z + 0.2, true, true, true)
  AttachEntityToEntity(Prop, PedID, boneIndex, 0.200, -0.0, 0.5010, 1.024, -160.0, -70.0, true, true, false, true, 1, true)
  TaskPlayAnim(PedID, "amb_work@world_human_tree_chop@male_a@idle_b", "idle_f", 8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
  while (Count ~= MaxChop) do Wait(10000) Count = (Count + 1) GetReward() Wait(3000) end
  DeleteObject(Prop)
  ClearPedTasks(PedID)
  ResetPrompts()
  SetFreeze(PedID, false)
  UserIsChopping = false
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function HasPlayerQuest()
  local qActive, Data = false, nil
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local Index = { Sync.SteamID, Sync.CharID }
  local Quest = TSC('DokusCore:Core:DBGet:Events', { 'User', 'All', Index })
  if (Quest.Exist) then
    local Employer = 'appleseed timber co'
    for k,v in pairs(Quest.Result) do
      if (Low(v.Employer) == Employer) then
        qActive, Data = true, v
      end
    end
  end

  if (qActive) then return { Active = true, Data = Data } end
  if (not (qActive)) then return { Active = false, Data = Data } end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetPlayerQuest()
  local Q = _LumberJack.Quests.Gather.Resources
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  local rQuest  = Q[ math.random(#Q) ]
  local rAmount = math.random(rQuest.Amount.Min, rQuest.Amount.Max)
  local Encode = Encoded({ Item = rQuest.Item, Amount = rAmount })
  local Index = { Sync.SteamID, Sync.CharID, 5000, Encode }
  TriggerServerEvent('DokusCore:Core:DBIns:Events', { 'Quest', 'LumberJack', Index })
  return { rQuest.Item, rAmount }
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function PayPlayer(SteamID, CharID, Item, Amount)
  local Index = { 'User', 'Single', { SteamID, CharID } }
  local User = TSC('DokusCore:Core:DBGet:Characters', Index)
  for k,v in pairs(_LumberJack.Quests.Gather.Resources) do
    if (Low(v.Item) == Low(Item)) then
      local Money = TN(v.Payment * Amount)
      Talk('EndQuestThanks')
      NoteObjective('Recieved:', "You've recieved $" .. Money, 'Check', 5000)
      local Index = { 'Payment', { SteamID, CharID, (Money + User.Result[1].Money) } }
      TriggerServerEvent('DokusCore:Core:DBSet:Characters', Index)
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Talk(Type)
  if (Type == 'QuestActive') then NoteNPCTalk('LumberJack', "I've no quest for you at current time, please finish your active quest first!", true, 5000) end
  if (Type == 'QuestNoReqItems') then NoteNPCTalk('LumberJack', "You've not the required items to end this quest!", true, 5000) end
  if (Type == 'EndQuestThanks') then NoteNPCTalk('LumberJack', "Thank you for your hard work, here is your payment", true, 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ErrorMsg(Type)
  if (Type == 'NoHatchet') then NoteObjective("System", "You've no hatchet to chop this tree!", "Horn", 5000) end
  if (Type == 'AlreadyHarvested') then NoteObjective("System", "This tree is already harvested!", "Horn", 5000) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
