tests
testEditText

	| index messages |
	editor conversation config mockConfig reply: [:conversation |
		conversation lastMessage content reversed].
	
	editor conversation addUserMessage: 'plonk griffle'.
	editor completeAsIs.
	self assert: 'plonk griffle' reversed equals: editor conversation messages last content.
	messages := editor conversation messages copy.
	
	index := editor text findString: 'griffle'.
	editor complete: (editor text first: index - 1) , (Text string: 'wiffy' attributes: (editor text attributesAt: index)) ", (editor text allButFirst: index + 'griffle' size)".
	
	self assert: 'plonk wiffy' equals: editor conversation messages first content.
	self assert: 'plonk wiffy' reversed equals: editor conversation messages second content.
	self assert: messages first identical: editor conversation messages first.
	self deny: messages second identical: editor conversation messages second.