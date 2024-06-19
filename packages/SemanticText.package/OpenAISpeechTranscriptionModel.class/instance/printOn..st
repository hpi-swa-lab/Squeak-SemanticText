printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPutAll:
		(' - {1} per minute' format:
			{OpenAIAmount exactCents: self centsPerMinute}).