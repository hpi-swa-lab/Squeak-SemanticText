updating - conversation
updateStreamingToolCall: aToolCall

	(aToolCall isStreaming and: [aToolCall isComplete not]) ifFalse:
		[^ self].
	
	self future changed: #text with: self text.
	
	aToolCall sendUpdatesFromTextModel: self selector: #text.