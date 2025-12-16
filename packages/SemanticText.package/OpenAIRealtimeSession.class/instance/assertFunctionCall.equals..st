parsing
assertFunctionCall: aFunctionCall equals: json

	self assert: aFunctionCall toolName = json name.
	self assert: aFunctionCall key = json call_id.
	(aFunctionCall isStreaming and: [aFunctionCall isComplete not]) ifFalse:
		[self assert: aFunctionCall arguments asJsonString parseAsJson = json arguments withBlanksTrimmed parseAsJson].