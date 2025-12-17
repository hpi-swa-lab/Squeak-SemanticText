accessing
centsPerInputTextToken

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniTranscribeName) ifTrue: [^ 0.000125s].
	(self resolvedName beginsWith: self class gpt4oTranscribeDiarizeName) ifTrue: [^ 0.00025s].
	(self resolvedName beginsWith: self class gpt4oTranscribeName) ifTrue: [^ 0.00025s].
	
	^ self name caseError
		