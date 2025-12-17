private
recordSound

	| window volumeThresholdForStop maxDuration streamBlock recorder maxLevel accepted startEventTime |
	self flag: #todo. "refactor! make this an own class??"
	window := 20 milliSeconds.
	volumeThresholdForStop := "0.9"Float infinity. "clap detection (currently disabled)"
	maxDuration := 5 minutes.
	streamBlock := self streamRecordingsBlock.
	
	recorder := SoundRecorder new.
	recorder samplingRate: self samplingRate.
	streamBlock ifNotNil:
		[recorder := recorder as: SoundInputStream.
		recorder bufferSize:
			recorder samplingRate *
				(window semanticFullSeconds clampLow: 0.1 "recorder seems to drop smaller buffers?")].
	recorder startRecording; resumeRecording.
	maxLevel := 0.
	accepted := nil.
	startEventTime := [self currentEvent timeStamp] ifError: [0].
	[[[window wait.
	streamBlock ifNotNil:
		[| newBuffer |
		newBuffer := SoundBuffer streamContents: [:stream |
			| nextBuffer |
			[nextBuffer := recorder nextBufferOrNil] whileNotNil:
				[stream nextPutAll: nextBuffer]].
		streamBlock ifNotNil:
			[streamBlock value: newBuffer]].
	maxLevel := maxLevel max: recorder meterLevel.
	accepted := recorder meterLevel / 100 >= volumeThresholdForStop
		or: [true
			caseOf:
				{[[(self currentEvent in: [:evt | evt timeStamp > startEventTime and: [evt shiftPressed]])] ifError: [Sensor shiftPressed]] -> [true].
				[[(self currentEvent in: [:evt | evt timeStamp > startEventTime and: [evt commandKeyPressed]])] ifError: [Sensor commandKeyPressed]] -> [false]}
			otherwise: [nil]]]
			whileNil]
				valueWithin: maxDuration onTimeout: []]
		ensure:
			[recorder pause.
			streamBlock ifNotNil:
				[| newBuffer |
				newBuffer := SoundBuffer streamContents: [:stream |
					| nextBuffer |
					[nextBuffer := recorder nextBufferOrNil] whileNotNil:
						[stream nextPutAll: nextBuffer]].
				streamBlock value: newBuffer].
			
			recorder stopRecording].
	
	^ accepted = true ifTrue: [recorder recordedSound ifNil: [true]]