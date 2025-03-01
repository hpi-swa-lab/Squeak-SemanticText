accessing
shouldTranscribe

	^ self basicShouldTranscribe ifNil:
		[((self conversation ifNil: [^ self defaultShouldTranscribe])
			model ifNil: [^ self defaultShouldTranscribe])
				canUnderstandAudio not]