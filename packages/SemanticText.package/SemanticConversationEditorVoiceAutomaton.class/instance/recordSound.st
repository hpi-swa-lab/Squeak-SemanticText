private
recordSound

	| maxDuration maxLevel recorder volumeThresholdForSpeech volumeThresholdForStop window accepted startEventTime |
	window := 20 milliSeconds.
	volumeThresholdForSpeech := 0.45.
	volumeThresholdForStop := "0.9"Float infinity.
	maxDuration := 10 seconds.
	
	recorder := SoundRecorder new.
	recorder samplingRate: 44100.
	recorder resumeRecording.
	maxLevel := 0.
	accepted := false.
	startEventTime := [self currentEvent timeStamp] ifError: [0].
	[[[window wait.
	maxLevel := maxLevel max: recorder meterLevel.
	accepted := (recorder meterLevel / 100 >= volumeThresholdForStop) "clap detection"
		or: [[(self currentEvent in: [:evt | evt timeStamp > startEventTime and: [evt shiftPressed]])] ifError: [Sensor shiftPressed]]]
			whileFalse]
				valueWithin: maxDuration onTimeout: []]
		ensure:
			[recorder pause].
	
	^ accepted ifTrue: [recorder recordedSound]