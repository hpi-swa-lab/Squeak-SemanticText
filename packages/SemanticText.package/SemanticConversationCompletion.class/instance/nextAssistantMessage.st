assistant messages
nextAssistantMessage

	| newMessage |
	newMessage := self conversation getAssistantMessageWithConfig: self config.
	self currentAssistantMessage: newMessage.
	^ newMessage