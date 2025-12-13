*SemanticText-Providers-OpenAI-token counting
openAICountAudioTokensForRole: role

	^ role caseOf:
		{[#user] -> [self openAICountAudioTokensForInput].
		[#assistant] -> [self openAICountAudioTokensForOutput]}