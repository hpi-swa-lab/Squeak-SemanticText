instance creation
fromSignatureString: aString action: action

	^ (self fromSignatureString: aString)
		action: action;
		yourself