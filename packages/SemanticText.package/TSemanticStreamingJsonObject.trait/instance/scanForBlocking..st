private
scanForBlocking: anObject

	| array index |
	[array := self array.
	index := self basicScanForBlocking: anObject.
	self array == array] whileFalse.
	(array at: index) ifNotNil: [:assoc |
		assoc value isStream ifTrue:
			[(Promise race:
				{self semanticFutureWhen: #completed until: #cancelled.
				assoc value semanticFutureWhen: #completed until: #cancelled}) wait]].
	^ index