Config = {}

Config.Balls = {
	["apple"] = {
		model = `p_apple01x`,
		breakOnImpact = false
	},
	["baseball"] = {
		model = `s_baseball01x`,
		breakOnImpact = false
	},
	["bocceballgreen"] = {
		model = `p_bocceballgreen01x`,
		breakOnImpact = false
	},
	["bocceballjack"] = {
		model = `p_bocceballjack01x`,
		breakOnImpact = false
	},
	["bocceballred"] = {
		model = `p_bocceballred01x`,
		breakOnImpact = false
	},
	["bone"] = {
		model = `p_dogbone01x`,
		breakOnImpact = false
	},
	["cannonball"] = {
		model = `p_cannonball01x`,
		breakOnImpact = false
	},
	["goatball"] = {
		model = `mp004_p_goatball_02a`,
		breakOnImpact= false
	},
	["horseshoe"] = {
		model = `p_horseshoe01x`,
		breakOnImpact = false
	},
	["jugglingball"] = {
		model = `p_jugglingball01x`,
		breakOnImpact = false
	},
	["lightbulb"] = {
		model = `p_lightbulb01x`,
		breakOnImpact = false
	},
	["mango"] = {
		model = `p_mango01x`,
		breakOnImpact = false
	},
	["potato"] = {
		model = `p_potato01x`,
		breakOnImpact = false
	},
	["rock"] = {
		model = `p_rockthrow01x`,
		breakOnImpact = false
	},
	["shoe"] = {
		model = `p_shoe01x`,
		breakOnImpact = false
	},
	["snowball"] = {
		model = `p_cs_snowball01x`,
		breakOnImpact = true
	},
	["tomato"] = {
		model = `s_tomato01x`,
		breakOnImpact = false
	}
}

Config.BaseVelocity = 20.0

Config.Animations = {
	idle = {dict = "mech_weapons_thrown@base", name = "grip_idle", flag = 25},
	idleWalking = {dict = "mech_weapons_thrown@base", name = "grip_walk", flag = 25},
	aimingLow = {dict = "mech_weapons_thrown@base", name = "aim_l", flag = 25},
	aimingMed = {dict = "mech_weapons_thrown@base", name = "aim_m", flag = 25},
	aimingHigh = {dict = "mech_weapons_thrown@base", name = "aim_h", flag = 25},
	aimingFullLow = {dict = "mech_weapons_thrown@base", name = "aimlive_l", flag = 25},
	aimingFullMed = {dict = "mech_weapons_thrown@base", name = "aimlive_m", flag = 25},
	aimingFullHigh = {dict = "mech_weapons_thrown@base", name = "aimlive_h", flag = 25},
	throwingLow = {dict = "mech_weapons_thrown@base", name = "throw_l_fb_stand", flag = 2},
	throwingMed = {dict = "mech_weapons_thrown@base", name = "throw_m_fb_stand", flag = 2},
	throwingHigh = {dict = "mech_weapons_thrown@base", name = "throw_h_fb_stand", flag = 2},
}

Config.ProjectileLifetime = 10000

Config.EnableCommand = true

Config.DefaultBall = "baseball"
