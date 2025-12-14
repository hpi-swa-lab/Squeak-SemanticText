accessing
maxCharacters

	self flag: #modelConstants.
	
	(self name beginsWith: self class tts1Name) ifTrue:
		[^ 4096].
	
	^ self name caseError