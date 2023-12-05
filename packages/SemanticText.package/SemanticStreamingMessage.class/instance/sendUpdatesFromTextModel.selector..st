ui support
sendUpdatesFromTextModel: aModel selector: textSelector

	self
		when: #newChunk
			send: #semanticNewChunk:fromConversation:for:
			to: aModel
			withArguments: {nil. self. textSelector};
		when: #completed
			send: #semanticCompletedConversation:for:
			to: aModel
			withArguments: {self. textSelector}.