private
privateStyle: aText

	| messages |
	self privateUnstyle: aText.
	
	messages := SemanticConversationEditor messagesFromText: aText.
	messages keysAndValuesDo: [:interval :message |
		aText
			addAllAttributes: (self attributesForRole: message role)
			from: interval start
			to: interval stop].