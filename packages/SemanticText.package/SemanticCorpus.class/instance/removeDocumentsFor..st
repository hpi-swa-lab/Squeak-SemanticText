construction
removeDocumentsFor: anObject

	self documents removeAllSuchThat: [:document |
		document object = anObject].