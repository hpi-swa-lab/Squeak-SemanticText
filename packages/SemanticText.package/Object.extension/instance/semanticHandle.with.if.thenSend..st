*SemanticText-Model-*System-Object Events-accessing-private
semanticHandle: anObject with: anArg if: anotherObject thenSend: aMessageSelector

	^ anObject = anotherObject ifTrue:
		[self perform: aMessageSelector with: anArg]