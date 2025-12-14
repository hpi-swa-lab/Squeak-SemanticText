accessing
maxInputTokens

	self flag: #modelConstants.
	
	self name = self class gpt4oMiniTtsName ifTrue:
		[^ 2000].
	
	^ self name caseError