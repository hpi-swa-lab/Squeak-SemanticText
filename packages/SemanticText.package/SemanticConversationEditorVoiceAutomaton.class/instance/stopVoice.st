public requests
stopVoice

	self discardStreamRecordingsBlock ifNotNil: [:block | block value].
	self stopAllProcesses.