private - requests
audioInputSamplingRate

	self isRealtimeModel ifTrue: [^ OpenAIRealtimeSession inputSamplingRate].
	^ nil