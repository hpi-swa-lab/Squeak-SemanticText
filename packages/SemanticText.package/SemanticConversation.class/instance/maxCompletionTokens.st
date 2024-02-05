accessing
maxCompletionTokens

	| tokens |
	tokens := self model maxTokens - self estimatePromptTokens clampLow: 0.
	
	(self model baseConfig updatedWith: self config) maxTokens ifNotNil: [:maxTokens |
		tokens := tokens clampHigh: maxTokens].
	
	tokens := tokens clampHigh: self model maxCompletionTokens.
	
	^ tokens