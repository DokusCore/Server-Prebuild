--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
_SafeGuard = {

  --[[
  The AntiCheat is still in development and could return false positives. May
  this happen then you can unban the user via the database from the blacklist
  table. Recommended is to keep the AntiCheat SpeedHack turned off for this
  right moment. The rest can be left online, only SpeedHack gives false positives!
  ]]

  Anti = {
    SpeedHack = { Enabled = false, Interval = 1, Threshold = 30, Log = true, Action = 'Ban' },
  },

  --[[
  The following options is to prevent admin abuse on your server. All functions
  log the action into the database, some options spawn text upon the admins body
  for x duration of time. This can be seen by everyone within 100 meters, so that
  the admin does not use his abilities to advance his own RP scenarios.
  The Godmode text will stay visible as long the admin stands in god mode.
  ]]
  
  Admin = {
    DeleteVehicle = { Enabled = true },
    GodMode       = { Enabled = true, Time = { Seconds = 60 }, OffsetZ = 0.0 },
    SpawnHorse    = { Enabled = true, Time = { Seconds = 60 }, OffsetZ = 0.1 },
    Teleport      = { Enabled = true, Time = { Seconds = 60 }, OffsetZ = 0.2 },
    NoClip        = { Enabled = true, Time = { Seconds = 60 }, OffsetZ = 0.2 },
  }

}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
