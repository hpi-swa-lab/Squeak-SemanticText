streaming
addChunk: aString tokenProbabilities: newTokenProbabilitiesOrNil

	self content: self basicContent , aString.
	
	newTokenProbabilitiesOrNil ifNotNil:
		[self tokenProbabilities: (self tokenProbabilities ifNil: [#()]) , newTokenProbabilitiesOrNil].
	
	self triggerEvent: #newChunk with: aString.