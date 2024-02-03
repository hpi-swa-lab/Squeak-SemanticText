math functions
max: anotherAmount
 
	^ self class
		exactCents: (self exactCents max: anotherAmount exactCents)
		approximateCents: (self approximateCents max: anotherAmount approximateCents)