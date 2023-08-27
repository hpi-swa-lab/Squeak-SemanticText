search-embeddings
findClusteredDocuments: number nearEmbedding: embedding

	| relatedClusters relatednesses |
	self flag: #wip. "not ready for prime time, see comment in #initializeClusters"
	
	relatedClusters := self findClusters: clusters size // 10 nearEmbedding: embedding.
	
	relatednesses := Array new: self documents size streamContents: [:stream |
		relatedClusters do: [:cluster |
			(clusters at: cluster) do: [:doc |
				| distance |
				distance := self distanceBetween: embedding and: doc embedding.
				distance isInfinite ifFalse: [
					stream nextPut: doc -> distance]]]].
	self flag: #optimize. "use flat array instead of associations and write custom sort method. 56% of runtime comes from #->."
	
	relatednesses sort: [:assoc1 :assoc2 | assoc1 value <= assoc2 value]. "faster than sort function"
	self flag: #forLater. "provide similarity value"
	^ (relatednesses take: number) collect: [:assoc | assoc key]