*SemanticText-Model-Search-converting
semanticWithoutLeading: prefix

	^ (self beginsWith: prefix)
		ifTrue: [self allButFirst: prefix size]
		ifFalse: [self]