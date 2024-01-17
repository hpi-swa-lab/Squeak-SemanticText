private
parseStreamedToolCallChunksFrom: toolCallChunks toolSpec: aToolSpecOrNil message: aStreamingMessage

	| newToolCalls |
	newToolCalls := Dictionary new: toolCallChunks size.
	toolCallChunks do: [:toolCallChunk |
		| index toolCall |
		index := toolCallChunk index + 1.
		toolCall := aStreamingMessage toolCalls at: index ifAbsent:
			[newToolCalls at: index put:
				(SemanticStreamingToolCall key: '' tool: ''arguments: '')].
		self parseStreamedToolCallChunkFrom: toolCallChunk toolSpec: aToolSpecOrNil addTo: toolCall].
	^ newToolCalls withKeysSorted