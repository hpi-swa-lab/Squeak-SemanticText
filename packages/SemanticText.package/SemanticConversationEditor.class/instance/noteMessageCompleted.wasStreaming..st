updating - conversation
noteMessageCompleted: aMessage wasStreaming: wasStreaming

	self shouldSpeak ifTrue:
		[(aMessage isAssistantMessage and: [aMessage content isEmptyOrNil not]) ifTrue:
			[(self voiceAutomaton shouldSynthesize not and: [wasStreaming])
				ifFalse: [self voiceAutomaton sayMessage: aMessage]
				ifTrue: [self voiceAutomaton doneStreamingMessageAudio: aMessage]]].