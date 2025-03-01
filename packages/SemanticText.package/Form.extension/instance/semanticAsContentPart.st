*SemanticText-Model-Conversation-converting
semanticAsContentPart

	^ self copy
		offset: 0 @ 0; "typical #imageForm answers offset different from zero which looks weird in TextAnchors"
		yourself