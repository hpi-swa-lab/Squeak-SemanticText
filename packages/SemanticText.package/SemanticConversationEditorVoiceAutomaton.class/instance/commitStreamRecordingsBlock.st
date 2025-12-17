accessing
commitStreamRecordingsBlock

	| realtimeSession |
	realtimeSession := (self conversation ifNil: [^ nil])
		realtimeSession ifNil: [^ nil].
	^ [realtimeSession commitInputAudio]