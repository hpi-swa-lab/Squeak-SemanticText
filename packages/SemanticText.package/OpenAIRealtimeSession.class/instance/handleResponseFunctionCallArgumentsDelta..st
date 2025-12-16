server events - responses
handleResponseFunctionCallArgumentsDelta: event
	<serverEvent: #'response.function_call_arguments.delta'>

	| message functionCall |
	functionCall := self functionCallWithId: event item_id.
	message := self conversation messages detect: [:ea | ea toolCalls includes: functionCall].
	self logEvent: event forItem: message.
	
	functionCall addArgumentsChunk: event delta.