actions
chooseModel

	| model |
	model := (SemanticText chooseModelOrNilFor: #conversation) ifNil: [^ self].
	self model: model.