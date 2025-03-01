instance creation
conversation: aConversation role: role contentParts: contentParts

	^ self new
		conversation: aConversation;
		role: role;
		contentParts: contentParts;
		yourself