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
function ResetData()
  Loc, InRange  = nil, false
  Prompt_Guarma = nil
  Prompt_Casino = nil
  Prompt_Jail   = nil
  Prompt_Guarma_sDenis = nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function SetGuarmaData()
  Citizen.InvokeNative(0x74E2261D2A66849A, not guarma)
  Citizen.InvokeNative(0x63E7279D04160477, guarma)
  Citizen.InvokeNative(0x189739A7631C1867, 1)
  Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277)
  Citizen.InvokeNative(0xE8770EE02AEE45C2, 1)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function UnsetGuarmaData()
  Citizen.InvokeNative(0x63E7279D04160477, guarma)
  Citizen.InvokeNative(0x74E2261D2A66849A, not guarma)
  Citizen.InvokeNative(0x189739A7631C1867, 0)
  Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
  Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
