*SemanticText-Model-futures
semanticFutureWhen: eventSelector with: argument

	| promise action |
	promise := Promise new.
	"NB: This has exactly-once semantics. Do not hold weakly on the promise because the sender only chains it, it might be GC'ed otherwise."
	action := self semanticWhen: eventSelector with: argument evaluate:
		(MessageSend receiver: promise selector: #semanticResolveWithValue: argument: nil).
	promise semanticWhenSettled:
		[self removeAction: action forEvent: eventSelector].
	^ promise