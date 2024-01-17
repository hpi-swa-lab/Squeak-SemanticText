streaming
addChunk: aString

	self content: (self basicContent ifNil: ['']) , aString.
	self triggerEvent: #newChunk with: aString.