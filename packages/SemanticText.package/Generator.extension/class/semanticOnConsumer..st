*SemanticText-Model-Conversation-instance creation
semanticOnConsumer: aBlock
	"Answer a new inverse generator where aBlock consumes items and the sender is responsible for producing them. Experimental."

	^ self on: [:gen |
		| sender |
		sender := thisContext swapSender: nil. "required because otherwise every #next from here will create a LOOP on the stack (crashing the VM on some Context primitives!)"
		self assert: gen next isNil.
		aBlock value: gen.
		self assert: gen next isNil.
		thisContext swapSender: sender]