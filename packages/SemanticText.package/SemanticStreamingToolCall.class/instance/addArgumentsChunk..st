streaming
addArgumentsChunk: argumentsChunk

	self streamedArgumentsString: self streamedArgumentsString , argumentsChunk.
	
	self triggerEvent: #newChunk with: argumentsChunk.