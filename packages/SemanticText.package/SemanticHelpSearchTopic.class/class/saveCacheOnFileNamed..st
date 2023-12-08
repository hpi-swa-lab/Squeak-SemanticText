caches
saveCacheOnFileNamed: fileName

	| cacheCorpus |
	cacheCorpus := SemanticSimpleCorpus new.
	self cachedEmbeddings keysAndValuesDo: [:key :embedding |
		| document |
		document := SemanticSimpleDocument forText: key base64Encoded.
		document embedding: embedding.
		cacheCorpus addDocument: document].
	^ cacheCorpus writeOnFileNamed: fileName