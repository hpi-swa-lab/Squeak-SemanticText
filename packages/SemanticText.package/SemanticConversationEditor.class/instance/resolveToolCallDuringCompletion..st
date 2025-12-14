private
resolveToolCallDuringCompletion: aToolCall

	| toolMessage |
	Processor activeProcess priority <= Project current uiProcess priority ifFalse:
		[^ (self future resolveToolCallDuringCompletion: aToolCall) wait].
	
	(self isDisplayingRawConversation and:
		[self isUnimplementedToolCall: aToolCall]) ifTrue: 
			[^ nil].
	
	toolMessage := self conversation basicResolveToolCall: aToolCall.
	
	^ self shouldAutomaticallyCompleteToolMessages
		ifTrue: [toolMessage]