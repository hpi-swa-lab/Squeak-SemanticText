*SemanticText-Model-Conversation-enumerating
semanticAnyOverlappingPairSatisfy: aBlock

	self overlappingPairsDo: [:first :second | (aBlock value: first value: second) ifTrue: [^ true]].
	^ false