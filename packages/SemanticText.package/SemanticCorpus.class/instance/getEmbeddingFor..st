private
getEmbeddingFor: query

	embeddingCache ifNil: [embeddingCache := LRUCache size: 32 factory: [:someQuery |
		self embeddingModel
			getEmbeddingFor: someQuery
			config: self embeddingConfig]].
	^ embeddingCache at: query