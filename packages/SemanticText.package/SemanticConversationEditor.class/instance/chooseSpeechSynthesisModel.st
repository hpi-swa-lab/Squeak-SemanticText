actions
chooseSpeechSynthesisModel

	| model |
	model := (SemanticText chooseModelOrNilFor: #speechSynthesis) ifNil: [^ self].
	self speechSynthesisModel: model.