--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
-- Check the travel speed of the player. If player travels faster then possible
-- take action on the player for speed hack | noclip or other vices to increase
-- their travel speed.
--------------------------------------------------------------------------------
CreateThread(function()
  local LastPos = nil
  local Interval = _SafeGuard.Anti.SpeedHack.Interval
  local Threshold = _SafeGuard.Anti.SpeedHack.Threshold
  local Action = _SafeGuard.Anti.SpeedHack.Action
  if (_Modules.SafeGuard) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    if (_SafeGuard.Anti.SpeedHack.Enabled) then
      while true do Wait(1)
        while true do Wait(Interval * 1000)
          local Coords = GetCoords(PedID())
          if (LastPos == nil) then LastPos = Coords break end
          if (LastPos ~= nil) then
            local Dist = GetDistance(LastPos)
            LastPos = Coords
            if (Dist >= Threshold) then
              local IsAdmin = false
              local A, SA = _Moderation.Admin, _Moderation.SuperAdmin
              local Sync = TCTCC('DokusCore:Sync:Get:UserData')
              local Admin = GetUserChar(Sync.SteamID, Sync.CharID).Group
              if (Low(Admin) == Low(A))  then IsAdmin = true end
              if (Low(Admin) == Low(SA)) then IsAdmin = true end
              if (not (IsAdmin)) then
                if (Low(Action) == 'ban') then
                  local Reason = 'AntiCheat: Auto ban speed hack detected'
                  local User = TSC('DokusCore:Core:DBGet:Users', { 'User', { Sync.SteamID } }).Result[1]
                  local Index = { Sync.SteamID, Reason, 'SafeGuard', -1, User.IP, User.License, User.XBoxLive,  User.MLive }
                  TriggerServerEvent('DokusCore:Core:DBIns:Blacklist', { 'User', 'Single', Index })
                  TriggerServerEvent('DokusCore:Core:KickPlayer', { nil, Reason })
                elseif (Low(Action) == 'kick') then
                  local Reason = 'AntiCheat: Auto kick speed hack detected'
                  TriggerServerEvent('DokusCore:Core:KickPlayer', { nil, Reason })
                end
              end
            end
          end
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
