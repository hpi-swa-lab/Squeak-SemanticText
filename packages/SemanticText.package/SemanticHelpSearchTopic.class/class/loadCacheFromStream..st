caches
loadCacheFromStream: aStream

	| cacheCorpus |
	cacheCorpus := SemanticSimpleCorpus fromStream: aStream.
	cacheCorpus documents do: [:document |
		| key |
		key := document text base64Decoded asByteArray.
		self cachedEmbeddings
			at: key
			put: document embedding].