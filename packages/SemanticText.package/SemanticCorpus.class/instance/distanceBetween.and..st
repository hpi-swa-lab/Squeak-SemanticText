private
distanceBetween: embedding and: anotherEmbedding
	"Answer the cosine distance between both embeddings. The length of embeddings is ignored, so senders have to take care not to compare differences between pairs of vectors with different total scalars."

	anotherEmbedding ifNil: [^ Float infinity].
	
	^ 1.0 - (embedding dot: anotherEmbedding)