private - requests
parseMessageFrom: messageCompletion for: aConversation logRawOutput: logRawOutput

	| message toolUseBlocks |
	message := SemanticMessage
		conversation: aConversation
		role: messageCompletion role
		content: (messageCompletion content first type = 'text'
			ifTrue: [
				messageCompletion content first text]
			ifFalse: [
				messageCompletion content]).
	
	logRawOutput ifTrue:
		[message rawOutput:
			(JsonObject new
				messageCompletion: messageCompletion;
				yourself)].
	
	toolUseBlocks := messageCompletion content select: [:contentBlock | contentBlock type = 'tool_use'].
	toolUseBlocks size > 0 ifTrue: [
		message toolCalls:
			(self parseToolCallsFrom: toolUseBlocks toolSpec: aConversation activeToolSpec)].
	
	^ message