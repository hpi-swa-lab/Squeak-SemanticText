server events - conversation items
handleConversationItemInputAudioTranscriptionDelta: event
	<serverEvent: #'conversation.item.input_audio_transcription.delta'>

	| message contentPart |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	contentPart := message contentParts at: event content_index + 1.
	self assert: contentPart semanticIsSound.
	
	message addChunk: event delta toolCalls: nil tokenProbabilities:
		(event logprobs ifNotNil: [:logprobs | self model parseTokenProbabilitiesFrom: logprobs]).