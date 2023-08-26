private
expenseForUsage: usage

	| expenseForCompletion expenseForPrompt |
	expenseForPrompt := (OpenAIAmount exactCents: self centsPerPromptToken)
		* (usage at: 'prompt_tokens').
	expenseForCompletion := (OpenAIAmount exactCents: self centsPerCompletionToken)
		* (usage at: 'completion_tokens').
	^ expenseForPrompt + expenseForCompletion