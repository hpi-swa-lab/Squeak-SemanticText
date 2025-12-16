private - requests
parseStreamedToolCallChunkFrom: toolCallChunk toolSpec: aToolSpecOrNil addTo: aStreamingToolCall

	toolCallChunk id ifNotNil: [:id |
		aStreamingToolCall key: id].
	
	toolCallChunk function ifNotNil: [:function |
		function name ifNotNil: [:name |
			aStreamingToolCall tool:
				((aToolSpecOrNil ifNotNil: [aToolSpecOrNil toolNamed: name ifAbsent: [nil]])
					ifNil: [name])].
		
		function arguments ifNotNil: [:argumentsChunk |
			aStreamingToolCall addArgumentsChunk: argumentsChunk]].