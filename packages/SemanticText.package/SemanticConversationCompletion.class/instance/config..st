accessing
config: aConfigOrNil

	config := aConfigOrNil.
	
	effectiveConfig := self conversation ifNotNil: [self conversation config].
	aConfigOrNil ifNotNil:
		[effectiveConfig := effectiveConfig updatedWith: self config].