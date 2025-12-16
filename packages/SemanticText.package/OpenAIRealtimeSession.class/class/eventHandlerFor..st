event handlers
eventHandlerFor: type

	| handlers |
	handlers := eventHandlers at: type ifAbsent: [^ nil].
	handlers size > 1 ifTrue: [self error: ('multiple event handlers registered for {1}' format: {type})].
	^ handlers anyOne