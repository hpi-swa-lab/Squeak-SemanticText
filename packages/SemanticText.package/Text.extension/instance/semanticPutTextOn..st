*SemanticText-Model-Conversation-filter streaming
semanticPutTextOn: aStream

	self runs withStartStopAndValueDo: [:start :stop :attributes |
		aStream withAttributes: attributes do:
			[aStream next: stop - start + 1 putAll: self string startingAt: start]].