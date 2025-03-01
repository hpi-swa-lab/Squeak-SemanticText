private
handleStreamingReplies: number for: aConversation from: responseBlock config: aConfig logRawOutput: logRawOutput

	| promptTokens toolSpec |
	promptTokens := self countTokensInConversation: aConversation.
	toolSpec := aConversation activeToolSpec.
	
	^ SemanticStreamingMessage
		conversation: aConversation
		array: number
		role: #assistant
		inBackgroundDo: [:messages |
			| expense |
			[| dataStream data |
			dataStream := self streamEventDataFrom: responseBlock value.
			
			logRawOutput ifTrue:
				[messages do: [:message |
					message rawOutput:
						(JsonObject new
							chatCompletionChunks: OrderedCollection new;
							chatCompletionChunkChoices: OrderedCollection new;
							yourself)]].
			
			[#('[DONE]' nil) includes: (data := dataStream next)] whileFalse:
				[| chunk |
				chunk := data utf8ToSqueak parseAsJson openAIWithSqueakLineEndings.
				(chunk at: #error) ifNotNil: [:error |
					OpenAIError
						signalForType: error type
						parameter: error param
						code: error code
						message: error message].
				logRawOutput ifTrue:
					[messages do: [:message |
						message rawOutput chatCompletionChunks addLast: chunk]].
				chunk choices ifNotNil: [:choices |
					choices do: [:choice |
						| message |
						message := messages at: choice index + 1.
						self parseStreamedChunk: choice toolSpec: toolSpec addTo: message.
						choice finish_reason ifNotNil: [message beComplete]]].
				chunk usage ifNotNil: [:usage |
					expense := self expenseForUsage: usage.
					self assignExpense: expense toMessages: messages]].
			self assert: dataStream next isNil]
				
				ensure:
					[self account
						noteExpense:
							(expense ifNil: [self expenseForReplies: messages after: promptTokens])
						forUser: aConfig user
						model: self name]]