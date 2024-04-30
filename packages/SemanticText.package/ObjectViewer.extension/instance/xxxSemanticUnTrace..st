*SemanticText-Tools-Conversation-very few messages
xxxSemanticUnTrace: aChangeBlock

	aChangeBlock == changeBlock ifTrue: [^ self xxxUnTrace].
	^ tracedObject xxxSemanticUnTrace: aChangeBlock