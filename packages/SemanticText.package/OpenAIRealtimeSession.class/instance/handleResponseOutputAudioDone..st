server events - responses
handleResponseOutputAudioDone: event
	<serverEvent: #'response.output_audio.done'>

	| message contentPart |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	contentPart := message contentParts at: event content_index + 1.
	self assert: contentPart semanticIsSound.