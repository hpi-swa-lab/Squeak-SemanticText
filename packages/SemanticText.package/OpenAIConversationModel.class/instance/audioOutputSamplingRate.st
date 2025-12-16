private - requests
audioOutputSamplingRate

	self isRealtimeModel ifTrue: [^ OpenAIRealtimeSession outputSamplingRate].
	^ 24000