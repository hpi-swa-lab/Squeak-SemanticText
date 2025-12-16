accessing
streamRecordingsBlock

	| realtimeSession |
	realtimeSession := (self conversation ifNil: [^ nil])
		realtimeSession ifNil: [^ nil].
	realtimeSession when: #speechStarted send: #stopSpeaking to: self.
	^ [:sound | realtimeSession isRunning ifTrue: [realtimeSession appendInputAudio: sound]]