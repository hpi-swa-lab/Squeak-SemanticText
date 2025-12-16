private - configuration
shouldTranscribe

	^ self config shouldTranscribeInputAudio ifNil: [true]