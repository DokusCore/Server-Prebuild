--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
_Bathing = {

  Girl = 'U_F_M_RhdNudeWoman_01',
  Guy = 'CS_LeviSimon',
  Dict = 'script@mini_game@bathing@',

  Zones = {
    -- { ID = 'SaintDenis', Radius = 0.0, Coords = vector3(2632.6, -1223.79, 59.59)   },
    { ID = 'Valentine', Hash = 'S_M_M_Tailor_01', InArea = 20.0, InRange = 2.0, Coords = vector3(-325.6, 773.0, 116.4), Heading = 18.0   },
    -- { ID = 'Annesburg',  Radius = 0.0, Coords = vector3(2950.42, 1332.15, 44.44)   },
    -- { ID = 'Strawberry', Radius = 0.0, Coords = vector3(-1816.45, -372.44, 166.50) },
    -- { ID = 'Blackwater', Radius = 0.0, Coords = vector3(-822.82, -1315.72, 43.58)  },
    -- { ID = 'Vanhorn',    Radius = 0.0, Coords = vector3(2986.31, 568.27, 47.85)    },
    -- { ID = 'Rhodes',     Radius = 0.0, Coords = vector3(1340.11, -1379.6, 84.28)   },
  },

  Doors = {
    { ID = 'Valentine',  Hash = 142240370,   Coords = vector3(-320.56, 762.41, 117.44)   },
    -- { ID = 'SaintDenis', Hash = 779421929,   Coords = vector3(2632.6, -1223.79, 59.59)   },
    -- { ID = 'Annesburg',  Hash = -201071322,  Coords = vector3(2950.42, 1332.15, 44.44)   },
    -- { ID = 'Strawberry', Hash = 1256786197,  Coords = vector3(-1816.45, -372.44, 166.50) },
    -- { ID = 'Blackwater', Hash = 1523300673,  Coords = vector3(-822.82, -1315.72, 43.58)  },
    -- { ID = 'Vanhorn',    Hash = 1102743282,  Coords = vector3(2986.31, 568.27, 47.85)    },
    -- { ID = 'Rhodes',     Hash = -1847993131, Coords = vector3(1340.11, -1379.6, 84.28)   },
  },

  WalkLoc = {
    { ID = 'Valentine',  Time = 6, Coords = vector3(-320.70, 762.70, 117.4), Ani = 'BATHING_INTRO_OUTRO_VALENTINE' },
    -- { ID = 'SaintDenis', Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_ST_DENIS' },
    -- { ID = 'Annesburg',  Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_ANNESBURG' },
    -- { ID = 'Strawberry', Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_STRAWBERRY' },
    -- { ID = 'Blackwater', Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_BLACKWATER' },
    -- { ID = 'Vanhorn',    Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_VANHORN' },
    -- { ID = 'Rhodes',     Time = 6, Coords = vector3() Ani = 'BATHING_INTRO_OUTRO_RHODES' },
  },

  BathNPCs = {
    { ID = 'Valentine',    Coords = vector4(-317.37, 761.8, 116.44, 10.365)       },
    -- { ID = 'SaintDenis', Coords = vector4(2629.4, - 1223.33, 58.57, - 92.66)    },
    -- { ID = 'Annesburg',    Coords = vector4(2952.65, 1334.7, 43.44, - 291.27)     },
    -- { ID = 'Strawberry',  Coords = vector4(-1812.83, - 373.23, 165.5, 1.206)     },
    -- { ID = 'Blackwater',  Coords = vector4(-823.86, - 1318.84, 42.68, - 0.459)   },
    -- { ID = 'Vanhorn',        Coords = vector4(2987.62, 573.21, 46.86, 83.841)       },
    -- { ID = 'Rhodes',          Coords = vector4(1336.85, - 1378.04, 83.2897, 166.469) },
  },

  Animations = {
    { Mode = 'Scrub_Head', Freq = 0.75, Deluxe = true },
    { Mode = 'Scrub_Left_Arm', Freq = 0.70, Deluxe = true },
    { Mode = 'Scrub_Right_Arm', Freq = 0.50, Deluxe = true },
    { Mode = 'Scrub_Right_Leg', Freq = 0.60, Deluxe = true },
    { Mode = 'Scrub_Left_Leg', Freq = 0.70, Deluxe = true },
  },

  Undress = {
    { Cat = "hats",         			 hash = 2569388135 },
    { Cat = "masks",        			 hash = 1963323202 },
    { Cat = "masks_large",  			 hash = 1249071452 },
    { Cat = "neckwear",     			 hash = 1606587013 },
    { Cat = "shirts_full",  			 hash = 539411565  },
    { Cat = "coats",        			 hash = 0xE06D30CE },
    { Cat = "coats_closed", 			 hash = 0x662AC34  },
    { Cat = "ponchos",      			 hash = 2937336075 },
    { Cat = "cloaks",       			 hash = 1008366797 },
    { Cat = "vests",        			 hash = 1214179380 },
    { Cat = "gloves",       			 hash = 3938320434 },
    { Cat = "gauntlets",    			 hash = 2446236448 },
    { Cat = "chaps",  	    			 hash = 822561179  },
    { Cat = "pants",  	    			 hash = 491541130  },
    { Cat = "skirts", 	    			 hash = 0xA0E3AB7F },
    { Cat = "boots",  	    			 hash = 2004797167 },
    { Cat = "neckties", 					 hash = 2056714954 },
    { Cat = "neckwear", 					 hash = 1606587013 },
    { Cat = "eyewear",  					 hash = 98860198   },
    { Cat = "holsters_right", 		 hash = 3118660097 },
    { Cat = "holsters_crossdraw",  hash = 1237884315 },
    { Cat = "ammo_pistols", 			 hash = 1058996709 },
    { Cat = "holsters_knife", 		 hash = 2078766994 },
    { Cat = "holsters_left",  		 hash = 3065385517 },
    { Cat = "ammo_rifles",    		 hash = 3658361941 },
    { Cat = "loadouts",       		 hash = 2206760584 },
    { Cat = "gunbelts",       		 hash = 2603387785 },
    { Cat = "accessories",    		 hash = 2044190614 },
    { Cat = "jewelry_rings_right", hash = 2053881099 },
    { Cat = "jewelry_rings_left",  hash = 4050263331 },
    { Cat = "jewelry_bracelets",   hash = 2076247897 },
    { Cat = "badges",              hash = 1065301383 },
    { Cat = "satchels",            hash = 2488290598 },
    { Cat = "spats",               hash = 1363860714 },
    { Cat = "boot_accessories",    hash = 410165049  },
    { Cat = "legs_accessories",    hash = 4048825617 },
    { Cat = "belts",               hash = 2798728390 },
    { Cat = "belt_buckles",        hash = 4209578111 },
    { Cat = "suspenders",          hash = 2272931063 },
    { Cat = "aprons",              hash = 1995498098 },
    { Cat = "armor",               hash = 1927737204 }
  }

}























--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
