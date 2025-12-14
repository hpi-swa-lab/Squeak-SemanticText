actions
chooseSpeechTranscriptionModel

	| model |
	model := (SemanticText chooseModelOrNilFor: #speechTranscription) ifNil: [^ self].
	self speechTranscriptionModel: model.