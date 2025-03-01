private
expenseForReplies: messages after: promptTokens

	| expenseForPrompt expenseForReplies |
	expenseForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	expenseForReplies := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* (messages detectSum: [:message |
			self countTokensInMessage: message]).
	^ expenseForPrompt + expenseForReplies