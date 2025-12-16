public requests
stopSpeaking

	self isSpeaking ifTrue:
		[[self skipCurrentMessage] doWhileTrue:
			[#(basicSayStreamingMessageAudio:at: basicDoneStreamingMessageAudio:) includes: self currentMessageName]].