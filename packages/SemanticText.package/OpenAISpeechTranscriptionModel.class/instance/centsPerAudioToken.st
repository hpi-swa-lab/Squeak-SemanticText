accessing
centsPerAudioToken

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniTranscribeName) ifTrue: [^ 0.0003s].
	(self resolvedName beginsWith: self class gpt4oTranscribeDiarizeName) ifTrue: [^ 0.0006s].
	(self resolvedName beginsWith: self class gpt4oTranscribeName) ifTrue: [^ 0.0006s].
	
	^ self name caseError