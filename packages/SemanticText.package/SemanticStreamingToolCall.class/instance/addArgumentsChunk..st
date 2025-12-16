streaming
addArgumentsChunk: argumentsChunk

	self streamedArgumentsString: self streamedArgumentsString , argumentsChunk.
	self propertyValueAt: #argumentsReader ifPresent: [:reader |
		reader nextPutAll: argumentsChunk].
	
	self triggerEvent: #newChunk with: argumentsChunk.