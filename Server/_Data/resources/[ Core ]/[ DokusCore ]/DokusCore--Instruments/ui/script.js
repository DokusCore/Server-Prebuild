const keys = {
	90: 'key-C1',
	83: 'key-Db1',
	88: 'key-D1',
	68: 'key-Eb1',
	67: 'key-E1',
	86: 'key-F1',
	71: 'key-Gb1',
	66: 'key-G1',
	72: 'key-Ab1',
	78: 'key-A1',
	74: 'key-Bb1',
	77: 'key-B1',
	188: 'key-C2',
	76: 'key-Db2',
	190: 'key-D2',
	186: 'key-Eb2',
	191: 'key-E2',
	81: 'key-F2',
	50: 'key-Gb2',
	87: 'key-G2',
	51: 'key-Ab2',
	69: 'key-A2',
	52: 'key-Bb2',
	82: 'key-B2',
	84: 'key-C3',
	54: 'key-Db3',
	89: 'key-D3',
	55: 'key-Eb3',
	85: 'key-E3',
	73: 'key-F3',
	57: 'key-Gb3',
	79: 'key-G3',
	48: 'key-Ab3',
	80: 'key-A3',
	189: 'key-Bb3',
	219: 'key-B3',

};

const majorChordKeys = [
	{
		'key-C1': ['key-C1', 'key-E1', 'key-G1'],
		'key-Db1': ['key-Db1', 'key-F1', 'key-Ab1'],
		'key-D1': ['key-D1', 'key-Gb1', 'key-A1'],
		'key-Eb1': ['key-Eb1', 'key-G1', 'key-Bb1'],
		'key-E1': ['key-E1', 'key-Ab1', 'key-B1'],
		'key-F1': ['key-F1', 'key-A1', 'key-C2'],
		'key-Gb1': ['key-Gb1', 'key-Bb1', 'key-Db2'],
		'key-G1': ['key-G1', 'key-B1', 'key-D2'],
		'key-Ab1': ['key-Ab1', 'key-C2', 'key-Eb2'],
		'key-A1': ['key-A1', 'key-Db2', 'key-E2'],
		'key-Bb1': ['key-Bb1', 'key-D2', 'key-F2'],
		'key-B1': ['key-B1', 'key-Eb2', 'key-Gb2']
	},
	{
		'key-C2': ['key-C2', 'key-E1', 'key-G1'],
		'key-Db2': ['key-Db2', 'key-F1', 'key-Ab1'],
		'key-D2': ['key-D2', 'key-Gb1', 'key-A1'],
		'key-Eb2': ['key-Eb2', 'key-G1', 'key-Bb1'],
		'key-E2': ['key-E2', 'key-Ab1', 'key-B1'],
		'key-F2': ['key-F2', 'key-A1', 'key-C2'],
		'key-Gb2': ['key-Gb2', 'key-Bb1', 'key-Db2'],
		'key-G2': ['key-G2', 'key-B1', 'key-D2'],
		'key-Ab2': ['key-Ab2', 'key-C2', 'key-Eb2'],
		'key-A2': ['key-A2', 'key-Db2', 'key-E2'],
		'key-Bb2': ['key-Bb2', 'key-D2', 'key-F2'],
		'key-B2': ['key-B2', 'key-Eb2', 'key-Gb2']
	},
	{
		'key-C3': ['key-C3', 'key-E3', 'key-G2'],
		'key-Db3': ['key-Db3', 'key-F3', 'key-Ab2'],
		'key-D3': ['key-D3', 'key-Gb3', 'key-A2'],
		'key-Eb3': ['key-Eb3', 'key-G3', 'key-Bb2'],
		'key-E3': ['key-E3', 'key-Ab3', 'key-B2'],
		'key-F3': ['key-F3', 'key-A3', 'key-C3'],
		'key-Gb3': ['key-Gb3', 'key-Bb3', 'key-Db3'],
		'key-G3': ['key-G3', 'key-B3', 'key-D3'],
		'key-Ab3': ['key-Ab3', 'key-C3', 'key-Eb3'],
		'key-A3': ['key-A3', 'key-Db3', 'key-E3'],
		'key-Bb3': ['key-Bb3', 'key-D3', 'key-F3'],
		'key-B3': ['key-B3', 'key-Eb3', 'key-Gb3']
	}
];

const minorChordKeys = [
	{
		'key-C1': ['key-C1', 'key-Eb1', 'key-G1'],
		'key-Db1': ['key-Db1', 'key-E1', 'key-Ab1'],
		'key-D1': ['key-D1', 'key-F1', 'key-A1'],
		'key-Eb1': ['key-Eb1', 'key-Gb1', 'key-Bb1'],
		'key-E1': ['key-E1', 'key-G1', 'key-B1'],
		'key-F1': ['key-F1', 'key-Ab1', 'key-C2'],
		'key-Gb1': ['key-Gb1', 'key-A1', 'key-Db2'],
		'key-G1': ['key-G1', 'key-Bb1', 'key-D2'],
		'key-Ab1': ['key-Ab1', 'key-B1', 'key-Eb2'],
		'key-A1': ['key-A1', 'key-C2', 'key-E2'],
		'key-Bb1': ['key-Bb1', 'key-Db2', 'key-F2'],
		'key-B1': ['key-B1', 'key-D2', 'key-Gb2']
	},
	{
		'key-C2': ['key-C2', 'key-Eb1', 'key-G1'],
		'key-Db2': ['key-Db2', 'key-E1', 'key-Ab1'],
		'key-D2': ['key-D2', 'key-F1', 'key-A1'],
		'key-Eb2': ['key-Eb2', 'key-Gb1', 'key-Bb1'],
		'key-E2': ['key-E2', 'key-G1', 'key-B1'],
		'key-F2': ['key-F2', 'key-Ab1', 'key-C2'],
		'key-Gb2': ['key-Gb2', 'key-A1', 'key-Db2'],
		'key-G2': ['key-G2', 'key-Bb1', 'key-D2'],
		'key-Ab2': ['key-Ab2', 'key-B1', 'key-Eb2'],
		'key-A2': ['key-A2', 'key-C2', 'key-E2'],
		'key-Bb2': ['key-Bb2', 'key-Db2', 'key-F2'],
		'key-B2': ['key-B2', 'key-D2', 'key-Gb2']
	},
	{
		'key-C3': ['key-C3', 'key-Eb3', 'key-G2'],
		'key-Db3': ['key-Db3', 'key-E3', 'key-Ab2'],
		'key-D3': ['key-D3', 'key-F3', 'key-A2'],
		'key-Eb3': ['key-Eb3', 'key-Gb3', 'key-Bb2'],
		'key-E3': ['key-E3', 'key-G3', 'key-B2'],
		'key-F3': ['key-F3', 'key-Ab3', 'key-C3'],
		'key-Gb3': ['key-Gb3', 'key-A3', 'key-Db3'],
		'key-G3': ['key-G3', 'key-Bb3', 'key-D3'],
		'key-Ab3': ['key-Ab3', 'key-B3', 'key-Eb3'],
		'key-A3': ['key-A3', 'key-C3', 'key-E3'],
		'key-Bb3': ['key-Bb3', 'key-Db3', 'key-F3'],
		'key-B3': ['key-B3', 'key-D3', 'key-Gb3']
	}
];

const diminishedChordKeys = [
	{
		'key-C1': ['key-C1', 'key-Eb1', 'key-Gb1'],
		'key-Db1': ['key-Db1', 'key-E1', 'key-G1'],
		'key-D1': ['key-D1', 'key-F1', 'key-Ab1'],
		'key-Eb1': ['key-Eb1', 'key-Gb1', 'key-A1'],
		'key-E1': ['key-E1', 'key-G1', 'key-Bb1'],
		'key-F1': ['key-F1', 'key-Ab1', 'key-B1'],
		'key-Gb1': ['key-Gb1', 'key-A1', 'key-C2'],
		'key-G1': ['key-G1', 'key-Bb1', 'key-Db2'],
		'key-Ab1': ['key-Ab1', 'key-B1', 'key-D2'],
		'key-A1': ['key-A1', 'key-C2', 'key-Eb2'],
		'key-Bb1': ['key-Bb1', 'key-Db2', 'key-E2'],
		'key-B1': ['key-B1', 'key-D2', 'key-F2']
	},
	{
		'key-C2': ['key-C2', 'key-Eb1', 'key-Gb1'],
		'key-Db2': ['key-Db2', 'key-E1', 'key-G1'],
		'key-D2': ['key-D2', 'key-F1', 'key-Ab1'],
		'key-Eb2': ['key-Eb2', 'key-Gb1', 'key-A1'],
		'key-E2': ['key-E2', 'key-G1', 'key-Bb1'],
		'key-F2': ['key-F2', 'key-Ab1', 'key-B1'],
		'key-Gb2': ['key-Gb2', 'key-A1', 'key-C2'],
		'key-G2': ['key-G2', 'key-Bb1', 'key-Db2'],
		'key-Ab2': ['key-Ab2', 'key-B1', 'key-D2'],
		'key-A2': ['key-A2', 'key-C2', 'key-Eb2'],
		'key-Bb2': ['key-Bb2', 'key-Db2', 'key-E2'],
		'key-B2': ['key-B2', 'key-D2', 'key-F2']
	},
	{
		'key-C3': ['key-C3', 'key-Eb3', 'key-Gb2'],
		'key-Db3': ['key-Db3', 'key-E3', 'key-G2'],
		'key-D3': ['key-D3', 'key-F3', 'key-Ab2'],
		'key-Eb3': ['key-Eb3', 'key-Gb3', 'key-A2'],
		'key-E3': ['key-E3', 'key-G3', 'key-Bb2'],
		'key-F3': ['key-F3', 'key-Ab3', 'key-B2'],
		'key-Gb3': ['key-Gb3', 'key-A3', 'key-C3'],
		'key-G3': ['key-G3', 'key-Bb3', 'key-Db3'],
		'key-Ab3': ['key-Ab3', 'key-B3', 'key-D3'],
		'key-A3': ['key-A3', 'key-C3', 'key-Eb3'],
		'key-Bb3': ['key-Bb3', 'key-Db3', 'key-E3'],
		'key-B3': ['key-B3', 'key-D3', 'key-F3']
	}
];

const chordKeys = {
	major: {
		off: {},
		partial: majorChordKeys[0],
		full: Object.assign({}, majorChordKeys[0], majorChordKeys[1], majorChordKeys[2])
	},
	minor: {
		off: {},
		partial: minorChordKeys[0],
		full: Object.assign({}, minorChordKeys[0], minorChordKeys[1], minorChordKeys[2])
	},
	diminished: {
		off: {},
		partial: diminishedChordKeys[0],
		full: Object.assign(diminishedChordKeys[0], diminishedChordKeys[1], diminishedChordKeys[2])
	}
};

const notes = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'];

const minOctave = 1;
const maxOctave = 7;

var baseOctave = 3;

var maxVolume = 1.0;

var minAttenuationFactor = 4.0;
var maxAttenuationFactor = 6.0;

var minVolumeFactor = 1.0;
var maxVolumeFactor = 4.0;

var attenuationFactor = minAttenuationFactor;
var volumeFactor = minVolumeFactor;

var midiChannel = 0;

var channels = {};

var chordMode = 'off';

var activatedKeys = {};

var shiftKey = false;
var ctrlKey = false;

var recording = false;
var recordingPlayback = false;
var recordingLength = 0;

var tempo = 120;
var metronome;

var transpose = 0;

function sendMessage(name, params) {
	return fetch('https://' + GetParentResourceName() + '/' + name, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(params)
	});
}

function showUi() {
	document.getElementById('ui').style.display = 'flex';
	document.getElementById('keyboard').focus();
}

function hideUi() {
	document.getElementById('ui').style.display = 'none';
}

function setAttenuationFactor(target) {
	if (attenuationFactor != target) {
		if (attenuationFactor > target) {
			attenuationFactor -= 0.1;
		} else {
			attenuationFactor += 0.1;
		}

		setTimeout(() => setAttenuationFactor(target), 5);
	}
}

function setVolumeFactor(target) {
	if (volumeFactor != target) {
		if (volumeFactor > target) {
			volumeFactor -= 0.1;
		} else {
			volumeFactor += 0.1;
		}

		setTimeout(() => setVolumeFactor(target), 5);
	}
}

function setInstrument(channel, instrument) {
	return new Promise(function(resolve, reject) {
		if (channels[channel] == instrument) {
			return resolve();
		}

		MIDI.loadResource({
			instrument: instrument,
			onsuccess: function() {
				MIDI.programChange(channel, MIDI.GM.byName[instrument].number);

				channels[channel] = instrument;

				if (channel == midiChannel) {
					document.getElementById('instrument').value = instrument;
				}

				return resolve();
			},
			onerror: function() {
				return reject();
			}
		});
	});
}

function noteOn(data) {
	var noteName = `${data.note}${data.octave}`;
	var note = MIDI.keyToNote[noteName];

	if (data.sameRoom) {
		setAttenuationFactor(minAttenuationFactor);
		setVolumeFactor(minVolumeFactor);
	} else {
		setAttenuationFactor(maxAttenuationFactor);
		setVolumeFactor(maxVolumeFactor);
	}

	var volume = ((127 - data.distance * attenuationFactor) / volumeFactor) * maxVolume;

	if (data.instrument) {
		setInstrument(data.channel, data.instrument).then(() => {
			MIDI.programChange(data.channel, MIDI.GM.byName[data.instrument].number);
			MIDI.setVolume(data.channel, volume);
			MIDI.noteOn(data.channel, note, 127, 0);
		});
	} else {
		MIDI.setVolume(data.channel, volume);
		MIDI.noteOn(data.channel, note, 127, 0);
	}
}

function noteOff(data) {
	var noteName = `${data.note}${data.octave}`;
	var note = MIDI.keyToNote[noteName];

	MIDI.noteOff(data.channel, note, 0);
}

function midiNoteName(note) {
	return notes[note % 12];
}

function midiNoteOctave(note) {
	return Math.floor(note / 12 - 1);
}

function midiNoteToKey(note) {
	var noteName = midiNoteName(note);
	var octave = midiNoteOctave(note);

	return document.getElementById(`key-${noteName}${octave - baseOctave + 1}`);
}

function sendNoteOn(channel, note, octave, echo) {
	var instrument;

	if (channels[channel]) {
		instrument = channels[channel];
	} else {
		instrument = document.getElementById('instrument').value;
	}

	if (transpose != 0) {
		var noteName = `${note}${octave}`;
		var midiNote = MIDI.keyToNote[noteName] + transpose;
		note = midiNoteName(midiNote);
		octave = midiNoteOctave(midiNote);
	}

	sendMessage('noteOn', {
		channel: channel,
		instrument: instrument,
		note: note,
		octave: octave
	});

	if (echo) {
		noteOn({
			channel: channel,
			instrument: instrument,
			note: note,
			octave: octave,
			distance: 0,
			sameRoom: true,
		})
	}
}

function sendNoteOff(channel, note, octave, echo) {
	if (transpose != 0) {
		var noteName = `${note}${octave}`;
		var midiNote = MIDI.keyToNote[noteName] + transpose;
		note = midiNoteName(midiNote);
		octave = midiNoteOctave(midiNote);
	}

	sendMessage('noteOff', {
		channel: channel,
		note: note,
		octave: octave
	});

	if (echo) {
		noteOff({
			channel: channel,
			note: note,
			octave: octave
		})
	}
}

function highlightKey(key, own) {
	if (own) {
		key.style.fill = '#f00';
	} else {
		key.style.fill = '#faa';
	}
}

function unhighlightKey(key) {
	key.style.fill = null;
}

function recvNoteOn(data) {
	noteOn(data);

	if (data.channel == midiChannel) {
		var noteName = `${data.note}${data.octave}`;
		var note = MIDI.keyToNote[noteName];
		var key = midiNoteToKey(note);

		if (key) {
			highlightKey(key, false);
		}
	}
}

function recvNoteOff(data) {
	noteOff(data);

	if (data.channel == midiChannel) {
		var noteName = `${data.note}${data.octave}`;
		var note = MIDI.keyToNote[noteName];
		var key = midiNoteToKey(note);

		if (key) {
			unhighlightKey(key);
		}
	}
}

function activateKey(key, echo) {
	if (activatedKeys[key.id]) {
		return;
	}

	var note = key.getAttribute('data-note');
	var octave = key.getAttribute('data-octave');

	octave = parseInt(octave) + baseOctave;

	sendNoteOn(midiChannel, note, octave, echo);

	highlightKey(key, true);

	activatedKeys[key.id] = true;
}

function deactivateKey(key, echo) {
	if (!activatedKeys[key.id]) {
		return;
	}

	var note = key.getAttribute('data-note');
	var octave = key.getAttribute('data-octave');

	octave = parseInt(octave) + baseOctave;

	sendNoteOff(midiChannel, note, octave, echo);

	unhighlightKey(key);

	activatedKeys[key.id] = false;
}

function setSoundfont(soundfontUrl, instrumentsUrl) {
	fetch(instrumentsUrl).then(resp => resp.json()).then(resp => {
		var select = document.getElementById('instrument');
		select.innerHTML = '';

		resp.forEach(instrument => {
			var option = document.createElement('option');
			option.value = instrument;
			option.innerHTML = instrument;
			select.appendChild(option);
		});

		MIDI.loadPlugin({
			soundfontUrl: soundfontUrl,
			instrument: resp[0]
		});

		MIDI.Player.addListener(function(data) {
			var key = midiNoteToKey(data.note);

			if (key && data.channel == midiChannel) {
				switch (data.message) {
					case 128:
						deactivateKey(key, false);
						break;
					case 144:
						activateKey(key, false);
						break;
					default:
						break;
				}
			} else {
				var noteName = midiNoteName(data.note);
				var octave = midiNoteOctave(data.note);

				switch(data.message) {
					case 128:
						sendNoteOff(data.channel, noteName, octave, false);
						break;
					case 144:
						sendNoteOn(data.channel, noteName, octave, false);
						break;
					default:
						break;
				}
			}
		});
	});
}

function setInstrumentPreset(data) {
	document.getElementById('instrument').value = data.instrument;
	setInstrument(midiChannel, data.instrument);
}

function timeToString(time) {
	var secs = time / 1000;
	var h = Math.floor(secs / 3600);
	var m = Math.floor(secs / 60) % 60;
	var s = Math.floor(secs) % 60;

	return String(h).padStart(2, '0') + ':' + String(m).padStart(2, '0') + ':' + String(s).padStart(2, '0');
}

function updateMidiPlayTime() {
	document.getElementById('time').innerHTML = timeToString(MIDI.Player.currentTime) + '/' + timeToString(MIDI.Player.endTime);

	if (MIDI.Player.playing) {
		setTimeout(updateMidiPlayTime, 1000);
	}
}

function playMidi(url) {
	MIDI.Player.loadFile(url, function() {
		var instruments = MIDI.Player.getFileInstruments();
		var promises = [];

		for (var i = 0; i < instruments.length; ++i) {
			promises.push(setInstrument(i, instruments[i]));
		}

		Promise.all(promises).then(() => {
			updateMidiPlayTime();
			MIDI.Player.start();
		});
	});
}

function getChordKeys(event) {
	if (shiftKey) {
		return chordKeys['minor'][chordMode];
	} else if (ctrlKey) {
		return chordKeys['diminished'][chordMode];
	} else {
		return chordKeys['major'][chordMode];
	}
}

function pressKey(key, event) {
	var keys = getChordKeys(event)[key.id];

	if (keys) {
		keys.forEach(key => activateKey(document.getElementById(key), true));
	} else {
		activateKey(key, true);
	}
}

function releaseKey(key, event) {
	var keys = getChordKeys(event)[key.id];

	if (keys) {
		keys.forEach(key => deactivateKey(document.getElementById(key), true));
	} else {
		deactivateKey(key, true);
	}
}

function cycleChordMode() {
	switch (chordMode) {
		case 'off':
			chordMode = 'partial';
			break;
		case 'partial':
			chordMode = 'full';
			break;
		case 'full':
			chordMode = 'off';
			break;
	}

	document.getElementById('chords').value = chordMode;
}

function updateRecordingTime() {
	if (recording) {
		document.getElementById('time').innerHTML = '00:00:00/' + timeToString(Date.now() - recording);

		setTimeout(updateRecordingTime, 1000);
	}
}

function updateRecordingPlaybackTime() {
	if (recordingPlayback) {
		var time = Date.now() - recordingPlayback;

		if (time <= recordingLength) {
			document.getElementById('time').innerHTML = timeToString(time) + '/' + timeToString(recordingLength);
			setTimeout(updateRecordingPlaybackTime, 1000);
		} else {
			stopRecordingPlayback();
		}
	}
}

function startRecording() {
	sendMessage('startRecording', {}).then(() => {
		recording = Date.now();
		document.getElementById('record').style.color = 'red';
		updateRecordingTime();
	});
}

function stopRecording() {
	sendMessage('stopRecording').then(resp => resp.json()).then(data => {
		recordingLength = data.length;

		document.getElementById('time').innerHTML = '00:00:00/' + timeToString(recordingLength);
		document.getElementById('record').style.color = null;

		recording = false;
		recordingPlayback = false;
	});
}

function eraseRecording() {
	sendMessage('eraseRecording', {}).then(() => {
		recording = false;
		recordingPlayback = false;
		recordingLength = 0;
		document.getElementById('time').innerHTML = '00:00:00/00:00:00';
		document.getElementById('record').style.color = null;
	});
}

function startRecordingPlayback() {
	sendMessage('playbackRecording');

	recordingPlayback = Date.now();

	if (!recording) {
		updateRecordingPlaybackTime();
	}
}

function stopRecordingPlayback() {
	sendMessage('stopRecording', {}).then(() => {
		recordingPlayback = false;
		document.getElementById('time').innerHTML = '00:00:00/' + timeToString(recordingLength);
	});
}

function toggleMetronome() {
	if (metronome.isRunning) {
		metronome.stop();
		document.getElementById('metronome').style.color = null;
	} else {
		metronome.start();
		document.getElementById('metronome').style.color = 'red';
	}
}

function toggleRecording() {
	if (recording) {
		stopRecording();
	} else {
		startRecording();
	}
}

function play() {
	var url = document.getElementById('url').value;

	if (url == '') {
		startRecordingPlayback();
	} else {
		playMidi(url);
	}
}

function populateInteractions(instruments) {
	var interactionSelect = document.getElementById('interaction');

	interactionSelect.innerHTML = '';

	instruments.forEach(instrument => {
		var option = document.createElement('option');
		option.value = instrument;
		option.innerHTML = instrument;
		interactionSelect.appendChild(option);
	});
}

window.addEventListener('message', event => {
	switch (event.data.type) {
		case 'showUi':
			showUi();
			break;
		case 'hideUi':
			hideUi();
			break;
		case 'noteOn':
			recvNoteOn(event.data);
			break;
		case 'noteOff':
			recvNoteOff(event.data);
			break;
		case 'setInstrumentPreset':
			setInstrumentPreset(event.data);
			break;
	}
});

window.addEventListener('load', event => {
	sendMessage('init', {}).then(resp => resp.json()).then(resp => {
		baseOctave = resp.baseOctave;
		document.getElementById('octave').value = baseOctave;

		maxVolume = resp.maxVolume;

		minAttenuationFactor = resp.minAttenuationFactor;
		maxAttenuationFactor = resp.maxAttenuationFactor;
		attenuationFactor = minAttenuationFactor;

		minVolumeFactor = resp.minVolumeFactor;
		maxVolumeFactor = resp.maxVolumeFactor;
		volumeFactor = minVolumeFactor;

		setSoundfont(resp.soundfontUrl, resp.instrumentsUrl);

		document.getElementById('tempo').value = tempo;
		metronome = new Metronome(tempo);

		document.getElementById('channel').value = midiChannel;

		document.getElementById('transpose').value = transpose;

		populateInteractions(resp.instruments);
	});

	document.querySelectorAll('.piano-key').forEach(key => {
		key.addEventListener('mousedown', function(event) {
			pressKey(this, event);
		});

		key.addEventListener('mouseup', function(event) {
			releaseKey(this, event, true);
		});

		key.addEventListener('mouseout', function(event) {
			releaseKey(this, event, true);
		});
	});

	document.getElementById('close').addEventListener('click', function(event) {
		sendMessage('closeUi', {})
	});

	document.getElementById('instrument').addEventListener('input', function(event) {
		var channel = parseInt(document.getElementById('channel').value);

		setInstrument(channel, this.value);

		document.getElementById('keyboard').focus();
	});

	document.getElementById('octave').addEventListener('input', function(event) {
		var octave = parseInt(this.value);

		if (octave != NaN && octave >= minOctave && octave <= maxOctave) {
			baseOctave = octave;
		}

		this.value = baseOctave;

		document.getElementById('keyboard').focus();
	});

	document.getElementById('channel').addEventListener('input', function(event) {
		var channel = parseInt(this.value);

		if (channel != NaN && channel >= 0 && channel < 16) {
			midiChannel = channel;
		}

		this.value = midiChannel;

		if (channels[channel]) {
			document.getElementById('instrument').value = channels[channel];
		}

		document.getElementById('keyboard').focus();
	});

	document.getElementById('play').addEventListener('click', function(event) {
		play();
		document.getElementById('keyboard').focus();
	});

	document.getElementById('stop').addEventListener('click', function(event) {
		if (MIDI.Player.playing) {
			MIDI.Player.stop();
		} else if (recording) {
			stopRecording();
		} else {
			stopRecordingPlayback();
		}

		document.getElementById('keyboard').focus();
	});

	document.getElementById('chords').addEventListener('input', function(event) {
		chordMode = this.value;
		document.getElementById('keyboard').focus();
	});

	document.getElementById('record').addEventListener('click', function(event) {
		toggleRecording();
		document.getElementById('keyboard').focus();
	});

	document.getElementById('erase').addEventListener('click', function(event) {
		eraseRecording();
		document.getElementById('keyboard').focus();
	});

	document.getElementById('metronome').addEventListener('click', function(event) {
		toggleMetronome();
		document.getElementById('keyboard').focus();
	});

	document.getElementById('tempo').addEventListener('input', function(event) {
		var t = parseInt(this.value);

		var running = metronome.isRunning;

		tempo = t;
		metronome.stop();
		metronome = new Metronome(tempo);

		if (running) {
			metronome.start();
		}

		document.getElementById('keyboard').focus();
	});

	document.getElementById('start-interaction').addEventListener('click', function(event) {
		var instrument = document.getElementById('interaction').value;

		sendMessage('startPlayingInstrument', {
			instrument: instrument
		});

		document.getElementById('keyboard').focus();
	});

	document.getElementById('stop-interaction').addEventListener('click', function(event) {
		sendMessage('stopPlayingInstrument', {});

		document.getElementById('keyboard').focus();
	});

	document.getElementById('help-button').addEventListener('click',  function(event) {
		document.getElementById('help').style.display = 'flex';
	});

	document.getElementById('close-help').addEventListener('click', function(event) {
		document.getElementById('help').style.display = 'none';
	});

	document.getElementById('transpose').addEventListener('input', function(event) {
		transpose = parseInt(this.value);
		document.getElementById('keyboard').focus();
	});

	document.getElementById('keyboard').addEventListener('keydown', event => {
		switch (event.keyCode) {
			case 33: // Page Down
				if (baseOctave < maxOctave) {
					++baseOctave;
				}
				document.getElementById('octave').value = baseOctave;
				break;
			case 34: // Page Up
				if (baseOctave > minOctave) {
					--baseOctave;
				}
				document.getElementById('octave').value = baseOctave;
				break;
			case 36:
				if (transpose < 127) {
					++transpose;
				}
				document.getElementById('transpose').value = transpose;
				break;
			case 35:
				if (transpose > -127) {
					--transpose;
				}
				document.getElementById('transpose').value = transpose;
				break;
			case 45: // Insert
				if (midiChannel < 15) {
					++midiChannel;
				}
				document.getElementById('channel').value = midiChannel;
				break;
			case 46: // Delete
				if (midiChannel > 0) {
					--midiChannel;
				}
				document.getElementById('channel').value = midiChannel;
				break;
			case 192: // ~
				cycleChordMode();
				break;
			default:
				var key = keys[event.keyCode];

				if (key) {
					pressKey(document.getElementById(key), event);
				}

				break;
		}
	});

	document.getElementById('keyboard').addEventListener('keyup', event => {
		switch (event.keyCode) {
			case 8: // Backspace
				toggleMetronome();
				break;
			case 32: // Space
				play();
				break;
			case 220: //Enter
				toggleRecording();
				break;
			default:
				var key = keys[event.keyCode];

				if (key) {
					releaseKey(document.getElementById(key), true, event);
				}

				break;
		}
	});
});

window.addEventListener('keydown', event => {
	switch (event.keyCode) {
		case 16: // Shift
			shiftKey = true;
			break;
		case 17: // Ctrl
			ctrlKey = true;
			break;
		default:
			break;
	}
});

window.addEventListener('keyup', event => {
	switch (event.keyCode) {
		case 16: // Shift
			shiftKey = false;
			break;
		case 17: // Ctrl
			ctrlKey = false;
			break;
		default:
			break;
	}
});
