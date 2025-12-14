assistant messages
waitForAssistantResponse

	[[self currentAssistantMessage waitUntilComplete]
		ifCurtailed: [self currentAssistantMessage cancel].
	
	self currentAssistantMessage
		propertyValueAt: #responseCompleted
		ifPresent: [:promise | promise wait]]
			
			ifCurtailed:
				[| responseMessages |
				responseMessages := (self conversation messages copyAfter: self currentAssistantMessage)
					copyWithFirst: self currentAssistantMessage.
				responseMessages reversed
					detect: [:ea | ea isStreaming]
					ifFound: [:ea | ea cancel]]