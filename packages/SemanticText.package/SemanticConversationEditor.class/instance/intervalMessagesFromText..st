private - text
intervalMessagesFromText: aText

	self conversationFromText: aText intervalsDo: [:intervals |
		^ intervals associationsSelect: [:messageOrToolSpecAndInterval |
			(messageOrToolSpecAndInterval key isKindOf: SemanticToolSpec) not]].