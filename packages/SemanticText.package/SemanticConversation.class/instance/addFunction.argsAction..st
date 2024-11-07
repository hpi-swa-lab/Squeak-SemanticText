tools
addFunction: signatureString argsAction: argsAction

	^ self addFunction:
		(SemanticFunction fromSignatureString: signatureString action: argsAction)