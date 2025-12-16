parsing
readOrderedFrom: aStream

	self dictionaryClass: SemanticStreamingOrderedJsonObject.
	^ self readFrom: aStream