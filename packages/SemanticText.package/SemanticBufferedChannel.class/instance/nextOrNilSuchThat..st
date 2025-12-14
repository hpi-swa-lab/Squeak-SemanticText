accessing
nextOrNilSuchThat: aBlock

	consumed atEnd ifFalse: [^ self halt].
	self halt.
	^ super nextOrNil