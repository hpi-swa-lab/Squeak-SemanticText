server events - responses
handleResponseContentPartAdded: event
	<serverEvent: #'response.content_part.added'>

	| message |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message.
	
	self flag: #todo. "honor content_index"
	
	event part type caseOf:
		{[#text] -> [self parseStreamedTextPart: event part addTo: message].
		[#audio] -> [self parseStreamedAudioPart: event part addTo: message]}.