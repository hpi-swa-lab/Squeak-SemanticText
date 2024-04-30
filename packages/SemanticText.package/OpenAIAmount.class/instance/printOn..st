printing
printOn: aStream

	| useDollars factor sign |
	useDollars := self exactCents >= 100 or: [self approximateCents >= 100].
	sign := useDollars ifTrue: [$$] ifFalse: [$¢].
	factor := useDollars ifTrue: [0.01] ifFalse: [1].
	
	(self exactCents ~= 0 or: [self approximateCents = 0]) ifTrue:
		[aStream
			nextPut: sign;
			print: self exactCents * factor maxDecimalPlaces:
				((useDollars not and: [self exactCents < 0.05] and: [self exactCents > 0])
					ifTrue: [(1 - ((self exactCents * factor) log: 10)) ceiling]
					ifFalse: [2]).
		self approximateCents ~= 0 ifTrue:
			[aStream nextPutAll: ' + ']].
	self approximateCents ~= 0 ifTrue:
		[aStream
			nextPutAll: 'approx ';
			nextPut: sign;
			print: self approximateCents * factor maxDecimalPlaces:
				((useDollars not and: [self approximateCents < 0.05] and: [self approximateCents > 0])
					ifTrue: [(1 - ((self approximateCents * factor) log: 10)) ceiling]
					ifFalse: [2])].