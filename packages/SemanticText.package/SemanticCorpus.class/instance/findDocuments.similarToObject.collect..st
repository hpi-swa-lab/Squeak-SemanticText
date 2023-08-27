search
findDocuments: number similarToObject: anObject collect: collectBlock

	^ self
		findDocuments: number
		similarTo: (self allDocumentsForObject: anObject)
		collect: collectBlock