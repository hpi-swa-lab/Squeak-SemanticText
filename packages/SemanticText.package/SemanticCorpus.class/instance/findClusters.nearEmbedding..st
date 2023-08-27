search-embeddings
findClusters: number nearEmbedding: embedding

	| relatednesses |
	self flag: #duplication. "with #findAllDocuments:nearEmbedding: (source of truth)"
	
	relatednesses := Array new: clusters size // 10 streamContents: [:stream |
		clusters keysDo: [:cluster |
			| distance |
			distance := self distanceBetween: embedding and: cluster.
			distance isInfinite ifFalse: [
				stream nextPut: cluster -> distance]]].
	self flag: #optimize. "use flat array instead of associations and write custom sort method. 56% of runtime comes from #->."
	
	relatednesses sort: [:assoc1 :assoc2 | assoc1 value <= assoc2 value]. "faster than sort function"
	^ (relatednesses take: number) collect: [:assoc | assoc key]