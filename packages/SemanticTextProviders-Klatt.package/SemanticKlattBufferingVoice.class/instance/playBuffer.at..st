playing
playBuffer: buffer at: time
	| tail |
	tail := SampledSound samples: buffer samplingRate: self samplingRate.
	sound isNil
		ifTrue: [sound := QueueSound new startTime: time - SoundPlayer bufferMSecs.
				sound add: tail]
		ifFalse: [sound add: tail]