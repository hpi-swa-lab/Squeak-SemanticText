instance creation
newFor: aConversation model: model

	^ self new
		conversation: aConversation;
		model: model;
		yourself