printing
printOn: aStream

	super printOn: aStream.
	
	self resolvedName = self name ifFalse:
		[aStream
			nextPutAll: ' (';
			nextPutAll: self resolvedName;
			nextPut: $)].
	
	aStream nextPutAll:
		(' - {1} tokens, {2} in/{3} out' format:
			{(self maxTokens // 1000) asString , 'K'.
			OpenAIAmount exactCents: self centsPerPromptToken.
			OpenAIAmount exactCents: self centsPerCompletionToken}).
	(self canUnderstandAudio or: [self canGenerateAudio]) ifTrue:
		[aStream nextPutAll:
			(', audio {1} in/{2} out' format:
				{OpenAIAmount exactCents: self centsPerAudioPromptToken.
				OpenAIAmount exactCents: self centsPerAudioCompletionToken})].