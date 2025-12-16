*SemanticText-Model-futures
semanticFutureWhen: eventSelector until: cancelEventSelector

	| promise |
	promise := self semanticFutureWhen: eventSelector.
	self when: cancelEventSelector evaluate:
		(MessageSend receiver: promise selector: #rejectWith: argument: nil).
	^ promise