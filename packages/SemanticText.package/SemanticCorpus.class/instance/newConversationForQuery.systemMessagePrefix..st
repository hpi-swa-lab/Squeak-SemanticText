search - conversation
newConversationForQuery: aString systemMessagePrefix: systemMessagePrefixOrNil

	^ self
		newConversationForQuery: aString
		systemMessage:
			(systemMessagePrefixOrNil
				ifNil: [self systemMessageForConversationQueries]
				ifNotNil: [systemMessagePrefixOrNil , String cr , String cr , self systemMessageForConversationQueries])