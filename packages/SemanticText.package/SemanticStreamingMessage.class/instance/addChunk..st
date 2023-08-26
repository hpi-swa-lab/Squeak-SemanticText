streaming
addChunk: aString

	self content: self basicContent , aString.
	self triggerEvent: #newChunk with: aString.