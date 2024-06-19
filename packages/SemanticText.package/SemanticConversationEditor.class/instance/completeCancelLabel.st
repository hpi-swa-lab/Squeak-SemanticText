toolbuilder
completeCancelLabel

	^ self canComplete
		ifTrue: ['Complete']
		ifFalse: ['Cancel']