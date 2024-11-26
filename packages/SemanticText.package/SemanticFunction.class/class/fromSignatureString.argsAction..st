instance creation
fromSignatureString: aString argsAction: argsAction

	aString isSymbol ifFalse:
		[^ (self fromSignatureString: aString)
			argsAction: argsAction;
			yourself].
	
	^ self new
		name: aString;
		argsAction: argsAction;
		in: [:function |
			argsAction semanticArgumentNames do: [:name |
				function addParameter: name type: JsonObject new]];
		yourself