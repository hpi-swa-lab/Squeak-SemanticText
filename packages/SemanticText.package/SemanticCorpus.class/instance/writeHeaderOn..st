fileIn/Out
writeHeaderOn: aStream
	"may be overridden by subclasses"

	| metadata |
	metadata := JsonObject new.
	self storeMetadataIn: metadata.
	metadata jsonWriteOn: aStream.
	
	aStream cr. "just for the eyes"