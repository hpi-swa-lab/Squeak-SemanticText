*SemanticText-Model-futures
semanticFutureUntil: cancelEventSelector with: cancelArgument

	| promise action |
	promise := Promise new.
	action := self semanticWhen: cancelEventSelector with: cancelArgument evaluate:
		(MessageSend receiver: promise selector: #semanticRejectWith: argument: nil).
	promise semanticWhenSettled:
		[self removeAction: action forEvent: cancelEventSelector].
	^ promise