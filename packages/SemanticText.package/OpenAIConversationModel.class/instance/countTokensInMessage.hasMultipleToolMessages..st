private - tokens
countTokensInMessage: aMessage hasMultipleToolMessages: hasMultipleToolMessages
	"Approximation! Adopted from https://github.com/hmarr/openai-chat-tokens."

	| compiledContent tokens |
	compiledContent := String streamContents: [:stream |
		(aMessage isToolMessage and: [hasMultipleToolMessages])
			ifFalse:
				[aMessage basicContent ifNotNil: [:content |
					stream nextPutAll: content]]
			ifTrue:
				[stream nextPutAll: aMessage basicContent.
				self flag: #todo. "should use JSON formatting of the API"].
		
		"not yet implemented"
		"aMessage messageName ifNotNil: [:messageName |
			stream nextPutAll: messageName]."
		
		(aMessage role = #assistant and: [aMessage toolCalls notEmpty]) ifTrue:
			[aMessage toolCalls do: [:toolCall |
				stream
					nextPutAll: toolCall toolName;
					nextPutAll: toolCall arguments asJsonString]]].
	
	tokens := self countTokensIn: compiledContent.
	
	"special tokens per input message"
	aMessage isToolMessage
		ifFalse: [tokens := tokens + 3]
		ifTrue:
			[| toolContent |
			tokens := tokens + 2.
			toolContent := [aMessage basicContent parseAsJson] ifError: [nil].
			toolContent isDictionary ifTrue:
				[tokens := tokens - toolContent keys size]].
	
	"not yet implemented"
	"(aMessage messageName notNil and: [aMessage isToolMessage not]) ifTrue:
		[tokens := tokens + 1]."
	aMessage toolCalls ifNotEmpty: [:toolCalls |
		tokens := tokens +
			(toolCalls detectSum: [:toolCall |
				| toolCallTokens |
				toolCallTokens := 3.
				toolCallTokens := toolCallTokens + (self countTokensIn: toolCall type).
				toolCall type = #function ifTrue:
					[toolCallTokens := toolCallTokens + ((self countTokensIn: toolCall toolName) * 2).
					toolCall arguments ifNotEmpty: [:arguments |
						toolCallTokens := toolCallTokens +
							(self countTokensIn:
								(String streamContents: [:stream |
									self printFunctionCallArguments: arguments on: stream]))]].
					toolCallTokens]).
		tokens := tokens +
			(toolCalls size > 1
				ifTrue: [15 - (toolCalls size * 5 - 6)]
				ifFalse: [-2])].
	
	^ tokens