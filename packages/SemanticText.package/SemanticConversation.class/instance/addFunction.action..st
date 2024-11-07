tools
addFunction: signatureString action: action

	^ self addFunction:
		(SemanticFunction fromSignatureString: signatureString action: action)