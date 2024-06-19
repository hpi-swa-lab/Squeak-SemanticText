*SemanticText-Model-Speech-instance creation
semanticFromUser

	| recorder choice |
	recorder := SoundRecorder new.
	recorder resumeRecording.
	choice := Project uiManager
		chooseOptionFromLabeledValues:
			(OrderedDictionary new
				at: 'Stop' put: [recorder recordedSound];
				at: 'Cancel' put: [nil];
				yourself)
		title: 'Recording...'.
	recorder pause.
	^ choice value