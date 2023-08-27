search
findDocuments: number similarTo: documents collect: collectBlock

	^ self
		findDocuments: number
		similarTo: documents
		collect: collectBlock
		thenSelect: nil