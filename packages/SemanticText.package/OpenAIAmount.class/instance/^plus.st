arithmetic
+ anotherAmount

	^ self species
		exactCents: self exactCents + anotherAmount exactCents
		approximateCents: self approximateCents + anotherAmount approximateCents