construction
addFragmentDocumentsFrom: object title: titleString content: contentString as: documentClass

	^ self
		addFragmentDocumentsFromTitle: titleString
		content: contentString
		collect: [:start :stop | documentClass object: object start: start stop: stop]