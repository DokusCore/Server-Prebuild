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
function FormatCoords(Coords)
  local Dec = Decoded(Coords)
  local Vec = vec3(Dec.x, Dec.y, Dec.z)
  return Vec
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DoorLock(Hash, State)
  if (State == 1) then State = 0 else State = 1 end
  TriggerEvent('DokusCore:DoorLocks:Sync:Lock:Status', { HID = Hash, Status = State })
  TriggerEvent('DokusCore:Properties:Show:DoorToggle', State)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetPrompts()
  Prompt_DoorLock    = nil
  Prompt_OpenStorage = nil
  Prompt_BuyHouse    = nil
  Prompt_BuyInspect  = nil
  Prompt_BuyConYes   = nil
  Prompt_BuyConNo    = nil
  Prompt_InspectStop = nil
  Group              = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SendMSG(Type, Time, Data)
  if (Low(Type) == 'nokey') then NoteObjective('System', "You've no key for this door!", 'Horn', Time) end
  if (Low(Type) == 'isinspecting') then NoteObjective('System', "You're now able to inspect the house!", 'Horn', Time) end
  if (Low(Type) == 'boughthome') then NoteObjective('System', "You've bough this home for $"..Data, 'Horn', Time) end
  if (Low(Type) == 'nomoney') then NoteObjective('System', "You've not enough money to buy this house!", 'Horn', Time) end
  if (Low(Type) == 'maxcanown') then NoteObjective('System', "You already own the maximum allowed properties!", 'Horn', Time) end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetLeftDoor()
  Loc = nil
  if (not (IsInspecting)) then
    NearDoor = false
    ShowPrompts = false
    PausePrompts = false
    ResetPrompts()
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetNearDoor()
  NearDoor = true
  ShowPrompts = true
  ResetPrompts()
  TriggerEvent('DokusCore:Properties:ShowPrompts', { Type = 'Door' })
  if (not (IsOwned)) then TriggerEvent('DokusCore:Properties:Show:BuyInfo') end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function DrawText3DHousing(text, x, y, z)
  local onScreen , _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
  SetTextScale(0.35, 0.35)
  SetTextFontForCurrentCommand(true)
  SetTextColor(255, 255, 255, 215)
  local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
  SetTextCentre(true)
  DisplayText(str, _x , _y)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
