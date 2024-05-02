private
parseNumber: aString

	| fractionMatcher number stream |
	fractionMatcher := '\[ (?<n>-?\d+) \: (?<d>\d+) \]' semanticAsExtendedRegex.
	(fractionMatcher matches: aString)
		ifTrue: [^ (fractionMatcher keyedSubexpression: #n) asNumber / (fractionMatcher keyedSubexpression: #d) asNumber].
	
	(aString beginsWith: '.') ifTrue: [^ self parseNumber: (aString copyWithFirst: $0)].
	stream := aString readStream.
	number := Number readFrom: stream.
	stream atEnd ifFalse: [^ self error: 'could not complete calculation, unsupported operations?'].
	^ number