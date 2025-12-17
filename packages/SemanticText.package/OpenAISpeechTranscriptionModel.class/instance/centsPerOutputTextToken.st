accessing
centsPerOutputTextToken

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniTranscribeName) ifTrue: [^ 0.0005s].
	(self resolvedName beginsWith: self class gpt4oTranscribeDiarizeName) ifTrue: [^ 0.001s].
	(self resolvedName beginsWith: self class gpt4oTranscribeName) ifTrue: [^ 0.001s].
	
	^ self name caseError