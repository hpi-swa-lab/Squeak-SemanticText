server events
handleError: event
	<serverEvent: #'error'>

	| error exception |
	error := event at: #error.
	exception := OpenAIError
		type: error type
		parameter: error param
		code: error code
		message: error message.
	error event_id ifNotNil: [:id |
		exception tag: (eventLog ifNotNil: [eventLog detect: [:ea | ea event_id = id]] ifNil: [id]).
		
		promises at: id ifPresent: [:promise |
			self haltIf: promise isResolved. "this would be a race condition with #stopped"
			promise rejectWith: exception.
			^ self]].
	^ exception signal