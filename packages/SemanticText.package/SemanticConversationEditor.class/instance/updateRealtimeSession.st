private
updateRealtimeSession

	self conversation realtimeSession
		ifNil:
			[self conversation supportsRealtimeSession ifTrue:
				[self startRealtimeSessionFromUser: true]]
		ifNotNil:
			[self conversation supportsRealtimeSession ifFalse:
				[self stopRealtimeSession]].