service
compressAllEmbeddings: embeddings toSize: newSize
	"Answer a copy of the collection argument with all embeddings lossy compressed."

	({self class embedding3LargeName. self class embedding3SmallName} includes: self name) ifFalse:
		[^ self error: 'This model cannot compress embeddings'].
	
	^ embeddings collect: [:embedding |
		(embedding first: newSize) normalize]