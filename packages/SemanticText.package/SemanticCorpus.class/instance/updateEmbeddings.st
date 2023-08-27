embeddings
updateEmbeddings

	^ self initializeEmbeddingsFor: (self documents select: [:ea | ea embedding isNil])