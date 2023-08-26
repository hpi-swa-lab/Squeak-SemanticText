arithmetic
* aNumber

	^ self class
		exactCents: self exactCents * aNumber
		approximateCents: self approximateCents * aNumber