*SemanticText-Providers-OpenAI-token counting
openAICountTokensOrCompileTo: aStream

	| detail visionTokens |
	detail := 512 asPoint >= self extent
		ifTrue: [#low]
		ifFalse: [#high].
	self flag: #todo. "we do not yet support custom specification of detail".
	
	visionTokens := detail caseOf:
		{[#low] -> [85].
		[#high] -> [85 + (170 * self extent / 512 asPoint) ceiling area]}.
	self flag: #todo. "in practice we are off by ~400 tokens! hardcoded below to be safe for upper approximation. todo, look again into other implementations."
	visionTokens := visionTokens + 400.
	^ visionTokens