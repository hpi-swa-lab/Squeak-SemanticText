search - ranking
rankObjects: objects clusteredSampleForQuery: queryOrNil take: anInteger

	| localClusters queryEmbedding sample |
	anInteger = 0 ifTrue: [^ #()].
	objects ifEmpty: [^ objects].
	
	({queryOrNil ifNotNil:
		[[queryEmbedding := self getEmbeddingFor: queryOrNil]].
	[localClusters := self
		fromDocuments: (self documentsForObjects: objects)
		makeClusters: (anInteger clampHigh: objects size)
		maxIterations: 300]}
			copyWithout: nil)
				semanticConcurrentCollect: #value.
	
	sample := (queryEmbedding
		ifNil: [localClusters keys]
		ifNotNil:
			[localClusters do: [:cluster |
				cluster sort: [:document | document embedding dot: queryEmbedding] descending].
			localClusters keys
				collect: [:center | center -> ((center dot: queryEmbedding) ** 5)]
				as: Dictionary])
			randomSample: anInteger * 10.
	sample := sample collect: [:center |
		(localClusters at: center)
			ifNotEmpty: [:cluster | cluster removeFirst object]
			ifEmpty: [nil]].
	sample := (sample copyWithout: nil) withoutDuplicates.
	^ sample take: anInteger