server events - responses
handleResponseOutputItemDone: event
	<serverEvent: #'response.output_item.done'>

	| item message |
	event item type caseOf:
		{['message'] -> [item := message := self messageWithId: event item id].
		['function_call'] ->
			[item := self functionCallWithId: event item id.
			message := self conversation messages detect: [:ea | ea toolCalls includes: item]]}.
	self logEvent: event forItem: message.
	
	message ifNotNil:
		[message beComplete].