accessing
centsPerInputTextToken

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt4oTranscribeName] -> [0.00025s].
		[self class gpt4oTranscribeDiarizeName] -> [0.00025s].
		[self class gpt4oMiniTranscribeName] -> [0.000125s]}