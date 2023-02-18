--Added code from OnyxEye on vorp core discord to reference locations
--Moved the bounty board outside of valentine's sheriff office

Config = {}

Config.HuntingMessage = 'Press [ENTER] to start | Payment $1 | Win 10% |'
Config.KillingMessage = 'Win the fight for some money'
Config.ObjectivesKilledMessage = 'You managed to win the fight'
Config.DeadMessage = "You have lost the fight"
Config.Payment = 1.0 -- Amount you need to pay to fight
Config.Reward = 10; -- Percentage of winning bet.

Config.Locations = {
    { ["x"] = -1820.71, ["y"] = -572.15, ["z"] = 156.0}--Strawberry
}

Config.Coordenates = {
    coords = {
        {x = -1837.18, y = -580.79, z = 155.94}
    },
    coords2 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94}
    },
    coords3 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },
    coords4 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords5 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94},
		{x = -1833.18, y = -578.23, z = 155.94}
    },

    coords6 = {
        {x = -1833.18, y = -578.23, z = 155.94}
    },

    coords7 = {
        {x = -1833.18, y = -578.23, z = 155.94}
    },

    coords8 = {
		{x = -1833.18, y = -578.23, z = 155.94}
    },

    coords9 = {
        {x = -1833.18, y = -578.23, z = 155.94}
    },

    coords10 = {
		{x = -1837.18, y = -580.79, z = 155.94}
    },

    coords11 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94}
    },

    coords12 = {
        {x = -1837.18, y = -580.79, z = 155.94}
    },

    coords13 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords14 = {
		{x = -1835.18, y = -580.23, z = 155.94}

    },

    coords15 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords16 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords17 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords18 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords19 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords20 = {
        {x = -1837.18, y = -580.79, z = 155.94},
        {x = -1835.18, y = -580.23, z = 155.94},
		{x = -1835.18, y = -578.23, z = 155.94}
    },

    coords21 = {
        {x = -1837.18, y = -580.79, z = 155.94}
    }
}

--[[Config.weapons = {
	{hash = 0x772C8DD6},
	{hash = 0x169F59F7},
	{hash = 0xDB21AC8C},
	{hash = 0x6DFA071B},
	{hash = 0xF5175BA1},
	{hash = 0xD2718D48},
	{hash = 0x797FBF5},
	{hash = 0x772C8DD6},
	{hash = 0x7BBD1FF6},
	{hash = 0x63F46DE6},
	{hash = 0xA84762EC},
	{hash = 0xDDF7BC1E},
	{hash = 0x20D13FF},
	{hash = 0x1765A8F8},
	{hash = 0x657065D6},
	{hash = 0x8580C63E},
	{hash = 0x95B24592},
	{hash = 0x31B7B9FE},
	{hash = 0x88A8505C},
	{hash = 0x1C02870C},
	{hash = 0x28950C71},
	{hash = 0x6DFA071B}
}]]

Config.models = {
	{hash = "A_M_M_AsbMiner_01"},
	{hash = "A_M_M_FiveFingerFilletPlayers_01"},
	{hash = "A_M_M_SDDockWorkers_02"},
	{hash = "A_M_M_SkpPrisoner_01"},
	{hash = "CS_CAVEHERMIT"},
	{hash = "A_M_M_EmRFarmHand_01"},
	{hash = "A_M_M_BLWObeseMen_01"},
	{hash = "A_M_M_BlWLaborer_01"},
	{hash = "A_M_M_BlWUpperClass_01"},
	{hash = "A_M_M_DOMINOESPLAYERS_01"},
	{hash = "A_M_M_ASBTOWNFOLK_01_LABORER"},
	{hash = "A_M_M_SDLaborers_02"},
	{hash = "A_M_M_AsbMiner_01"},
	{hash = "A_M_M_FiveFingerFilletPlayers_01"},
	{hash = "A_M_M_SDDockWorkers_02"},
	{hash = "A_M_M_SkpPrisoner_01"},
	{hash = "CS_CAVEHERMIT"},
	{hash = "A_M_M_EmRFarmHand_01"},
	{hash = "A_M_M_BLWObeseMen_01"},
	{hash = "A_M_M_BlWLaborer_01"},
	{hash = "A_M_M_BlWUpperClass_01"},
	{hash = "A_M_M_DOMINOESPLAYERS_01"},
	{hash = "A_M_M_ASBTOWNFOLK_01_LABORER"},
	{hash = "A_M_M_SkpPrisoner_01"},
	{hash = "CS_CAVEHERMIT"},
	{hash = "A_M_M_EmRFarmHand_01"},
	{hash = "A_M_M_BLWObeseMen_01"},
	{hash = "A_M_M_BlWLaborer_01"},
	{hash = "A_M_M_BlWUpperClass_01"},
	{hash = "A_M_M_DOMINOESPLAYERS_01"},
	{hash = "A_M_M_ASBTOWNFOLK_01_LABORER"}

}
