service
compressEmbedding: embedding toSize: newSize
	"Answer a lossy compressed copy of the embedding."

	^ (self compressAllEmbeddings: {embedding} toSize: newSize) first