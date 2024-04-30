private
privateStyle: aText

	| intervalMessages |
	self privateUnstyle: aText.
	
	intervalMessages := [(editor
		ifNotNil: [editor intervalMessagesFromText: aText]
		ifNil: [SemanticConversationEditor intervalMessagesFromText: aText isDisplayingRawConversation: false])]
			ifError: [^ self].
	intervalMessages keysAndValuesDo: [:message :interval |
		self applyMessageMarkupsFor: message interval: interval to: aText.
		aText
			addAllAttributes: (self attributesForRole: message role)
			from: interval start
			to: interval stop].