accessing
centsPerAudioToken

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt4oTranscribeName] -> [0.0006s].
		[self class gpt4oTranscribeDiarizeName] -> [0.0006s].
		[self class gpt4oMiniTranscribeName] -> [0.0003s]}