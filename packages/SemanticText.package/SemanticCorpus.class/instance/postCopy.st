copying
postCopy

	| documentCopies postCopyDocuments |
	super postCopy.
	
	embeddingConfig := embeddingConfig copy.
	
	documentCopies := #pending.
	postCopyDocuments := [:needCopies |
		documentCopies = #pending ifTrue:
			[documentCopies := needCopies
				ifFalse:
					[documents := documents collect: [:document | document copy].
					nil]
				ifTrue:
					[documentCopies := Dictionary new.
					documents := documents collect: [:document |
						documentCopies at: document put: document copy].
					documentCopies]].
		documentCopies].
	self postCopyAfterDocuments: [postCopyDocuments value: true].
	postCopyDocuments value: false.
	
	self flag: #todo. "swapping???"
	
	embeddingCache := nil.