private - text
textFromToolCalls: toolCalls inConversation: aConversation

	^ Text streamContents: [:stream |
		| displayedToolCalls truncatedToolCalls |
		displayedToolCalls := toolCalls.
		truncatedToolCalls := 0.
		"self isDisplayingRawConversation ifFalse:
			[displayedToolCalls size > 3 ifTrue:
				[truncatedToolCalls := displayedToolCalls size - 3.
				displayedToolCalls := displayedToolCalls first: 3]]."
		displayedToolCalls
			do: [:toolCall |
				stream nextPutAll:
					(self textFromToolCall: toolCall inConversation: aConversation)]
			separatedBy:
				[self isDisplayingRawConversation
					ifFalse: [stream space]
					ifTrue: [stream cr]].
		truncatedToolCalls > 0 ifTrue:
			[stream
				nextPutAll: '... (';
				print: truncatedToolCalls;
				nextPutAll: ' more not shown)']]