parsing
parseStreamedTextPart: textPart addTo: aStreamingMessage

	| chunkText |
	chunkText := textPart text.
	chunkText isEmptyOrNil ifFalse:
		[aStreamingMessage addChunk: chunkText].