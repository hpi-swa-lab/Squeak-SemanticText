search
findRankedObjects: number similarToObjects: objects collect: collectBlock

	^ self
		findRankedDocuments: number
		similarTo: (objects gather: [:object | self allDocumentsForObject: object])
		collect: [:document | collectBlock value: document object]
		thenSelect: [:object | (objects includes: object) not]