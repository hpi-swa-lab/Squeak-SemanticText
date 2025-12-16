*SemanticText-Model-*System-Object Events-accessing-private
semanticHandle: anObject if: anotherObject thenSend: aMessageSelector

	^ anObject = anotherObject ifTrue:
		[self perform: aMessageSelector]