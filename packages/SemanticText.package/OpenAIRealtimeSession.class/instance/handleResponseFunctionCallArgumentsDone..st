server events - responses
handleResponseFunctionCallArgumentsDone: event
	<serverEvent: #'response.function_call_arguments.done'>

	| message functionCall |
	functionCall := self functionCallWithId: event item_id.
	message := self conversation messages detect: [:ea | ea toolCalls includes: functionCall].
	self logEvent: event forItem: message.
	
	self assertFunctionCall: functionCall equals: event.
	
	functionCall beComplete.