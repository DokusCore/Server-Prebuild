game 'rdr3'
fx_version 'adamant'
version '1.0.1'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

files {
	'ui/index.html',
	'ui/style.css',
	'ui/script.js',
	'ui/chineserocks.ttf',
	'ui/keyboard.ttf',
	'ui/MIDI.js/inc/shim/Base64.js',
	'ui/MIDI.js/inc/shim/Base64binary.js',
	'ui/MIDI.js/inc/shim/WebAudioAPI.js',
	'ui/MIDI.js/inc/shim/WebMIDIAPI.js',
	'ui/MIDI.js/inc/jasmid/stream.js',
	'ui/MIDI.js/inc/jasmid/midifile.js',
	'ui/MIDI.js/inc/jasmid/replayer.js',
	'ui/MIDI.js/js/midi/audioDetect.js',
	'ui/MIDI.js/js/midi/gm.js',
	'ui/MIDI.js/js/midi/loader.js',
	'ui/MIDI.js/js/midi/plugin.audiotag.js',
	'ui/MIDI.js/js/midi/plugin.webaudio.js',
	'ui/MIDI.js/js/midi/plugin.webmidi.js',
	'ui/MIDI.js/js/midi/player.js',
	'ui/MIDI.js/js/util/dom_request_script.js',
	'ui/MIDI.js/js/util/dom_request_xhr.js',
	'ui/metronome.js'
}

ui_page 'ui/index.html'

server_script {'server.lua', 'Version.lua'}

client_scripts {
	'config.lua',
	'client.lua'
}
