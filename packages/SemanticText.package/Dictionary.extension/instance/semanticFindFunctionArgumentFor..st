*SemanticText-Model-Conversation-accessing
semanticFindFunctionArgumentFor: aParameter

	^ aParameter required
		ifTrue: [self at: aParameter name]
		ifFalse: [self at: aParameter name ifAbsent: [nil]]