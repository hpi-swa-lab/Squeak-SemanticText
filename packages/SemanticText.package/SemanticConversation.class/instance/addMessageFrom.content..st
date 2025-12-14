accessing - messages
addMessageFrom: role content: aTextOrContentOrParts

	| message |
	message := (aTextOrContentOrParts isCollection and: [(aTextOrContentOrParts isString or: [aTextOrContentOrParts isText]) not])
		ifTrue: [SemanticMessage role: role contentParts: aTextOrContentOrParts]
		ifFalse: [SemanticMessage role: role content: aTextOrContentOrParts].
	^ self addMessage: message