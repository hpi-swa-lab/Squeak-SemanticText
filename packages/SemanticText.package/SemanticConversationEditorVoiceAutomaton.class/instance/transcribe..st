private
transcribe: aSound

	self voiceState: #transcribing.
	
	(self basicTranscribe: aSound) ifNotEmpty: [:transcription |
		self addTranscription: transcription].