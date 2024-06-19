updating
update: what

	what = #voiceState ifTrue:
		[self changed: #voiceState].
	
	super update: what.