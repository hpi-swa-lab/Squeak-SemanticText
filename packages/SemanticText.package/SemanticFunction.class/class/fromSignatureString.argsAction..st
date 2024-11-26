instance creation
fromSignatureString: aString argsAction: argsAction

	^ (self fromSignatureString: aString)
		argsAction: argsAction;
		yourself