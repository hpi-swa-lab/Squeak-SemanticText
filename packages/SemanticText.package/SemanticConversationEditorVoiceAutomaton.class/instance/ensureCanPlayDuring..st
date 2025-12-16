private
ensureCanPlayDuring: aBlock

	SoundPlayer canStartPlayer ifTrue: [^ aBlock value].
	
	^ SoundRecorder pauseRecordingDuring: aBlock