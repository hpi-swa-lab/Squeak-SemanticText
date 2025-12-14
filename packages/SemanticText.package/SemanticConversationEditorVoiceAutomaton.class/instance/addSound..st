private
addSound: aSound

	| message |
	self triggerEvent: #conversationRequested.
	
	message := self conversation addMessage:
		(SemanticMessage role: #user content: aSound).
	self flag: #forLater. "make this customizable! do not record this message? allow clients to customize it through config?"
	
	self emit: [self triggerEvent: #conversationChanged with: message].