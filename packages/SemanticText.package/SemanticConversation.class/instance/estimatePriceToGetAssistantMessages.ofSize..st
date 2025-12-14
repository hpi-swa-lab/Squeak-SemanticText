accessing - expenses
estimatePriceToGetAssistantMessages: number ofSize: completionSize

	^ self model
		priceFor: self
		answers: number
		completionSize: completionSize