*SemanticText-printing
semanticShortPrintString

	self flag: #moveUpstream.
	^ String streamContents: [:stream | self semanticShortPrintOn: stream]