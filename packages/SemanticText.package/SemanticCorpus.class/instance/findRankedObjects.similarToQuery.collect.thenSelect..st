search
findRankedObjects: number similarToQuery: aString collect: collectBlock thenSelect: selectBlock

	^ self
		findRankedDocuments: number
		similarToQuery: aString
		collect: [:document | collectBlock value: document object]
		thenSelect: selectBlock