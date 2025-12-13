accessing
metricsForCompletion

	| newConversation promptTokens promptAudioTokens |
	newConversation := self conversationFromUserText.
	
	promptTokens := newConversation estimatePromptTokens.
	promptAudioTokens := newConversation countPromptAudioTokens.
	^ Dictionary new
		at: #promptTokens put: promptTokens;
		at: #promptAudioTokens put: promptAudioTokens;
		at: #maxTokens put: newConversation model maxTokens;
		at: #promptTokenFraction put: promptTokens / newConversation model maxPromptTokens;
		at: #maxCompletionTokens put: newConversation maxCompletionTokens;
		at: #priceRange put:
			{newConversation estimateMinimumPriceToGetAssistantMessage.
			newConversation estimateMaximumPriceToGetAssistantMessage};
		at: #totalExpense put: self conversation totalExpense; "NB: If the user has manually edited the conversation before, this will be missing here. Store and aggregate expenses in the editor instead?"
		yourself