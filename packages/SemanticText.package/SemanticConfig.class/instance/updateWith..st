copying
updateWith: anotherConfigOrNil

	anotherConfigOrNil ifNil: [^ self].
	anotherConfigOrNil argumentsDo: [:name :value |
		self argumentAt: name put: value].