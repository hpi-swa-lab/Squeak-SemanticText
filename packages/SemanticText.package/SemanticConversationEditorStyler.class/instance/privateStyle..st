private
privateStyle: aText

	| messages |
	self privateUnstyle: aText.
	
	messages := (editor ifNil: [SemanticConversationEditor]) messagesFromText: aText.
	messages keysAndValuesDo: [:interval :message |
		self applyMessageMarkupsFor: message interval: interval to: aText.
		aText
			addAllAttributes: (self attributesForRole: message role)
			from: interval start
			to: interval stop].