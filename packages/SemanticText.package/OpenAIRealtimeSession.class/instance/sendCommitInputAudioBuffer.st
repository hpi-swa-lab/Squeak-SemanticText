client events
sendCommitInputAudioBuffer

	^ self
		sendClientEvent: #'input_audio_buffer.commit'
		result: #'input_audio_buffer.committed'