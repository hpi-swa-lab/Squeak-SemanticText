*SemanticText-Model-Conversation-converting
semanticContentPartTextOn: aStream

	aStream
		withAttribute: self asTextAnchor
		do:
			[aStream nextPut: Character startOfHeader].