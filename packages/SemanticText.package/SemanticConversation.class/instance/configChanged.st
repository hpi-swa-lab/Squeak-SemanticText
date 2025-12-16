private
configChanged

	self realtimeSession ifNotNil: [:session | session updateSession].