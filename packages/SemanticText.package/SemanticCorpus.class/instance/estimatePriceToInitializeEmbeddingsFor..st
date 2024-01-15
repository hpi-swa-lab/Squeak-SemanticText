embeddings
estimatePriceToInitializeEmbeddingsFor: someDocuments
	"NOTE: This is a randomized and really rough estimation! Better evaluate a couple of times. We should probably offer a 95% confidence interval ... Also note that known prices for the model provider might be out of date."

	| sample texts |
	(self embeddingModel respondsTo: #priceForAll:) ifFalse: [^ nil].
	
	sample := (1000 clampHigh: someDocuments size) timesCollect: [someDocuments atRandom].
	texts := sample collect: [:doc | doc text].
	^ (self embeddingModel priceForAll: texts) * someDocuments size / sample size