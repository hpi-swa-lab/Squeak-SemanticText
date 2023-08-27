fileIn/Out
writeDocumentsOn: aStream limit: limit

	| number start |
	number := limit ifNil: [self documents size].
	start := DateAndTime now.
	
	aStream binary.
	(self documents take: number)
		do: [:document | document writeOn: aStream]
		semanticDisplayingRichProgress: 'Storing documents...'.