registry - generic
chooseModelOrNilFor: type

	| models |
	models := self registeredModelsFor: type.
	models ifEmpty: [^ self error: ('There are no {1} models' format: {type})].
	models size = 1 ifTrue: [^ models anyOne].
	models := models sorted: [:model | (model respondsTo: #sortKey) ifTrue: [model sortKey] ifFalse: [model name]] ascending.
	^ Project uiManager
		chooseFrom: (models collect: [:model | model asStringOrText])
		values: models
		title: ('Choose {1} model' format: {type})