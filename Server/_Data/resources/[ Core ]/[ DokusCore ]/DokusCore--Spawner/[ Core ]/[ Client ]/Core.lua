--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
SteamID = false
DriverID, VehicleID, SpawnPos = nil, nil, nil
IsWalking, IsDriving, Chatter = false, false, false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
StartPos   = _Spawner.StartPosition
Cutscenes  = _Spawner.Cutscenes
Randomizer = _Spawner.StartRandomizer
Tailor     = _Spawner.Tailor
Song       = _Spawner.Songs
Despawn    = _Spawner.VehDespawn
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ShowPrompt    = false
Prompt_Stop   = nil
Prompt_Out    = nil
Prompt_Cinema = nil
Group         = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.Spawner) then
    while not FrameReady() do Wait(1000) end
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID = Sync.SteamID
  end
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