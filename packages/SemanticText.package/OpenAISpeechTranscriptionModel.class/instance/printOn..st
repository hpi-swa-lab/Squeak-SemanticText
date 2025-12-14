printing
printOn: aStream

	super printOn: aStream.
	
	self isBilledPerSecond
		ifTrue:
			[aStream nextPutAll:
				(' - {1} per minute' format:
					{OpenAIAmount exactCents: self centsPerMinute})]
		ifFalse:
			[aStream nextPutAll:
				(' - {1} audio in/{2} text in/{3} text out' format:
					{OpenAIAmount exactCents: self centsPerAudioToken.
					OpenAIAmount exactCents: self centsPerInputTextToken.
					OpenAIAmount exactCents: self centsPerOutputTextToken})].