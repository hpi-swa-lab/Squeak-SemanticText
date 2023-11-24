private
maxTokensForConversation

	self flag: #magicNumber. "Well ... this was used in the OpenAI cookbook as an arbitrary example. This is NOT a limitation of the conversationModel! Nor is it the result of careful prompt tuning! We could likely change this and experiment with different values."
	^ 3200