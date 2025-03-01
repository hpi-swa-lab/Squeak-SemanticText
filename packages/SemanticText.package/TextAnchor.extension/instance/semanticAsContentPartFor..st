*SemanticText-Model-Conversation-converting
semanticAsContentPartFor: aString

	self assert: aString = Character startOfHeader asString.
	^ self anchoredMorph semanticAsContentPart