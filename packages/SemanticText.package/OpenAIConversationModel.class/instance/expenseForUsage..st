private
expenseForUsage: usage

	| promptTokens promptCachedTokens promptAudioTokens completionTokens completionAudioTokens expenseForPrompt expenseForCompletion |
	promptTokens := usage at: 'prompt_tokens'.
	usage at: 'prompt_tokens_details' ifPresent: [:details |
		details at: 'audio_tokens' ifPresent: [:audioTokens |
			promptAudioTokens := audioTokens.
			promptTokens := promptTokens - promptAudioTokens].
		details at: 'text_tokens' ifPresent: [:textTokens | "indeed optional (only provided by audio models)"
			promptTokens := textTokens].
		promptCachedTokens := details at: 'cached_tokens'.
		promptTokens := promptTokens - promptCachedTokens].
	expenseForPrompt := self expenseForTokenSpecs:
		{promptTokens -> #centsPerPromptToken.
		promptAudioTokens -> #centsPerAudioPromptToken.
		promptCachedTokens -> #centsPerCachedPromptToken}.
	
	completionTokens := usage at: 'completion_tokens'.
	usage at: 'completion_tokens_details' ifPresent: [:details |
		details at: 'audio_tokens' ifPresent: [:audioTokens |
			completionAudioTokens := audioTokens.
			completionTokens := completionTokens - completionAudioTokens].
		details at: 'text_tokens' ifPresent: [:textTokens | "indeed optional (only provided by audio models)"
			completionTokens := textTokens]].
	expenseForCompletion := self expenseForTokenSpecs:
		{completionTokens -> #centsPerCompletionToken.
		completionAudioTokens -> #centsPerAudioCompletionToken}.
	
	^ expenseForPrompt + expenseForCompletion