registry - generic
chooseDefaultModelFor: type

	| newDefault |
	newDefault := self chooseModelOrNilFor: type.
	newDefault ifNil: [^ nil].
	^ self setModel: newDefault asDefaultFor: type