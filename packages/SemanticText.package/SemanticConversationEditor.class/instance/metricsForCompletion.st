accessing
metricsForCompletion

	| messagesAndToolSpecs newConversation promptTokens |
	messagesAndToolSpecs := self messagesAndToolSpecsFromText: self editText.
	newConversation := self conversation copy
		messages: messagesAndToolSpecs first asOrderedCollection;
		toolSpecs: messagesAndToolSpecs second;
		yourself.
	
	promptTokens := newConversation estimatePromptTokens.
	^ Dictionary new
		at: #promptTokens put: promptTokens;
		at: #maxTokens put: newConversation model maxTokens;
		at: #promptTokenFraction put: promptTokens / newConversation model maxPromptTokens;
		at: #maxCompletionTokens put: newConversation maxCompletionTokens;
		at: #price put: newConversation estimatePriceToGetAssistantMessage;
		yourself