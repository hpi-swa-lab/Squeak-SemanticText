private - requests
parseStreamedToolCallChunkFrom: toolCallChunk toolSpec: aToolSpecOrNil addTo: aStreamingToolCall

	| argumentsChunk functionNameChunk keyChunk |
	keyChunk := toolCallChunk id.
	functionNameChunk := toolCallChunk function ifNotNil: #name.
	argumentsChunk := toolCallChunk function ifNotNil: #arguments.
	
	aStreamingToolCall addChunkKey: keyChunk tool: functionNameChunk arguments: argumentsChunk do: [:streamingToolCall |
		(streamingToolCall tool isString and: [aToolSpecOrNil notNil]) ifTrue:
			[aToolSpecOrNil toolNamed: streamingToolCall tool ifPresent: [:tool |
				streamingToolCall tool: tool]].
		streamingToolCall arguments isString ifTrue:
			[streamingToolCall arguments:
				([streamingToolCall arguments withBlanksTrimmed parseAsOrderedJson] ifError: [streamingToolCall arguments])]].