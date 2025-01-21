private - requests
parseToolCallsFrom: toolCalls toolSpec: aToolSpecOrNil

	^ toolCalls collect: [:toolCall |
		self parseToolCallFrom: toolCall toolSpec: aToolSpecOrNil]