private - conversation
functionCallWithId: id

	self conversation messages do: [:message |
		message toolCalls do: [:toolCall |
			toolCall id = id ifTrue: [^ toolCall]]].
	^ nil