initialize-release
releaseForEventReceiver: anObject

	self messages do: [:message |
		message removeActionsWithReceiver: anObject].