private
basicSayMessage: aMessage

	| sound |
	self voiceState: #speaking.
	
	sound := aMessage content semanticToSpeechWithConfigDo: [:config |
		(SemanticText defaultSpeechSynthesisModel class allVoices includes: self voiceName)
			ifTrue: [config voice: self voiceName].
		config speed: self voiceSpeed].
	
	[self playAndWaitUntilDone: sound]
		ensure:
			[self voiceState: nil].
	
	(aMessage = self conversation lastMessage and: [self shouldListen] and: [self shouldSpeak]) ifTrue:
		[self startListening].