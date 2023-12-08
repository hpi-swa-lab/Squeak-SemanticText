search-embeddings
findDocuments: number nearEmbedding: embedding collect: collectBlock thenSelect: selectBlock

	| n objects similarDocuments |
	self flag: #forLater. "Possible interface change: Introduce SemanticSearch(Results) class that:
	* provides accesses to relevance scores/distances (and find a name for this)
	* allows for increasing the number of results without starting all over (is this possible?)
	* supports a threshold value? We still don't know how to choose one!
	* offers other arguments such as our n here, nprobe for clustering, etc.
	* [is responsible for instantiating conversations? On the other hand, a good conversation might involve multiple queries.]"
	self flag: #forLater. "Improve quality of results:
	* experiment with different document sizes (see #maxTokens). This would also improve the explainability of results."
	
	n := 10. "Expected number of documents per object. If we find not enough documents, we repeat the search with exponentially higher thresholds."
	[similarDocuments := self findDocuments: number * n nearEmbedding: embedding.
	objects := similarDocuments collect: collectBlock as: OrderedCollection.
	objects := objects withoutDuplicates.
	selectBlock ifNotNil:
		[objects := objects select: selectBlock].
	(objects size >= number or: [number * n >= self documents size]) ifTrue:
		[^ objects take: number].
	n := n squared]
		repeat.