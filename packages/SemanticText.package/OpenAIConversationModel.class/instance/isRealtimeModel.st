testing
isRealtimeModel

	self flag: #modelConstants.
	
	^ self resolvedName beginsWithAnyOf: {self class gptRealtimeName. self class gpt4oRealtimeName. self class gpt4oMiniRealtimeName}