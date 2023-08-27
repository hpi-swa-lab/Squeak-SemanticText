construction
addFragmentDocumentsFrom: object

	^ self
		addFragmentDocumentsFromTitle: (self titleFor: object)
		content: (self contentFor: object)
		collect: [:start :stop |
			self documentClass
				corpus: self
				object: object
				start: start
				stop: stop]