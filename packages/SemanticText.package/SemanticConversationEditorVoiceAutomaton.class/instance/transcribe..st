private
transcribe: aSound

	self voiceState: #transcribing.
	
	self shouldTranscribe ifFalse:
		[^ self addSound: aSound].
	(self basicTranscribe: aSound) ifNotEmpty: [:transcription |
		self addTranscription: transcription].