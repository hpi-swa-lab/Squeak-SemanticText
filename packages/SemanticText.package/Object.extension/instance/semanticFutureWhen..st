*SemanticText-Model-futures
semanticFutureWhen: eventSelector

	| promise |
	promise := Promise new.
	self when: eventSelector evaluate:
		(MessageSend receiver: promise selector: #semanticResolveWithValue: argument: nil).
	promise semanticWhenSettled:
		[self removeActionsWithReceiver: promise].
	^ promise