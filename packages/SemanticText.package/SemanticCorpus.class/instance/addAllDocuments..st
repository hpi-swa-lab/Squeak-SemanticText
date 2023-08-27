construction
addAllDocuments: newDocuments

	^ newDocuments do: [:document |
		self addDocument: document]