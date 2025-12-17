server events - input audio buffer
handleInputAudioBufferSpeechStopped: event
	<serverEvent: #'input_audio_buffer.speech_stopped'>

	| message stop |
	message := self messageWithId: event item_id.
	
	stop := event audio_end_ms -  1 "exclusive to inclusive" / 1000.
	
	self stopConsumingInputAudioFor: message stop: stop.
	
	self
		triggerEvent: #speechStopped
		withArguments: {message. stop}.