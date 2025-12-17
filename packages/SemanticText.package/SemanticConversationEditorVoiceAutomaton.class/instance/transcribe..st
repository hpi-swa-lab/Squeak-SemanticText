private
transcribe: aSound 

	self voiceState: #transcribing.
	
	self commitStreamRecordingsBlock ifNotNil: [:block |
		| message |
		message := block value.
		^ self emit: [self triggerEvent: #conversationChanged with: message]].
	
	self shouldTranscribe ifFalse:
		[^ self addSound: aSound].
	(self basicTranscribe: aSound) ifNotEmpty: [:transcription |
		self addTranscription: transcription].