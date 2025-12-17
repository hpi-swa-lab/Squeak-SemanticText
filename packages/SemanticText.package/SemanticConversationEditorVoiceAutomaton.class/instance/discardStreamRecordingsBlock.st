accessing
discardStreamRecordingsBlock

	| realtimeSession |
	realtimeSession := (self conversation ifNil: [^ nil])
		realtimeSession ifNil: [^ nil].
	^ [realtimeSession clearInputAudio]