private - events
basicSendClientEvent: event

	eventLog ifNotNil: [eventLog addLast: event].
	
	webSocket send: event openAIWithUnixLineEndings asJsonString.