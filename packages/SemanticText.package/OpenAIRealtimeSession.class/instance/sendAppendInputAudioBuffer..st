client events
sendAppendInputAudioBuffer: aSound

	^ self sendClientEvent: #'input_audio_buffer.append' with:
		(JsonObject new
			audio: (aSound openAIRealtimeAsPCMBase64String ifNil: [^ self]);
			yourself)