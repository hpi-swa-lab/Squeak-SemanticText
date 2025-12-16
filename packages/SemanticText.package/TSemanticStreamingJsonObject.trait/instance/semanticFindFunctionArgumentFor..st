*SemanticText-Model-Conversation-accessing
semanticFindFunctionArgumentFor: aParameter

	self jsonIsComplete ifFalse:
		[aParameter type = #array ifTrue:
			[^ self expectedArrayMaybeStreamAt: aParameter name].
		aParameter type = #string ifTrue:
			[^ self expectedStringMaybeStreamAt: aParameter name].
		(aParameter type isDictionary ifTrue: [aParameter type type]) = #object ifTrue:
			[^ self expectedObjectAt: aParameter name]].
	
	^ super semanticFindFunctionArgumentFor: aParameter