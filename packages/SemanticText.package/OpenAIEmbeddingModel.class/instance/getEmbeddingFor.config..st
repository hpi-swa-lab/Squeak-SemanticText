service
getEmbeddingFor: aString config: aConfigOrNil
	"Answer an embedding for aString. The embedding vector is a Float32Array."

	| embeddings |
	embeddings := self getEmbeddingsForAll: {aString} config: aConfigOrNil.
	self assert: embeddings size = 1.
	^ embeddings first