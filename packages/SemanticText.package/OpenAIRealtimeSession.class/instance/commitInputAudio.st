requests
commitInputAudio

	| messageId newMessage |
	messageId := self sendCommitInputAudioBuffer wait.
	(self messageWithId: messageId) ifNotNil: [:message |
		message contentParts first setSamples: self consumeInputAudio samplingRate: self inputSamplingRate.
		^ message].
	
	newMessage := SemanticStreamingMessage
		conversation: self conversation
		role: #user
		contentParts:
			(Array streamContents: [:stream |
				stream nextPut:
					(SampledSound samples: self consumeInputAudio samplingRate: self inputSamplingRate).
				self shouldTranscribe ifTrue:
					[stream nextPut: '']]).
	newMessage id: messageId.
	^ self addMessageFromServer: newMessage