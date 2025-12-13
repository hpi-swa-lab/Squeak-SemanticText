*SemanticText-Providers-OpenAI-token counting
openAICountAudioTokensForOutput

	^ (self duration seconds / 50 milliSeconds) ceiling