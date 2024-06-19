accessing
voiceState: aSymbol

	voiceState := aSymbol.
	self emit: [self changed: #voiceState].