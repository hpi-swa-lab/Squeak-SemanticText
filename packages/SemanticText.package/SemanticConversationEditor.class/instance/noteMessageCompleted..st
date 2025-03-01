updating
noteMessageCompleted: wasStreaming

	self shouldSpeak ifTrue:
		[| message |
		message := self conversation lastMessage.
		(message role = #assistant and: [message content isEmptyOrNil not]) ifTrue:
			[(self voiceAutomaton shouldSynthesize not and: [wasStreaming])
				ifFalse: [self voiceAutomaton sayMessage: message]
				ifTrue: [self voiceAutomaton doneStreamingMessageAudio: message]]].
	
	(self hasPendingToolCallsFromUser: false) ifFalse:
		[^ self noteReadyForQuestion].
	
	"Handle new tool calls."
	self flag: #forLater. "make a streaming conversation that can do this by itself"
	(self isDisplayingRawConversation and: [self hasUnimplementedToolCalls]) ifTrue:
		[^ self].
	(self resolveAllToolCallsFromUser: false async: true)
		then:
			[:x | self shouldAutomaticallyCompleteToolMessages ifTrue:
				[(self future: 1) "hacked, otherwise text is not updated before???" completeAsIs]].