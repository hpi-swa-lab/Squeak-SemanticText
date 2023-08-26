registry - generic
chooseModelFor: type

	^ (self chooseModelOrNilFor: type) ifNil: [self error: 'No model was chosen']