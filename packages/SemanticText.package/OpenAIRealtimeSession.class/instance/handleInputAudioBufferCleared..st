server events - input audio buffer
handleInputAudioBufferCleared: event
	<serverEvent: #'input_audio_buffer.cleared'>

	self triggerEvent: #'input_audio_buffer.cleared'.