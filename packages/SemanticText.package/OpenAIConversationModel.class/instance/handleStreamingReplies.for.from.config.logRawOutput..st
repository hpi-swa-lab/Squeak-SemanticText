private
handleStreamingReplies: number for: aConversation from: aWebResponse config: aConfig logRawOutput: logRawOutput

	| promptTokens |
	promptTokens := self countTokensInConversation: aConversation.
	
	^ SemanticStreamingMessage array: number role: #assistant inBackgroundDo: [:messages |
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
			chunk choices do: [:choice |
				| message |
				message := messages at: choice index + 1.
				self parseStreamedChunk: choice addTo: message rawChatCompletionChunk: (logRawOutput ifTrue: [chunk]).
				choice finish_reason ifNotNil: [message beComplete]]].
		self assert: dataStream next isNil]
			
			ensure:
				[self account
					noteExpense: (self expenseForReplies: messages after: promptTokens)
					forUser: aConfig user
					model: self name]]