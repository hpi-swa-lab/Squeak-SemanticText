streaming
addChunkKey: keyChunkOrNil tool: toolChunkOrNil arguments: argumentsChunkOrNil do: aBlock

	keyChunkOrNil ifNotNil:
		[self key: self key , keyChunkOrNil].
	toolChunkOrNil ifNotNil:
		[self tool: self toolName , toolChunkOrNil].
	argumentsChunkOrNil ifNotNil:
		[self arguments: self argumentsJsonString , argumentsChunkOrNil].
	
	aBlock cull: self.
	
	self triggerEvent: #newChunk.
	self flag: #todo. "notify about new properties?"