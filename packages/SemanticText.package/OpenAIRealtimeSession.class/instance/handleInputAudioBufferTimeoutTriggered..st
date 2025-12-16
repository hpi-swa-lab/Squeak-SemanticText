server events - input audio buffer
handleInputAudioBufferTimeoutTriggered: event
	<serverEvent: #'input_audio_buffer.timeout_triggered'>

	| message stop |
	message := self messageWithId: event item_id.
	
	stop := event audio_end_ms -  1 "exclusive to inclusive" / 1000.
	
	self
		triggerEvent: #speechTimeout
		withArguments: {message. stop}.