printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPutAll:
		(' - {1} tokens, {2} per token' format:
			{(self maxTokens // 1000) asString , 'K'.
			OpenAIAmount exactCents: self centsPerToken}).