private
textFromToolCalls: toolCalls

	^ Text streamContents: [:stream |
		toolCalls
			do: [:toolCall |
				stream nextPutAll:
					(self textFromToolCall: toolCall)]
			separatedBy: [stream cr]]