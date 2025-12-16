server events - responses
handleResponseOutputTextDelta: event
	<serverEvent: #'response.output_text.delta'>

	| message |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	self flag: #todo. "honor content_index"
	message addChunk: event delta.