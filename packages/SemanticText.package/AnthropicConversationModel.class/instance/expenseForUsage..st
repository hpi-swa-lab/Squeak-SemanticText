private
expenseForUsage: usage
	
	| inputTokens outputTokens cacheCreationInputTokens cacheReadInputTokens |
	inputTokens := (usage at: 'input_tokens') ifNil: 0.
	outputTokens := (usage at: 'output_tokens') ifNil: 0.
	cacheCreationInputTokens := (usage at: 'cache_creation_input_tokens') ifNil: 0.
	cacheReadInputTokens := (usage at: 'cache_read_input_tokens') ifNil: 0.
	
	"- Cache write tokens are 25% more expensive than base input tokens
	 - Cache read tokens are 90% cheaper than base input tokens
	 - Regular input and output tokens are priced at standard rates"

	^ ((OpenAIAmount exactCents: self centsPerPromptToken) * inputTokens) +
		((OpenAIAmount exactCents: self centsPerCompletionToken) * outputTokens) +
		((OpenAIAmount exactCents: self centsPerPromptToken) * cacheCreationInputTokens * 1.25) +
		((OpenAIAmount exactCents: self centsPerPromptToken) * cacheReadInputTokens * 0.1)