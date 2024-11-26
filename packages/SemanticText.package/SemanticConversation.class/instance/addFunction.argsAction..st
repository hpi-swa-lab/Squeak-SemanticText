tools
addFunction: signatureString argsAction: argsAction

	^ self addFunction:
		(SemanticFunction fromSignatureString: signatureString argsAction: argsAction)