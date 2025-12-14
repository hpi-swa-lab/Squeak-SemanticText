ui support
sendUpdatesFromTextModel: aModel selector: textSelector

	self
		when: #newChunk
			send: #semanticNewChunk:from:for:
			to: aModel
			withArguments: {nil. self. textSelector};
		when: #completed
			send: #semanticCompleted:for:
			to: aModel
			withArguments: {self. textSelector}.