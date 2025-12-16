accessing
associationsDo: aBlock 

	self jsonIsComplete ifFalse:
		[(self semanticFutureWhen: #completed until: #cancelled) wait].
	^ super associationsDo: aBlock