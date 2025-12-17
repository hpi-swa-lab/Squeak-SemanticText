*SemanticText-Model-futures
semanticFutureWhen: eventSelector with: argument

	| promise action |
	promise := Promise new.
	action := self semanticWhen: eventSelector with: argument evaluate:
		(MessageSend receiver: promise selector: #semanticResolveWithValue: argument: nil).
	promise semanticWhenSettled:
		[self removeAction: action forEvent: eventSelector].
	^ promise