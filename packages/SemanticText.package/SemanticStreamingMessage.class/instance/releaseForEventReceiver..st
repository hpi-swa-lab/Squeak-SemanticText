initialize-release
releaseForEventReceiver: anObject

	super releaseForEventReceiver: anObject.
	self removeActionsWithReceiver: anObject.