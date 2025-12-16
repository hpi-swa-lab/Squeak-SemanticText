*SemanticText-Model-resolving
semanticWhenSettled: aBlock

	aBlock numArgs = 0 ifFalse: [self error: 'Must be 0-argument block'].
	self
		whenResolved: aBlock;
		whenRejected: aBlock.