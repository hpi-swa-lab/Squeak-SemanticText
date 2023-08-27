accessing
allDocumentsForObject: anObject

	(anObject respondsTo: #semanticDocumentsIn:) ifTrue:
		[^ anObject semanticDocumentsIn: self].
	
	^ self documentsForObject: anObject
	
	