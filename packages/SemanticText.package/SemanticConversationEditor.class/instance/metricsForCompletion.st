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
		at: #totalExpense put: self conversation estimateTotalExpense; "NB: If the user has manually edited the conversation before, this will be missing here. Store and aggregate expenses in the editor instead?"
		yourself