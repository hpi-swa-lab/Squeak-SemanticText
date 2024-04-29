instance creation
conversation: aConversation role: role content: content

	^ self new
		conversation: aConversation;
		role: role;
		content: content;
		yourself