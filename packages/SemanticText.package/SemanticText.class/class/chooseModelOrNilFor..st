registry - generic
chooseModelOrNilFor: type

	| models |
	models := self registeredModelsFor: type.
	models ifEmpty: [^ self error: ('There are no {1} models' format: {type})].
	models size = 1 ifTrue: [^ models anyOne].
	models := models sorted: #name ascending.
	^ Project uiManager
		chooseFrom: models
		values: models
		title: ('Choose {1} model' format: {type})