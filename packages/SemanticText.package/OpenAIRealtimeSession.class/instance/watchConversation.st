control
watchConversation

	self conversation
		when: #newMessage
			send: #addMessageToSession:
			to: self;
		when: #removedMessage
			send: #removeMessageFromSession:
			to: self.