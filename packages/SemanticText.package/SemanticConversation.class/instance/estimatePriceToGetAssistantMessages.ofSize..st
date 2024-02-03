accessing
estimatePriceToGetAssistantMessages: number ofSize: completionSize

	^ self model
		priceFor: self completion
		answers: number
		completionSize: completionSize