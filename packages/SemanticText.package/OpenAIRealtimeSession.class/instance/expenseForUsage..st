private
expenseForUsage: usage

	| inputExpense outputExpense |
	inputExpense := usage input_token_details in: [:input |
		| textTokens audioTokens imageTokens cachedTextTokens cachedAudioTokens cachedImageTokens |
		textTokens := input text_tokens.
		audioTokens := input audio_tokens.
		imageTokens := input image_tokens.
		
		input cached_tokens_details ifNotNil: [:cached |
			cachedTextTokens := cached text_tokens.
			textTokens := textTokens - cachedTextTokens.
			cachedAudioTokens := cached audio_tokens.
			audioTokens := audioTokens - cachedAudioTokens.
			cachedImageTokens := cached image_tokens.
			imageTokens := imageTokens - cachedImageTokens].
		
		self model expenseForTokenSpecs:
			{textTokens -> #centsPerPromptToken.
			audioTokens -> #centsPerAudioPromptToken.
			imageTokens -> #centsPerImagePromptToken.
			cachedTextTokens -> #centsPerCachedPromptToken.
			cachedAudioTokens -> #centsPerCachedAudioPromptToken.
			cachedImageTokens -> #centsPerCachedImagePromptToken}].
	
	outputExpense := usage output_token_details in: [:output |
		| textTokens audioTokens |
		textTokens := output text_tokens.
		audioTokens := output audio_tokens.
		
		self model expenseForTokenSpecs:
			{textTokens -> #centsPerCompletionToken.
			audioTokens -> #centsPerAudioCompletionToken}].
	
	^ inputExpense + outputExpense