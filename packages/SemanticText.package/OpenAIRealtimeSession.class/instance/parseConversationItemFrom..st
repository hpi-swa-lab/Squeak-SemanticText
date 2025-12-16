parsing
parseConversationItemFrom: json

	^ json type = 'function_call'
		ifTrue: [self parseFunctionCallFrom: json]
		ifFalse: [self parseMessageFrom: json]