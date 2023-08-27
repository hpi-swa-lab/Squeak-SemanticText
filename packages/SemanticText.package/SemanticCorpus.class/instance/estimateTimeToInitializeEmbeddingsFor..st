embeddings
estimateTimeToInitializeEmbeddingsFor: someDocuments
	"Minimum time due to rate limits."

	^ (self estimateTokensFor: someDocuments) minutes / self embeddingModel tokensPerMinute