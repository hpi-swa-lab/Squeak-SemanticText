embeddings
estimateTokensFor: someDocuments
	"NOTE: This is a randomized and really rough estimation! Better evaluate a couple of times. We should probably offer a 95% confidence interval ..."

	| sample texts |
	sample := (1000 clampHigh: someDocuments size) timesCollect: [someDocuments atRandom].
	texts := sample collect: [:doc | doc text].
	^ (texts detectSum: [:text | self embeddingModel countTokensIn: text])
		* (someDocuments size / sample size)