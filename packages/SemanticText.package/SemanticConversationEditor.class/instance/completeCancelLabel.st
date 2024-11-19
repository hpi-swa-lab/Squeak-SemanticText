toolbuilder
completeCancelLabel

	^ self isStreamingResponse
		ifFalse: ['Complete']
		ifTrue: ['Cancel']