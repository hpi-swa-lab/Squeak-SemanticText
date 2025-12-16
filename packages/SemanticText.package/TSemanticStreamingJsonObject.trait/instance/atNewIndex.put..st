private
atNewIndex: index put: anObject

	super atNewIndex: index put: anObject.
	self triggerEvent: #keyAdded with: anObject key.