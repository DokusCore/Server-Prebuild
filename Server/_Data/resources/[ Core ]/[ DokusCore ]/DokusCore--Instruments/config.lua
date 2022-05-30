Config = {}

-- Maximum volume for notes
Config.MaxVolume = 1.0

-- How quickly sound fades out over distance
Config.MinAttenuationFactor = 4.0
Config.MaxAttenuationFactor = 6.0

-- Factor to lower volume by when in a different room
Config.MinVolumeFactor = 1.0
Config.MaxVolumeFactor = 4.0

-- The base octave of notes
Config.BaseOctave = 3

-- Maximum distance at which to interact with stationary instrument objects
Config.MaxInteractDistance = 2.0

-- Maximum distance at which to receive notes
Config.MaxNoteDistance = 30.0

-- Choose a soundfont and accompanying instrument list:

-- Fluid
--Config.SoundfontUrl = 'https://gleitz.github.io/midi-js-soundfonts/FluidR3_GM/'
--Config.InstrumentsUrl = 'https://gleitz.github.io/midi-js-soundfonts/FluidR3_GM/names.json'

-- Musyng Kite
--Config.SoundfontUrl = 'https://gleitz.github.io/midi-js-soundfonts/MusyngKite/'
--Config.InstrumentsUrl = 'https://gleitz.github.io/midi-js-soundfonts/MusyngKite/names.json'

-- FatBoy
Config.SoundfontUrl = 'https://gleitz.github.io/midi-js-soundfonts/FatBoy/'
Config.InstrumentsUrl = 'https://gleitz.github.io/midi-js-soundfonts/FatBoy/names.json'

-- Interactions with instruments
Config.Instruments = {
	['piano'] = {
		midiInstrument = 'acoustic_grand_piano',
		attachTo = {
			models = {
				'p_nbmpiano01x',
				'p_nbxpiano01x',
				'p_piano02x',
				'p_piano03x',
				'sha_man_piano01'
			},
			position = vector3(0.0, -0.77, 0.55),
			rotation = vector3(0.0, 0.0, 0.0)
		},
		inactiveAnimation = {
			dict = 'ai_gestures@instruments@piano@male@normal',
			name = 'piano_base',
			flag = 1
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@piano@male@normal',
			name = 'piano_fast_l_-1_0_+1_r_-1_0_+1_chords_01',
			flag = 1
		}
	},
	['trumpet'] = {
		midiInstrument = 'trumpet',
		props = {
			{
				model = 'p_trumpet01x',
				bone = 'SKEL_R_Hand',
				position = vector3(0.07, 0.0, -0.05),
				rotation = vector3(270.0, 10.0, -80.0)
			}
		},
		inactiveAnimation = {
			dict = 'amb_misc@world_human_trumpet@male_a@base',
			name = 'base',
			flag = 25
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@trumpet@standing@140bpm',
			name = 'upbeat_cen_002',
			flag = 25
		}
	},
	['guitar'] = {
		midiInstrument = 'acoustic_guitar_nylon',
		props = {
			{
				model = 'p_guitar01x',
				bone = 'skel_spine0',
				position = vector3(0.17, 0.35, -0.12),
				rotation = vector3(-18.0, -18.0, 180.0)
			}
		},
		inactiveAnimation = {
			dict = 'ai_gestures@instruments@guitar@seated@80bpm',
			name = 'generic_01',
			flag = 25
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@guitar@seated@120bpm',
			name = 'upbeat_picking_fast_chords_rt_0_+1_03',
			flag = 25
		}
	},
	['harp'] = {
		midiInstrument = 'orchestral_harp',
		attachTo = {
			models = {
				'p_harp01x'
			},
			position = vector3(0.5, -0.15, 0.55),
			rotation = vector3(0.0, 0.0, 90.0)
		},
		inactiveAnimation = {
			dict = 'ai_gestures@instruments@band_test',
			name = 'p_base',
			flag = 1
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@band_test',
			name = 'p_playing',
			flag = 1
		}
	},
	['harmonica'] = {
		midiInstrument = 'harmonica',
		props = {
			{
				model = 'p_harmonica01x',
				bone = 'skel_l_hand',
				position = vector3(0.08, 0.03, 0.08),
				rotation = vector3(0.0, 90.0, 0.0)
			}
		},
		inactiveAnimation = {
			female = {
				dict = 'amb_misc@prop_human_seat_bench@harmonica@resting@female_a@base',
				name = 'base',
				flag = 25
			},
			male = {
				dict = 'amb_misc@prop_human_seat_bench@harmonica@resting@male_a@base',
				name = 'base',
				flag = 25
			},
		},
		activeAnimation = {
			female = {
				dict = 'ai_gestures@instruments@harmonica@seated@female@120bpm',
				name = 'spine_bwd_01',
				flag = 25
			},
			male = {
				dict = 'ai_gestures@instruments@harmonica@seated@120bpm',
				name = 'spine_bwd_01',
				flag = 25
			}
		}
	},
	['concertina'] = {
		midiInstrument = 'accordion',
		props = {
			{
				model = 'p_cs_concertina01x',
				bone = 'skel_r_hand',
				position = vector3(0.0, 0.0, 0.0),
				rotation = vector3(0.0, 270.0, 0.0)
			}
		},
		inactiveAnimation = {
			dict = 'amb_misc@prop_human_seat_bench@concertina@male_a@base',
			name = 'base',
			flag = 25
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@concertina@seated@120bpm',
			name = 'longs_med_01',
			flag = 25
		}
	},
	['banjo'] = {
		midiInstrument = 'banjo',
		props = {
			{
				model = 'p_banjo01x',
				bone = 'skel_spine0',
				position = vector3(0.05, 0.25, -0.22),
				rotation = vector3(-4.0, -30.0, 180.0)
			}
		},
		inactiveAnimation = {
			dict = 'ai_gestures@instruments@banjo@seated@male@normal',
			name = 'banjo_base',
			flag = 25
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@banjo@seated@120bpm',
			name = 'spine_0_hand_0_01',
			flag = 25
		}
	},
	['fiddle'] = {
		midiInstrument = 'fiddle',
		props = {
			{
				model = 'p_fiddle01x',
				bone = 'skel_l_forearm',
				position = vector3(0.07, 0.33, 0.11),
				rotation = vector3(169.0, -73.0, -40.0)
			},
			{
				model = 'p_bow01x',
				bone = 'skel_r_hand',
				position = vector3(0.06, -0.08, -0.029),
				rotation = vector3(147, 270, 115)
			}
		},
		inactiveAnimation = {
			dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			name = 'fiddle_base',
			flag = 25
		},
		activeAnimation = {
			dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			name = 'fiddle_low_long_shorts_-1_01',
			flag= 25
		}
	}
}
