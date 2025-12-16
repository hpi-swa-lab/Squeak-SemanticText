client events
sendClearInputAudioBuffer

	^ self
		sendClientEvent: #'input_audio_buffer.clear'
		result: #'input_audio_buffer.cleared'