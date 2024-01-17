documentation
exampleFunctions

	| conversation message weather |
	weather := SemanticFunction
		fromString: 'getCurrentWeather "Get the current weather in a given location"
			(location: string "The city and state, e.g. San Francisco, CA")'
		action: [:args |
			(args location includesSubstring: 'New York')
				ifTrue:
					[JsonObject new location: args location; temperature: 21; unit: #celsius; forecast: #('sunny' 'windy'); yourself]
				ifFalse:
					[JsonObject new location: args location; temperature: 11; unit: #celsius; forecast: #('rainy'); yourself]].

	conversation := SemanticConversation newStreaming.
	message := conversation
		addUserMessage: 'Is the weather better in Boston or NYC?';
		pushFunctions: {weather} "force: #(getCurrentWeather)";
		getAssistantMessage.
	message waitUntilComplete.
	conversation resolveAllToolCalls ifTrue:
		[message := conversation getAssistantMessage].
	message inspect.