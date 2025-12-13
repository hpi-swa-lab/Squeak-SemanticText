private
expenseForReplies: messages after: promptTokens audio: promptAudioTokens

	| expenseForPrompt expenseForReplies |
	expenseForPrompt := self expenseForTokenSpecs:
		{promptTokens -> #centsPerPromptToken.
		promptAudioTokens -> #centsPerAudioPromptToken}.
	expenseForReplies := self expenseForTokenSpecs:
		{(messages detectSum: [:message |
			self countTokensInMessage: message]) -> #centsPerCompletionToken.
		(messages detectSum: [:message |
			self countAudioTokensInMessage: message]) -> #centsPerAudioCompletionToken}.
	
	^ expenseForPrompt + expenseForReplies