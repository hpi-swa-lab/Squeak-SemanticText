search
findObjects: number similarToQuery: aString collect: collectBlock

	^ self
		findDocuments: number
		similarToQuery: aString
		collect: [:document | collectBlock value: document object]