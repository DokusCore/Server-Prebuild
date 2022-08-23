--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
-- [[ Here you place all the functions you create ]]
--------------------------------------------------------------------------------
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
function SetInArea()
  print("Set In Area")
  InArea = true
  TriggerEvent('DokusCore:Boats:CheckDistStore')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutArea()
  print("Set Out Area")
  InArea, Loc = false, nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetInRange()
  print("Set In Range")
  InRange = true
  TriggerEvent('DokusCore:Boats:CheckDistNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetOutRange()
  print("Set Out Range")
  InRange = false
  TriggerEvent('DokusCore:Boats:CheckDistNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNearNPC()
  print("Set Near NPC")
  NearNPC = true
  local Random = Dialog.CloseNPC[math.random(#Dialog.CloseNPC)]
  NoteNPCTalk(Dialog.NPCName, Random[1], Random[2])
  TriggerEvent('DokusCore:Boats:CheckCloseNPC')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetFarNPC()
  print("Set far NPC")
  NearNPC = false
  local Random = Dialog.LeaveNPC[math.random(#Dialog.LeaveNPC)]
  NoteNPCTalk(Dialog.NPCName, Random[1], Random[2])
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function InShopRange()
  ShowPrompts, CloseNPC = true, true
  TriggerEvent('DokusCore:Boats:ShowPrompts')
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function OutShopRange()
  StoreInUse = false
  UserBoats = {}
  ShowPrompts, CloseNPC = false, false
  Prompt_Menu, Group = nil, GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetUserBoats()
  local Data = TSC('DokusCore:Core:DBGet:Boats', { 'User', 'All', { SteamID } }).Result
  for k,v in pairs(Data) do Tabi(UserBoats, v) end
  print("User boats are set")
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
