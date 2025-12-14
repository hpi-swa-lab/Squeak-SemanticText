*SemanticText-Providers-OpenAI-token counting
openAICountTokensOrCompileTo: aStream

	self assert: (self semanticAllAttributes allSatisfy: [:ea | ea isKindOf: SemanticTokenProbabilityTag]).
	^ self string openAICountTokensOrCompileTo: aStream