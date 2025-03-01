updating
update: what

	what = #voiceName ifTrue:
		[self changedVoiceName].
	what = #voiceState ifTrue:
		[self changed: #voiceState].
	
	super update: what.