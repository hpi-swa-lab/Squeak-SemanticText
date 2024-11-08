private
expenseForUsage: usage

	| billedPromptTokens expenseForPrompt expenseForCompletion |
	billedPromptTokens := usage at: 'prompt_tokens'.
	usage at: 'prompt_tokens_details' ifPresent: [:details |
		billedPromptTokens := billedPromptTokens - (details at: 'cached_tokens')].
	
	expenseForPrompt := (OpenAIAmount exactCents: self centsPerPromptToken)
		* billedPromptTokens.
	expenseForCompletion := (OpenAIAmount exactCents: self centsPerCompletionToken)
		* (usage at: 'completion_tokens').
	^ expenseForPrompt + expenseForCompletion