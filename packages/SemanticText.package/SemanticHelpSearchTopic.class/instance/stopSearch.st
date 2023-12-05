searching
stopSearch

	super stopSearch.
	
	resultConversation ifNotNil:
		[resultConversation currentStreamingMessage ifNotNil: #cancel.
		self dependents do: [:dep |
			((dep respondsTo: #currentTopic) and: [dep currentTopic == self]) ifTrue:
				[resultConversation releaseForEventReceiver: dep]]].
	
	searchRequirements := conversationRequirements := nil.