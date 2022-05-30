--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
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
function SetDoorsLocked(Hash)
  local Register = IsDoorRegisteredWithSystem(Hash)
  if (not (Register)) then
    Citizen.InvokeNative(0xD99229FE93B46286, Hash, 1, 1, 0, 0, 0, 0)
    DoorSystemSetDoorState(Hash, 1)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function ResetData()
  Prompt_Bathing        = nil
  Group     = GetRandomIntInRange(0, 0xffffff)
  InArea, InRange, Loc = false, false, nil
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function LoadScenes()
	RequestAnimDict("MINI_GAMES@BATHING@REGULAR@ARTHUR");
	RequestAnimDict("MINI_GAMES@BATHING@REGULAR@RAG");
	RequestAnimDict("MINI_GAMES@BATHING@DELUXE@ARTHUR");
	RequestAnimDict("MINI_GAMES@BATHING@DELUXE@MAID");
	RequestClipSet("CLIPSET@MINI_GAMES@BATHING@REGULAR@ARTHUR");
	RequestClipSet("CLIPSET@MINI_GAMES@BATHING@REGULAR@RAG");
	RequestClipSet("CLIPSET@MINI_GAMES@BATHING@DELUXE@ARTHUR");
	RequestClipSet("CLIPSET@MINI_GAMES@BATHING@DELUXE@MAID");
	Citizen.InvokeNative(0x2B6529C54D29037A, "Script_Mini_Game_Bathing_Regular");
	Citizen.InvokeNative(0x2B6529C54D29037A, "Script_Mini_Game_Bathing_Deluxe");
end



















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
