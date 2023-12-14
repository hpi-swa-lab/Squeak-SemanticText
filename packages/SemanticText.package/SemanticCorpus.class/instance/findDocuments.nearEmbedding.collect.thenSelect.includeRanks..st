search-embeddings
findDocuments: number nearEmbedding: embedding collect: collectBlock thenSelect: selectBlock includeRanks: includeRanks

	| n similarDocuments objects |
	self flag: #forLater. "Possible interface change: Introduce SemanticSearch(Results) class that:
	* allows for increasing the number of results without starting all over (is this possible?)
	* supports a threshold value? We still don't know how to choose one!
	* offers other arguments such as our n here, nprobe for clustering, etc.
	* [is responsible for instantiating conversations? On the other hand, a good conversation might involve multiple queries.]"
	self flag: #forLater. "Improve quality of results:
	* experiment with different document sizes (see #maxTokens). This would also improve the explainability of results."
	
	n := 10. "Expected number of documents per object. If we find not enough documents, we repeat the search with exponentially higher thresholds."
	[similarDocuments := self findDocuments: number * n nearEmbedding: embedding includeRanks: includeRanks.
	objects := includeRanks
		ifFalse: [(similarDocuments collect: collectBlock as: OrderedCollection) withoutDuplicates]
		ifTrue: [similarDocuments keys orderedGroupBy: collectBlock].
	selectBlock ifNotNil:
		[objects := includeRanks
			ifFalse: [objects select: selectBlock]
			ifTrue: [objects associations select: [:assoc | selectBlock value: assoc key]]].
	(objects size >= number or: [number * n >= self documents size]) ifTrue:
		[objects := objects take: number.
		^ includeRanks
			ifFalse: [objects]
			ifTrue:
				[(objects isDictionary ifTrue: [objects] ifFalse: [objects as: OrderedDictionary])
					collect: [:documents |
						(documents collect: [:doc | similarDocuments at: doc]) max]]].
	n := n squared]
		repeat.