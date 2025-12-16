private - conversation
messageWithToolCall: aToolCall

	^ self conversation messages detect: [:ea |
		ea toolCalls includes: aToolCall]