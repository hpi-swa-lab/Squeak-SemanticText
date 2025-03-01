*SemanticText-Model-Conversation-converting
semanticContentPartTextOn: aStream

	aStream
		withAttribute: (TextInspectIt on: self)
		do:
			[aStream nextPutAll: '[sound]'].