tools
resolveAllToolCalls

	^ self lastMessage toolCalls
		do: [:toolCall |
			self addMessage: toolCall asToolMessageWithResult];
		notEmpty