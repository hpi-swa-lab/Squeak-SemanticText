search
findDocuments: number similarToObjects: objects collect: collectBlock

	^ self
		findDocuments: number
		similarTo: (objects gather: [:object | self allDocumentsForObject: object])
		collect: collectBlock