tools
resolveAllToolCalls

	^ (self lastMessage ifNil: [^ nil]) toolCalls
		do: [:toolCall |
			self addMessage: toolCall asToolMessageWithResult];
		notEmpty