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
			
			"[DONE] is not a thing for Anthropic. The equivalent is:
			event: message_stop
			data: {'type:' 'message_stop'}"
			self flag: #todo.
			[#('[DONE]' nil) includes: (data := dataStream next)] whileFalse:
				[| chunk msg |
				chunk := data utf8ToSqueak parseAsJson openAIWithSqueakLineEndings.
				msg := messages last.
				(chunk at: #error) ifNotNil: [:error |
					OpenAIError
						signalForType: error type
						parameter: error param
						code: error code
						message: error message].
				logRawOutput ifTrue:
					[messages do: [:message |
						message rawOutput chatCompletionChunks addLast: chunk]].
				
				"TODO: Lets do caseOf:otherwise:" 
				
				(chunk type = 'content_block_delta') ifTrue: [
					self parseStreamedChunk: chunk toolSpec: toolSpec addTo: msg.
				].
				(chunk type = 'message_delta') ifTrue: [
					chunk usage ifNotNil: [:usage |
					expense := self expenseForUsage: usage.
					self assignExpense: expense toMessages: messages]
				].
				(chunk type = 'message_stop') ifTrue: [msg beComplete]].
			self assert: dataStream next isNil]
				
				ensure:
					[self account
						noteExpense:
							(expense ifNil: [self expenseForReplies: messages after: promptTokens])
						forUser: aConfig user
						model: self name]]