Config = {}

Config.SharedEmoteRange = 3.0
Config.SharedEmoteTimeout = 5000

Config.SharedEmoteAcceptControl = `INPUT_DYNAMIC_SCENARIO`
Config.SharedEmoteRejectControl = `INPUT_RELOAD`

Config.Emotes = {
	-- Solo emotes
	["dance1"] = {
		type = "solo",
		name = "Dance: Lead",
		animation = {
			dict = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
			name = "arthur_dance_loop",
			flag = 1
		}
	},
	["dance2"] = {
		type = "solo",
		name = "Dance: Follow",
		animation = {
			dict = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
			name = "karen_dance_loop",
			flag = 1
		}
	},
	["dogbarkground"] = {
		type = "solo",
		name = "Dog: Bark on Ground",
		animation = {
			dict = "amb_creature_mammal@world_dog_barking_ground@base",
			name = "base",
			flag = 1
		}
	},
	["dogbarkup"] = {
		type = "solo",
		name = "Dog: Bark Up",
		animation = {
			dict = "amb_creature_mammal@world_dog_barking_up@base",
			name = "base",
			flag = 1
		}
	},
	["dogbeg"] = {
		type = "solo",
		name = "Dog: Beg",
		animation = {
			dict = "amb_creature_mammal@world_dog_begging@idle",
			name = "idle_a",
			flag = 1
		}
	},
	["dogrest"] = {
		type = "solo",
		name = "Dog: Rest",
		animation = {
			dict = "amb_creature_mammal@world_dog_resting@base",
			name = "base",
			flag = 1
		}
	},
	["dogroll"] = {
		type = "solo",
		name = "Dog: Roll",
		animation = {
			dict = "amb_creature_mammal@world_dog_roll_ground@base",
			name = "base",
			flag = 1
		}
	},
	["dogsit"] = {
		type = "solo",
		name = "Dog: Sit",
		animation = {
			dict = "amb_creature_mammal@world_dog_sitting@base",
			name = "base",
			flag = 1
		}
	},
	["dogsleep"] = {
		type = "solo",
		name = "Dog: Sleep",
		animation = {
			dict = "amb_creature_mammal@world_dog_sleeping@base",
			name = "base",
			flag = 1
		}
	},
	["dogsniff"] = {
		type = "solo",
		name = "Sniff",
		animation = {
			dict = "amb_creature_mammal@world_dog_sniffing_ground@base",
			name = "base",
			flag = 1
		}
	},
	["dogwagtail"] = {
		type = "solo",
		name = "Dog: Wag Tail",
		animation = {
			dict = "creatures_mammal@dog_pers@happy@idle",
			name = "idle",
			flag = 1
		}
	},
	["handsup"] = {
		type = "solo",
		name = "Hands Up",
		animation = {
			dict = "script_proc@robberies@homestead@lonnies_shack@deception",
			name = "hands_up_loop",
			flag = 25
		}
	},
	["pet1"] = {
		type = "solo",
		name = "Pet",
		animation = {
			dict = "mech_animal_interaction@dog@patting@1h",
			name = "base",
			flag = 1
		}
	},

	-- Shared emotes
	["dance"] = {
		type = "shared",
		name = "Dance",
		animation = {
			dict = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
			name = "arthur_dance_loop",
			flag = 1
		},
		partner = {
			offset = vector4(0.2, 0.5, 0.0, 155.0),
			animation = {
				dict = "cnv_camp@rchso@cnv@ccdtc33@player_karen",
				name = "karen_dance_loop",
				flag = 1
			}
		}
	},
	["hostage"] = {
		type = "shared",
		name = "Take Hostage",
		animation = {
			dict = "mech_grapple@blade@_male@_ambient@_healthy@back@loco@attacker",
			name = "idle",
			flag = 1
		},
		partner = {
			offset = vector4(0, 0.2, 0, 0),
			animation = {
				dict = "mech_grapple@blade@_male@_ambient@_healthy@back@loco@victim",
				name = "idle",
				flag = 1
			}
		}
	},
	["pet"] = {
		type = "shared",
		name = "Pet Dog (Standing)",
		animation = {
			dict = "mech_animal_interaction@dog@patting@1h",
			name = "base",
			flag = 1
		},
		partner = {
			offset = vector4(0, 0.85, -0.6, 180),
			animation = {
				dict = "creatures_mammal@dog_pers@happy@idle",
				name = "idle",
				flag = 1
			}
		}
	},
	["pet2"] = {
		type = "shared",
		name = "Pet Dog (Sitting)",
		animation = {
			dict = "mech_animal_interaction@dog@patting@1h",
			name = "base",
			flag = 1
		},
		partner = {
			offset = vector4(0, 0.7, -0.6, 180),
			animation = {
				dict = "amb_creature_mammal@world_dog_sitting@base",
				name = "base",
				flag = 1
			}
		}
	},

	-- Prop emotes
	["basket"] = {
		type = "prop",
		name = "Basket",
		prop = {
			model = "p_basket04x",
			bone = "skel_r_hand",
			position = vector3(0.26, -0.07, -0.21),
			rotation = vector3(134.0, -176.0, -124.0)
		},
		animation = {
			dict = "amb_wander@code_human_basket_wander@female_a@base",
			name = "base",
			flag = 25
		}
	},
	["dogbone"] = {
		type = "prop",
		name = "Dog Bone",
		prop = {
			model = "p_dogbone01x",
			bone = "skel_head",
			position = vector3(0.18, 0.02, 0.0),
			rotation = vector3(0.0, 90.0, 0.0)
		}
	},
	["dogchewbone"] = {
		type = "prop",
		name = "Chew on Bone",
		prop = {
			model = "p_dogbone01x",
			bone = "skel_head",
			position = vector3(0.18, 0.02, 0.0),
			rotation = vector3(0.0, 90.0, 0.0)
		},
		animation = {
			dict = "amb_creature_mammal@prop_dog_eat_bone@base",
			name = "base",
			flag = 1
		}
	},
	["fan"] = {
		type = "prop",
		name = "Fan (right hand)",
		prop = {
			model = "p_cs_fan01x",
			bone = "skel_r_hand",
			position = vector3(0.1, 0, -0.035),
			rotation = vector3(0, 150, -9)
		},
		animation = {
			dict = "amb_wander@code_human_fan_wander@female_a@base",
			name = "base",
			flag = 25
		}
	},
	["fan2"] = {
		type = "prop",
		name = "Fan (left hand)",
		prop = {
			model = "p_cs_fan01x",
			bone = "skel_l_hand",
			position = vector3(0.07, 0.02, 0.04),
			rotation = vector3(-20, 0, 0)
		},
		animation = {
			dict = "amb_camp@prop_camp_marybeth_seat_chair@fan@female_a@base",
			name = "base",
			flag = 25
		}
	},
	["parasol"] = {
		type = "prop",
		name = "Parasol",
		prop = {
			model = "p_parasol02x",
			bone = "skel_r_hand",
			position = vector3(0.07, -0.04, -0.02),
			rotation = vector3(-90.0, 0.0, 0.0)
		},
		animation = {
			dict = "amb_rest_sit@prop_human_seat_bench@parasol@female_a@wip_base",
			name = "wip_base",
			flag = 25
		}
	}
}
