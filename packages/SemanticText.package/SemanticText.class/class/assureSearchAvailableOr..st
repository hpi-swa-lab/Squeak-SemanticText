support
assureSearchAvailableOr: requirementsBlock

	| model |
	model := self defaultEmbeddingModelOrNil ifNil:
		[^ requirementsBlock value:
			{{#embeddingModel. 'install an embedding model'. [self defaultEmbeddingModel]}}].
	
	^ model assureAvailableOr: requirementsBlock