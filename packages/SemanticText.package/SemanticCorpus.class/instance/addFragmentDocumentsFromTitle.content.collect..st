construction
addFragmentDocumentsFromTitle: titleString content: contentString collect: factoryBlock

	^ Array streamContents: [:stream |
		self split: contentString title: titleString do: [:start :stop |
			| document |
			document := factoryBlock value: start value: stop.
			self addDocument: document.
			stream nextPut: document]]