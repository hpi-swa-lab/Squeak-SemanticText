fileIn/Out
readDocumentsFrom: aStream

	'Reading corpus...' semanticDisplayRichProgressFrom: aStream position to: aStream size during: [:bar |
		[aStream atEnd] whileFalse: [
			self addDocument: (self readNextDocumentFrom: aStream).
			bar value: aStream position]].