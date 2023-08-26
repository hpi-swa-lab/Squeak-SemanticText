private
expenseForReply: aMessage after: promptTokens

	| expenseForPrompt expenseForReply |
	expenseForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	expenseForReply := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* (self countTokensIn: aMessage basicContent).
	^ expenseForPrompt + expenseForReply