--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.0
--------------------------------------------------------------------------------
- Added: Anti Admin Abuse for when admins are in noclip. When in noclip text
  will appear on the admins character for others to see.
- Added: Anti Admin Abuse for when admins delete Vehicles and horses, text
  will appear on the admins character when this options is used.
- Changed: Speekhack check has been disabled as this is giving us false
  positives at the moment, once it is more optimized we will re-enable it.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.2.0
--------------------------------------------------------------------------------
- Changed: TriggerEvent that the anti admin abuse notes displays.
- Added: The GodMode note is now added to SafeGuard.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.1.0
--------------------------------------------------------------------------------
- Fixed: Speed hack was detected when user would logout to pick a different
  character, this is now resolved.
- Added: When a admin turns on god mode, a log will be generated into the
  database. Also text will be displayed on the admin that stays as long the
  admin is in god mode
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.0.0
--------------------------------------------------------------------------------
- Added: Function to show when a admin summons his horse. When done text will
  display on the admins character for x amount of seconds seen within 100 meters.
  This is to prevent admin abuse spawning their horse within roleplay.
- Added: Speed hack check. When a none admin player travels faster then the
  allowed max meter per second in the config, the player will be flagged as a
  protentional hacker for noclip - or speed hack. The player will receive automated
  actions like banning what can be controlled via the config.
- Added: All actions taken by SafeGuard are logged within the database logs table.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
