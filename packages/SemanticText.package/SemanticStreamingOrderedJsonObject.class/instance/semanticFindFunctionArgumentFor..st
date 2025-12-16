*SemanticText-Model-Conversation-accessing
semanticFindFunctionArgumentFor: aParameter

	self jsonIsComplete ifFalse:
		[aParameter actualType = #array ifTrue:
			[^ self expectedArrayMaybeStreamAt: aParameter name].
		aParameter actualType = #string ifTrue:
			[^ self expectedStringMaybeStreamAt: aParameter name].
		aParameter actualType = #object ifTrue:
			[^ self expectedObjectAt: aParameter name]].
	
	^ super semanticFindFunctionArgumentFor: aParameter