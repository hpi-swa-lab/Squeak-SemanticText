private - configuration
voiceActivityDetectionStrategy

	^ self config openAIRealtimeVoiceActivityDetectionStrategy ifNil: [#server]