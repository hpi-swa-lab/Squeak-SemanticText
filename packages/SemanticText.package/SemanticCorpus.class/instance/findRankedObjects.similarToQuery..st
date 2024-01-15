search
findRankedObjects: number similarToQuery: aString

	^ self
		findRankedObjects: number
		similarToQuery: aString
		collect: [:object | object]