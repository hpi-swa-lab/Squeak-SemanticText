private
makeNewRandomIdWithPrefix: prefix

	| newId |
	[newId := prefix ,
		(((SecureHashAlgorithm new hashMessage: UUID new asString)
			printStringBase: 36 length: 24 padded: true) take: 24)
				asLowercase]
		doWhileTrue: [existingIds includes: newId].
	^ existingIds add: newId