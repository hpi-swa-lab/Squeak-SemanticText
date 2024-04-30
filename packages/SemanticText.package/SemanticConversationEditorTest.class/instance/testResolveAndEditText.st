tests
testResolveAndEditText

	| index messages |
	editor conversation config mockConfig reply: [:conversation |
		conversation lastMessage isToolMessage
			ifFalse:
				[(SemanticMessage role: #assistant content: nil)
					toolCalls:
						{(conversation activeToolSpec toolNamed: #reverse)
							asToolCallWithArguments: {conversation lastMessage content}};
					yourself]
			ifTrue:
				['Answer: ' , conversation lastMessage content]].
	
	editor conversation addFunction:
		(SemanticFunction fromString: 'reverse(string)' action: [:args | args string reversed]).
	editor conversation addUserMessage: 'plonk griffle'.
	editor completeAsIs.
	100 milliSeconds wait. 2 timesRepeat: [Project current world runStepMethods]. "simulate future: 1 sends..."
	
	self assert: 4 equals: editor conversation messages size.
	self assert: 'plonk griffle' equals: editor conversation messages first content.
	self assert: #assistant equals: editor conversation messages second role.
	self assert: nil equals: editor conversation messages second content.
	self assert: 1 equals: editor conversation messages second toolCalls size.
	self assert: editor conversation messages third isToolMessage.
	self assert: editor conversation messages second toolCalls first equals: editor conversation messages third toolCall.
	self assert: 'plonk griffle' reversed equals: editor conversation messages third content.
	self assert: 'Answer: ' , 'plonk griffle' reversed equals: editor conversation messages fourth content.
	
	messages := editor conversation messages copy.
	
	index := editor text findString: 'griffle'.
	editor complete: (editor text first: index - 1) , (Text string: 'wiffy' attributes: (editor text attributesAt: index)) ", (editor text allButFirst: index + 'griffle' size)".
	100 milliSeconds wait. 2 timesRepeat: [Project current world runStepMethods]. "simulate future: 1 sends..."
	
	self assert: 4 equals: editor conversation messages size.
	self assert: 'plonk wiffy' equals: editor conversation messages first content.
	self assert: #assistant equals: editor conversation messages second role.
	self assert: nil equals: editor conversation messages second content.
	self assert: 1 equals: editor conversation messages second toolCalls size.
	self assert: editor conversation messages third isToolMessage.
	self assert: editor conversation messages second toolCalls first equals: editor conversation messages third toolCall.
	self assert: 'plonk wiffy' reversed equals: editor conversation messages third content.
	self assert: 'Answer: ' , 'plonk wiffy' reversed equals: editor conversation messages fourth content.
	self assert: messages first identical: editor conversation messages first.
	self deny: (editor conversation messages identityIncludes: messages second).
	self deny: (editor conversation messages identityIncludes: messages third).
	self deny: (editor conversation messages identityIncludes: messages fourth).