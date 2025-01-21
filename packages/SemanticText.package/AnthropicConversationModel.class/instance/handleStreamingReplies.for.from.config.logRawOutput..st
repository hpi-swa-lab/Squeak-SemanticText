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
			
			[(data := dataStream next) = nil] whileFalse:
				[| chunk msg chunkText chunkToolCall |
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
						"Create new toolcall"
						chunk content_block type = 'tool_use' ifTrue: [
							chunkToolCall := (SemanticStreamingToolCall
								key: chunk content_block id
								tool: chunk content_block name
								arguments: chunk content_block input)]
					].
					"This contains the actual message text deltas or tool use JSON input deltas"
					['content_block_delta'] -> [
						chunk delta type caseOf: {
							['text_delta'] -> [chunkText := chunk delta text].
							['input_json_delta'] -> [
								| aStreamingToolCall argumentsChunk |
								"This should be getting the tool call using `chunk index`, but `chunk index` represents the index of the content block (so the first tool call would have an index of 1 (with 0-based indexing)), since the content_block at index 0 is a text content block."
								self flag: #todo.
								aStreamingToolCall := msg toolCalls last.
								argumentsChunk := chunk delta partial_json.
								argumentsChunk ifNotEmpty: [
									aStreamingToolCall arguments:
										(aStreamingToolCall arguments isString ifTrue: [aStreamingToolCall arguments , argumentsChunk]
											ifFalse: [argumentsChunk])]
							]
						} otherwise: [:deltaType | self error: 'got unknown content_block_delta type: ' , deltaType].
					].
					"Useful for knowing when a tool call has finished streaming so we can parse its input JSON"
					['content_block_stop'] -> [
						| toolCall |
						self flag: #todo. "See above note"
						toolCall := msg toolCalls ifNotEmpty: [msg toolCalls last] ifEmpty: [nil].
						toolCall ifNotNil: [
							(toolCall tool isString and: [toolSpec notNil]) ifTrue:
								[toolSpec toolNamed: toolCall tool ifPresent: [:tool |
									toolCall tool: tool]].
							toolCall arguments:
								([toolCall arguments parseAsOrderedJson] ifError: [toolCall arguments])
						]
					].
					"Fired near the end, contains only `usage`"
					['message_delta'] -> [trackExpense value: chunk usage].
					"Fired when message is complete"
					['message_stop'] -> [msg beComplete]
				} otherwise: ["Some events are not relevant and can be safely ignored"].
				
				(chunkText isEmptyOrNil and: [chunkToolCall isNil]) ifFalse:
					[msg addChunk: chunkText toolCalls: (chunkToolCall ifNotNil: [{chunkToolCall}]) tokenProbabilities: nil]].
			
			self assert: dataStream next isNil]

				ensure:
					[self account
						noteExpense:
							(expense ifNil: [self expenseForReplies: messages after: promptTokens])
						forUser: aConfig user
						model: self name]]