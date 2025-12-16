*SemanticText-Model-*System-Object Events-accessing-registering
semanticWhen: anEventSelector with: argument evaluate: anAction

	| action |
	action := MessageSend
		receiver: [:anObject :arg |
			anObject = argument ifTrue:
				[anAction cull: arg]]
		selector: #cull:cull:
		arguments: #(nil nil).
	self
		when: anEventSelector
		evaluate: action.
	^ action