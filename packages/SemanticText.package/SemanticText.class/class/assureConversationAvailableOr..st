support
assureConversationAvailableOr: requirementsBlock

	| model |
	model := self defaultConversationModelOrNil ifNil:
		[^ requirementsBlock value:
			{{#conversationModel. 'install a conversation model'. [self defaultConversationModel]}}].
	
	^ model assureAvailableOr: requirementsBlock