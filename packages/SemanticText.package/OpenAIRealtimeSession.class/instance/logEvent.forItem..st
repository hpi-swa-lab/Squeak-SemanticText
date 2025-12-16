private
logEvent: json forItem: aMessageOrToolCall

	aMessageOrToolCall isSemanticToolCall ifTrue:
		[^ self logEvent: json forItem: (self messageWithToolCall: aMessageOrToolCall)].
	
	aMessageOrToolCall rawOutput ifNotNil: [:rawOutput |
		rawOutput events ifNotNil: [:rawEvents |
			rawEvents addLast: json]].