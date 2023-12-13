search
findRankedDocuments: number similarTo: documents collect: collectBlock thenSelect: selectBlock

	^ self
		findDocuments: number
		similarTo: documents
		collect: collectBlock
		thenSelect: selectBlock
		includeRanks: true