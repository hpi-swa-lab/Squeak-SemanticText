accessing
commitStreamRecordingsBlock

	| realtimeSession |
	realtimeSession := (self conversation ifNil: [^ nil])
		realtimeSession ifNil: [^ nil].
	^ [:sound | realtimeSession commitInputAudios: sound samples]