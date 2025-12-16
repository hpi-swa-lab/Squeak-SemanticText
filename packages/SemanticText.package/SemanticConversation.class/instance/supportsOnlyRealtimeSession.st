testing
supportsOnlyRealtimeSession

	^ (self model respondsTo: #isRealtimeModel)
		and: [self model isRealtimeModel]