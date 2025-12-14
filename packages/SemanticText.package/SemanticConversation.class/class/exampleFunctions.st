documentation
exampleFunctions

	| temperature rain conversation message |
	temperature := SemanticFunction
		fromString: 'getTemperature "Get the current temperature in a given location"
			(location: string "The city and state, e.g. San Francisco, CA",
			unit?: {"type": "string", "enum": ["celsius", "fahrenheit"]})'
		argsAction: [:location :unit |
			(location includesSubstring: 'New York')
				ifTrue:
					[JsonObject new location: location; temperature: 21; unit: unit; yourself]
				ifFalse:
					[JsonObject new location: location; temperature: 11; unit: unit; yourself]].
	rain := SemanticFunction
		fromString: 'getRain "Get amount of rain in a given location. Returns value between 0 (no rain) and 100 (very much rain."
			(location: string "The city and state, e.g. San Francisco, CA")'
		action: [:args |
			(args location includesSubstring: 'New York')
				ifTrue:
					[JsonObject new location: args location; rain: 60; yourself]
				ifFalse:
					[JsonObject new location: args location; rain: 0; yourself]].

	conversation := SemanticConversation new.
	message := conversation
		addUserMessage: 'Is the weather better in Boston or NYC? Use all information sources you can access.';
		pushFunctions: {temperature. rain} "force: #(getTemperature)" "force: #any";
		getCompleteAssistantMessage.
	message inspect.