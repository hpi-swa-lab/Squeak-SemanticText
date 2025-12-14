accessing
centsPerOutputTextToken

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt4oTranscribeName] -> [0.001s].
		[self class gpt4oTranscribeDiarizeName] -> [0.001s].
		[self class gpt4oMiniTranscribeName] -> [0.0005s]}