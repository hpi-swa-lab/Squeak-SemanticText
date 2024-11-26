as yet unclassified
asCode

	^ String streamContents: [:stream |
		self storeCodeOn: stream]