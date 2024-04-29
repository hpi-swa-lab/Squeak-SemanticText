private
handleStreamingReplies: number for: aConversation from: aWebResponse config: aConfig logRawOutput: logRawOutput

	| promptTokens toolSpec |
	promptTokens := self countTokensInConversation: aConversation.
	toolSpec := aConversation activeToolSpec.
	
	^ SemanticStreamingMessage
		conversation: aConversation
		array: number
		role: #assistant
		inBackgroundDo: [:messages |
			[| dataStream data |
			dataStream := self streamEventDataFrom: aWebResponse.
			
			logRawOutput ifTrue:
				[messages do: [:message |
					message rawOutput:
						(JsonObject new
							chatCompletionChunks: OrderedCollection new;
							chatCompletionChunkChoices: OrderedCollection new;
							yourself)]].
			
			[#('[DONE]' nil) includes: (data := dataStream next)] whileFalse:
				[| chunk |
				chunk := data utf8ToSqueak parseAsJson.
				(chunk at: #error) ifNotNil: [:error |
					OpenAIError
						signalForType: error type
						parameter: error param
						code: error code
						message: error message].
				chunk choices do: [:choice |
					| message |
					message := messages at: choice index + 1.
					self parseStreamedChunk: choice toolSpec: toolSpec addTo: message rawChatCompletionChunk: (logRawOutput ifTrue: [chunk]).
					choice finish_reason ifNotNil: [message beComplete]]].
			self assert: dataStream next isNil]
				
				ensure:
					[self account
						noteExpense: (self expenseForReplies: messages after: promptTokens)
						forUser: aConfig user
						model: self name]]