*SemanticText-Providers-OpenAI-converting
asOpenAIContentPartObject

	self assert: (self semanticAllAttributes allSatisfy: [:ea | ea isKindOf: SemanticTokenProbabilityTag]).
	^ self string asOpenAIContentPartObject