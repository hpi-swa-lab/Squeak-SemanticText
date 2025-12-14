searching
generateReply

	conversationRequirements := nil.
	SemanticText assureConversationAvailableOr: [:requirements |
		conversationRequirements := requirements.
		^ self triggerUpdateContents].
	
	resultConversation := self corpus
		newConversationForQuery: self term
		systemMessagePrefix: 'You are an AI assistant that sits in the interactive help browser of Squeak/Smalltalk.'.
	
	(resultConversation isStreaming and: [resultConversation isComplete not]) ifFalse:
		[^ self triggerUpdateContents].
	
	resultConversation
		when: #newMessage evaluate: [:message |
			(message isStreaming and: [message isComplete not])
				ifFalse: [self triggerUpdateContents]
				ifTrue:
					[Project current addDeferredUIMessage: [self updateContents].
					self dependents do: [:dep |
						((dep respondsTo: #currentTopic) and: [dep currentTopic == self]) ifTrue:
							[message sendUpdatesFromTextModel: dep selector: #topicContents.
							message removeActionsWithReceiver: dep forEvent: #completed "preserve cursorText until final #triggerUpdateContents to reduce flickering"]].
					message when: #completed send: #triggerUpdateContents to: self]];
		when: #completed evaluate:
			[resultConversation
				removeActionsForEvent: #newMessage;
				removeActionsForEvent: #completed].