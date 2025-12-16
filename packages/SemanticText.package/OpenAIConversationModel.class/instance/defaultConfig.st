initialize-release
defaultConfig

	^ SemanticConversationConfig new
		in: [:config |
			self isRealtimeModel ifTrue:
				[config shouldDetectVoiceActivity: true]];
		yourself