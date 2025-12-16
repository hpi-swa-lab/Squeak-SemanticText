accessing
allVoices

	self isRealtimeModel ifTrue: [^ OpenAIRealtimeSession allVoices].
	^ self class allAudioVoices