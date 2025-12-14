updating
update: what

	what = #speechSynthesisConfig ifTrue:
		[self changedSpeechSynthesisConfig].
	what = #speechTranscriptionConfig ifTrue:
		[self changedSpeechTranscriptionConfig].
	what = #speechTranscriptionModel ifTrue:
		[self changedSpeechTranscriptionModel].
	what = #voiceState ifTrue:
		[self changed: #voiceState].
	
	super update: what.