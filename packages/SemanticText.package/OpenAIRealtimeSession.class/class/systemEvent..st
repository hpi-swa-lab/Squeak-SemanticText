event handlers
systemEvent: anEvent

	anEvent itemClass isMeta ifTrue: [^ self].
	
	eventHandlers keysAndValuesRemove: [:type :selectors |
		(selectors remove: anEvent itemSelector ifAbsent: nil)
			ifNil: [false]
			ifNotNil: [selectors isEmpty]].
	
	(anEvent isAdded or: [anEvent isModified]) ifFalse: [^ self].
	(anEvent item pragmaAt: #serverEvent:) ifNotNil: [:pragma |
		(eventHandlers at: (pragma argumentAt: 1) ifAbsentPut: [SortedCollection new])
			add: anEvent itemSelector].