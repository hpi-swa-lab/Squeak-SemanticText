initialize-release
initialize

	super initialize.
	
	existingIds := Set new.
	promises := Dictionary new.
	self initializeEventLog.
	
	currentResponses := OrderedCollection new.