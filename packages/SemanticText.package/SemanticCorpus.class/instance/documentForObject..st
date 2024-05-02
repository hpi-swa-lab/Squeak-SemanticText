accessing
documentForObject: anObject

	| objectDocuments |
	objectDocuments := self documentsForObject: anObject.
	objectDocuments ifEmpty: [^ (NotFound object: anObject) signal].
	objectDocuments size > 1 ifTrue: [^ self error: 'There are multiple documents for ' , anObject].
	^ objectDocuments anyOne