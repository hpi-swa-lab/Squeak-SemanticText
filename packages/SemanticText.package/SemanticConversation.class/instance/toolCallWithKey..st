accessing - messages
toolCallWithKey: key

	self messages do: [:message |
		message toolCalls do: [:toolCall |
			toolCall key = key ifTrue: [^ toolCall]]].
	^ nil