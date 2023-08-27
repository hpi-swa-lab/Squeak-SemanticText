private
expenseForUsage: usage

	^ (OpenAIAmount exactCents: self centsPerToken)
		* (usage at: 'prompt_tokens')