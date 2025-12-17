accessing
allVoices

	self flag: #modelConstants.
	
	(self name beginsWith: self class tts1Name) ifTrue:
		[^ #(nova shimmer echo onyx fable alloy ash sage coral)].
	
	(self resolvedName beginsWith: self class gpt4oMiniTtsName) ifTrue:
		[^ #(alloy ash ballad coral echo fable onyx nova sage shimmer verse)].
	
	^ self name caseError