tests - events
testWhenWithSendTo

	eventSource semanticWhen: #anEvent: with: 9 send: #getTrue to: self.
	
	succeeded := eventSource triggerEvent: #anEvent: with: 6.
	self should: [succeeded isNil].
	
	succeeded := eventSource triggerEvent: #anEvent: with: 9.
	self should: [succeeded].