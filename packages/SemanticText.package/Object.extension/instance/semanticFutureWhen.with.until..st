*SemanticText-Model-futures
semanticFutureWhen: eventSelector with: argument until: cancelEventSelector

	| promise |
	promise := self semanticFutureWhen: eventSelector with: argument.
	self when: cancelEventSelector evaluate:
		(MessageSend receiver: promise selector: #rejectWith: argument: nil).
	^ promise