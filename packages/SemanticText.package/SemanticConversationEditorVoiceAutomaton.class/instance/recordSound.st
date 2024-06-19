private
recordSound

	| maxDuration maxLevel recorder volumeThresholdForSpeech volumeThresholdForStop window |
	window := 20 milliSeconds.
	volumeThresholdForSpeech := 0.45.
	volumeThresholdForStop := 0.9.
	maxDuration := 10 seconds.
	
	recorder := SoundRecorder new.
	recorder resumeRecording.
	maxLevel := 0.
	[[[window wait.
	maxLevel := maxLevel max: recorder meterLevel.
	recorder meterLevel / 100 >= volumeThresholdForStop]
		whileFalse]
			valueWithin: maxDuration onTimeout: []]
		ensure:
			[recorder pause].
	
	^ maxLevel / 100 >= volumeThresholdForSpeech
		ifTrue: [recorder recordedSound]