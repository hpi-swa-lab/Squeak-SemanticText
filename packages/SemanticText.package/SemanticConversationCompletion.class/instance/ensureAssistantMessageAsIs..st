assistant messages
ensureAssistantMessageAsIs: aBoolean

	| currentMessage hasAssistantMessage useExisting |
	currentMessage := self conversation lastMessage.
	useExisting := aBoolean and:
		[hasAssistantMessage := currentMessage notNil and: [currentMessage isAssistantMessage]].
	useExisting
		ifTrue: [self currentAssistantMessage: currentMessage]
		ifFalse: [self nextAssistantMessage].