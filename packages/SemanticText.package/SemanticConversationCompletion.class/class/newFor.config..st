instance creation
newFor: aConversation config: aConfigOrNil

	^ self new
		conversation: aConversation;
		config: aConfigOrNil;
		yourself