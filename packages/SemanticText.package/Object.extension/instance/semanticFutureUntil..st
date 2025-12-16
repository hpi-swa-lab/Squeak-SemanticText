*SemanticText-Model-futures
semanticFutureUntil: cancelEventSelector

	| promise |
	promise := Promise new.
	self when: cancelEventSelector evaluate:
		(MessageSend receiver: promise selector: #rejectWith: argument: nil).
	promise semanticWhenSettled:
		[self removeActionsWithReceiver: promise].
	^ promise