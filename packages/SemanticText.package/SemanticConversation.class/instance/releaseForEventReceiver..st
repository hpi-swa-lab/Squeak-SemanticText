initialize-release
releaseForEventReceiver: anObject

	self removeActionsWithReceiver: anObject.
	self messages do: [:message |
		message releaseForEventReceiver: anObject].