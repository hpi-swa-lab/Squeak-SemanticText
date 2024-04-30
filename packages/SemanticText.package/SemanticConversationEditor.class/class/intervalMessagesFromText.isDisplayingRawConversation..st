support
intervalMessagesFromText: aText isDisplayingRawConversation: isDisplayingRawConversation

	self
		conversationFromText: aText
		isDisplayingRawConversation: isDisplayingRawConversation
		intervalsDo: [:intervals |
			^ intervals associationsSelect: [:messageOrToolSpecAndInterval |
				(messageOrToolSpecAndInterval key isKindOf: SemanticToolSpec) not]].