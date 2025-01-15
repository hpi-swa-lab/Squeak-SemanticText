private
handleStreamingReplies: number for: aConversation from: responseBlock config: aConfig logRawOutput: logRawOutput

	| promptTokens toolSpec trackExpense |
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
							messageChunks: OrderedCollection new;
							yourself)]].
					
			trackExpense := [:usage |
				usage ifNotNil: [:u |
					expense := self expenseForUsage: u.
					self assignExpense: expense toMessages: messages]].
			
			self flag: #todo.
			[(data := dataStream next) = nil] whileFalse:
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
						message rawOutput messageChunks addLast: chunk]].
				
				chunk type caseOf: {
					"Is fired at the very beginning. Only useful because it contains a `usage` field with the initial input tokens consumed (and a single output token)."
					['message_start'] -> [trackExpense value: chunk message usage].
					"Signals the start of a new content block (either text or tool_use). The tool_use one contains the name and ID of the function being called."
					['content_block_start'] -> [
						self flag: #todo.
					].
					"This contains the actual message text deltas"
					['content_block_delta'] -> [self parseStreamedChunk: chunk toolSpec: toolSpec addTo: msg].
					"Fired near the end, contains only `usage`"
					['message_delta'] -> [trackExpense value: chunk usage].
					"Fired when message is complete"
					['message_stop'] -> [msg beComplete]
				} otherwise: ["Some events are not relevant and can be safely ignored"]].
			
			self assert: dataStream next isNil]

				ensure:
					[self account
						noteExpense:
							(expense ifNil: [self expenseForReplies: messages after: promptTokens])
						forUser: aConfig user
						model: self name]]