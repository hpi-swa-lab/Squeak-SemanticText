server events - input audio buffer
handleInputAudioBufferCommitted: event
	<serverEvent: #'input_audio_buffer.committed'>

	self triggerEvent: #'input_audio_buffer.committed' with: event item_id.