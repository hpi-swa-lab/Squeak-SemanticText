printing
printOn: aStream

	super printOn: aStream.
	
	self isBilledPerCharacter
		ifTrue:
			[aStream nextPutAll:
				(' - {1} characters, {2} per character' format:
					{self maxCharacters.
					OpenAIAmount exactCents: self centsPerCharacter})]
		ifFalse:
			[aStream nextPutAll:
				(' - {1} tokens, {2} text in/{3} audio out' format:
					{self maxInputTokens.
					OpenAIAmount exactCents: self centsPerInputToken.
					OpenAIAmount exactCents: self centsPerOutputAudioToken})].