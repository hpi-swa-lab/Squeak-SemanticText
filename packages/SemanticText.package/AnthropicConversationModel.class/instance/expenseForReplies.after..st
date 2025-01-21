private
expenseForReplies: messages after: promptTokens

	| expenseForPrompt expenseForReplies |
	expenseForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	expenseForReplies := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* (messages detectSum: [:message |
			message basicContent
				ifNil: [0]
				ifNotNil: [:content | self countTokensIn: content]]).
	^ expenseForPrompt + expenseForReplies