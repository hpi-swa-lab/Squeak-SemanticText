math functions
min: anotherAmount
 
	^ self class
		exactCents: (self exactCents min: anotherAmount exactCents)
		approximateCents: (self approximateCents min: anotherAmount approximateCents)