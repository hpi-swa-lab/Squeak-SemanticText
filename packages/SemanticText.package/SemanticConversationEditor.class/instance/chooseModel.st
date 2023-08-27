actions
chooseModel

	| model |
	model := (SemanticText chooseModelOrNilFor: #conversation) ifNil: [^ self].
	self conversation model: model.
	self changed: #model.