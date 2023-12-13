search-embeddings
findDocuments: number nearEmbedding: embedding useClusters: useClusters includeRanks: includeRanks
	"Note: Ranking of results is invariant of length of the embedding argument."

	| documentsAndRanks |
	documentsAndRanks := useClusters
		ifTrue: [self basicFindClusteredDocuments: number nearEmbedding: embedding]
		ifFalse: [self basicFindAllDocuments: number nearEmbedding: embedding].
	^ includeRanks
		ifFalse:
			[documentsAndRanks collect: [:assoc | assoc key]]
		ifTrue:
			[documentsAndRanks
				collect: [:assoc | assoc key -> (1 - assoc value)]
				as: OrderedDictionary]