*SemanticText-Model-resolving
semanticResolveWithValue: arg

	mutex critical: [
		(state == #pending) ifTrue: [ | worklist |
			value := arg.
			state := #fulfilled.
			worklist := resolvers.
			resolvers := #().
			rejecters := #().
			worklist do: [:r | self evaluateResolver: r]]]