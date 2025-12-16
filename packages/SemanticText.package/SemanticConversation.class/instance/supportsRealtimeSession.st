testing
supportsRealtimeSession

	^ (self model respondsTo: #isRealtimeModel)
		and: [self model isRealtimeModel]