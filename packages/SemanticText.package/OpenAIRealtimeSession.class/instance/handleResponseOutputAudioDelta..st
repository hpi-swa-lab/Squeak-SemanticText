server events - responses
handleResponseOutputAudioDelta: event
	<serverEvent: #'response.output_audio.delta'>

	| message contentPart |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	contentPart := message contentParts at: event content_index + 1.
	self assert: contentPart semanticIsSound.
	
	self parseStreamedAudioDelta: event delta addTo: message part: contentPart.