tests
testPasteText

	| otherEditor copy index placeholder |
	editor conversation config mockConfig reply: ([:conversation |
		conversation lastMessage content reversed]
			semanticBeClean flag: #workaround "required to avoid much-to-deep copy of config").
	
	otherEditor := editor veryDeepCopy.
	otherEditor conversation addUserMessage: 'plonk griffle'.
	otherEditor completeAsIs.
	self assert: 'plonk griffle' reversed equals: otherEditor conversation messages last content.
	index := otherEditor text findString: 'plonk'.
	copy := otherEditor text copyFrom: index to: index + 'plonk' size.
	
	placeholder := editor textFromMessages: {SemanticMessage role: #user content: ''}.
	editor complete: placeholder , copy.
	
	self assert: 'plonk' equals: editor conversation messages first content.
	self assert: 'plonk' reversed equals: editor conversation messages second content.
	self assert: 'plonk griffle' equals: otherEditor conversation messages first content.