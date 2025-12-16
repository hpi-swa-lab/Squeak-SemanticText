*SemanticText-Tools-Conversation-accessing-pseudo-override
pauseRecordingDuring: aBlock

	| recorderStarts |
	self flag: #moveUpstream.
	recorderStarts := self allSubInstances
		select: [:each | each isActive and: [each isPaused not]]
		thenCollect: [:each | each stopRecording. WeakKeyAssociation key: each value: Time millisecondClock].
	^ aBlock ensure:
		[recorderStarts do: [:assoc |
			assoc key ifNotNil: [:recorder |
				| start stop pauseDuration |
				self flag: #todo. "what if it was stopped from the outside in the meantime?"
				start := assoc value.
				stop := Time millisecondClock.
				pauseDuration := stop - start / 1000.
				pauseDuration > 3600 ifTrue: [self halt: 'this will become a pretty big recording'].
				recorder startRecording.
				recorder emitBuffer:
					(SoundBuffer newMonoSampleCount:
						(pauseDuration *
							((recorder instVarNamed: 'stereo')
								ifTrue: [recorder samplingRate asInteger * 2]
								ifFalse: [recorder samplingRate asInteger])
									truncateTo: recorder samplesPerFrame)).
				recorder resumeRecording]]]