initialize-release
releaseForAllEvents

	self releaseActionMap.
	self realtimeSession ifNotNil: [:session | session releaseForAllEvents].
	self messages do: [:message |
		message releaseForAllEvents].