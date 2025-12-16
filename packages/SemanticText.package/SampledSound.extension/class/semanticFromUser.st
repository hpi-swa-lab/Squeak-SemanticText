*SemanticText-Model-Speech-instance creation
semanticFromUser

	| recorder choice |
	recorder := SoundRecorder new.
	recorder samplingRate: 44100. "important! gpt-4o-audio models seem to have big trouble with  default 11025 and start hallucinating when they can't understand the user"
	recorder startRecording; resumeRecording.
	choice := Project uiManager
		chooseOptionFromLabeledValues:
			(OrderedDictionary new
				at: 'Stop' put: [recorder recordedSound];
				at: 'Cancel' put: [nil];
				yourself)
		title: 'Recording...'.
	recorder stopRecording.
	^ choice value