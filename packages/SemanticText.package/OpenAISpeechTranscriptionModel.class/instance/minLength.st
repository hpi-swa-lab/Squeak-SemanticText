accessing
minLength

	self flag: #modelConstants.
	(self name = self class whisper1Name or: [self name beginsWithAnyOf: {self class gpt4oTranscribeName. self class gpt4oMiniTranscribeName}]) ifTrue:
		[^ 0.1 seconds].
	
	^ self name caseError