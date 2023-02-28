Config = {}

-- Model of the RC boat to spawn
Config.RCBoatModel = `rcBoat`

-- Model used for the invisible driver of the RC boat
Config.DriverModel = `S_M_M_StGSailor_01`

-- Model used for torpedos fired from the RC boat
Config.TorpedoModel = `s_re_toytorpedo01x`

-- Minimap blip sprite to use for the RC boat
Config.RCBoatBlip = -214162151

-- Range at which the RC boat can be controlled
Config.ControlRange = 40.0

-- Remaining range at which the distance turns yellow
Config.CautionRange = 10.0

-- Remaining range at which the distance turns red
Config.WarningRange = 5.0

-- Message shown when getting too far away
Config.RangeNotification = "Stay ~COLOR_YELLOW~within range~COLOR_WHITE~, or the RC boat will ~COLOR_RED~self-destruct~COLOR_WHITE~."

-- How fast torpedos travels when fired
Config.TorpedoSpeed = 20.0

-- How far torpedos can go without hitting anything before detonating
Config.TorpedoRange = 30.0

-- The damage scale of the explosion from a detonated torpedo
Config.TorpedoDamage = 0.5

-- The time in seconds before another torpedo can be fired after one detonates
Config.TorpedoCooldown = 5

-- The time in seconds before self-destructing
Config.SelfDestructTime = 5

-- The damage scale of the explosion from self-destructing
Config.SelfDestructDamage = 0.5
