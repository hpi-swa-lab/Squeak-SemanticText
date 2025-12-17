accessing
maxInputTokens

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniTtsName) ifTrue:
		[^ 2000].
	
	^ self name caseError