comparing
= anObject

	anObject species = self species ifFalse: [^ false].
	^ (self exactCents = anObject exactCents)
		and: [self approximateCents = anObject approximateCents]