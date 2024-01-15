search
findRankedObjects: number similarToQuery: aString collect: collectBlock

	^ self
		findRankedDocuments: number
		similarToQuery: aString
		collect: [:document | collectBlock value: document object]