accessing
addMessageFrom: role content: content

	^ self addMessage: (ChatGPTMessage role: role content: content)