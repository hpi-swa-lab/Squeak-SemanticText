private
handleStreamingReplyFor: aConversation from: aWebResponse config: aConfig

	| promptTokens |
	promptTokens := self countTokensInConversation: aConversation.
	
	^ SemanticStreamingMessage role: #assistant inBackgroundDo: [:message |
		[| dataStream data |
		dataStream := self streamEventDataFrom: aWebResponse.
		[#('[DONE]' nil) includes: (data := dataStream next)] whileFalse:
			[| chunk chunkText |
			chunk := data utf8ToSqueak parseAsJson.
			chunkText := chunk choices first delta content.
			chunkText isEmptyOrNil ifFalse:
				[message addChunk: chunkText]].
		self assert: dataStream next isNil]
			
			ensure:
				[self account
					noteExpense: (self expenseForReply: message after: promptTokens)
					forUser: aConfig user
					model: self name]]