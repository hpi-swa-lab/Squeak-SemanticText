accessing
nextTimeout: millisecondsOrNil

	consumed atEnd ifFalse: [^ consumed next].
	self halt.
	^ super nextTimeout: millisecondsOrNil