construction
addFragmentDocumentsFrom: object as: documentClass

	^ self
		addFragmentDocumentsFrom: object
		title: object semanticTitle
		content: object semanticContent
		as: documentClass