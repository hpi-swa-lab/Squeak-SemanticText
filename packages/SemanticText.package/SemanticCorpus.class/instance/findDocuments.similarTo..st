search
findDocuments: number similarTo: documents

	^ self
		findDocuments: number
		similarTo: documents
		collect: [:doc | doc]