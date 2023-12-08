caches
updateEmbeddingsIn: aCorpus

	| pendingDocuments |
	pendingDocuments := Dictionary new.
	aCorpus documents do: [:document |
		| key |
		"Do not use topics themselves as keys since their life cycle is too short and they are not easily serializable."
		key := self hashForKey: document text asString.
		self cachedEmbeddings
			at: key
			ifPresent: [:embedding | document embedding: embedding]
			ifAbsent: [pendingDocuments at: key put: document]].
	
	aCorpus updateEmbeddings.
	
	pendingDocuments keysAndValuesDo: [:key :document |
		self cachedEmbeddings
			at: key
			ifAbsentPut: [document embedding]].