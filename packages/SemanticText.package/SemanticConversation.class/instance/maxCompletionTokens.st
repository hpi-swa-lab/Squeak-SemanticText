accessing - expenses
maxCompletionTokens

	| tokens |
	tokens := self model maxTokens - self estimatePromptTokens clampLow: 0.
	
	self effectiveConfig maxTokens ifNotNil: [:maxTokens |
		tokens := tokens clampHigh: maxTokens].
	
	tokens := tokens clampHigh: self model maxCompletionTokens.
	
	^ tokens