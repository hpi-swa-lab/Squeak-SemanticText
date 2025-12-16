requests
commitInputAudios: aSound

	| messageId newMessage |
	messageId := self sendCommitInputAudioBuffer wait.
	(self messageWithId: messageId) ifNotNil: [:message | ^ message].
	
	newMessage := SemanticStreamingMessage
		conversation: self conversation
		role: #user
		contentParts:
			(Array streamContents: [:stream |
				stream nextPut: aSound.
				self shouldTranscribe ifTrue:
					[stream nextPut: '']]).
	newMessage id: messageId.
	^ self addMessageFromServer: newMessage