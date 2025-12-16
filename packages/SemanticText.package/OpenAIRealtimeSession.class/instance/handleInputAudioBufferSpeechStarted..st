server events - input audio buffer
handleInputAudioBufferSpeechStarted: event
	<serverEvent: #'input_audio_buffer.speech_started'>

	| message messageId start |
	messageId := event item_id.
	message := self messageWithId: messageId.
	message ifNil:
		[message := SemanticStreamingMessage
			conversation: self conversation
			role: #user
			contentParts:
				(Array streamContents: [:stream |
					stream nextPut:
						(SampledSound samples: #() samplingRate: self inputSamplingRate).
					self shouldTranscribe ifTrue:
						[stream nextPut: '']]).
		message id: messageId.
		self addMessageFromServer: message].
	
	start := event audio_start_ms / 1000.
	message propertyValueAt: #speechStart put: start.
	
	self startConsumingInputAudioFor: message start: start.
	
	self
		triggerEvent: #speechStarted
		withArguments: {message. start}.