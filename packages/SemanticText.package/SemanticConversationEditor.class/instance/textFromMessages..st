private - text
textFromMessages: messages

	^ self textFromConversation:
		(self conversation copy
			defaultToolSpec: nil;
			messages: messages;
			yourself)