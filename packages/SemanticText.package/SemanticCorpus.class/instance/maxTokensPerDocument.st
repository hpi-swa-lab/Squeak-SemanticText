private
maxTokensPerDocument

	self flag: #magicNumber. "Well ... this was used in the OpenAI cookbook as an arbitrary example. This is NOT a limitation of the embeddingModel! Nor is it the result of careful prompt tuning! We could likely change this and experiment with different values."
	^ 1600