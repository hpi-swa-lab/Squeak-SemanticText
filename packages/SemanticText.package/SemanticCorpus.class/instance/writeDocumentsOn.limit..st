fileIn/Out
writeDocumentsOn: aStream limit: limit

	| number |
	number := limit ifNil: [self documents size].
	
	aStream binary.
	(self documents take: number)
		do: [:document | document writeOn: aStream]
		semanticDisplayingRichProgress: 'Storing documents...'.