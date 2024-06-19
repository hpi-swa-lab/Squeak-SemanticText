printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPutAll:
		(' - {1} characters, {2} per character' format:
			{self maxCharacters.
			OpenAIAmount exactCents: self centsPerCharacter}).