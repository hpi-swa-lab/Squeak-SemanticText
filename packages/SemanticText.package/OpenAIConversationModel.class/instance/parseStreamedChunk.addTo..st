private
parseStreamedChunk: chatCompletionChunk addTo: aStreamingMessage

	| chunkText |
	chunkText := chatCompletionChunk delta content.
	
	chunkText isEmptyOrNil ifFalse:
		[aStreamingMessage addChunk: chunkText].