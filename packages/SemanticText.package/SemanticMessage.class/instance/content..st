accessing
content: aTextOrContent

	| lastPart newParts |
	aTextOrContent ifNil:
		[contentParts := #().
		^ self].
	
	aTextOrContent isText ifFalse:
		[contentParts := {aTextOrContent semanticAsContentPart}.
		^ self].
	
	lastPart := nil.
	newParts := OrderedCollection new.
	aTextOrContent runs withStartStopAndValueDo: [:start :stop :attributes |
		| partStart newPart |
		(lastPart isString and: [lastPart endsWith: String cr])
			ifTrue: [newParts removeLast; addLast: lastPart allButLast].
		partStart := (lastPart notNil and: [(aTextOrContent at: start) = Character cr])
			ifTrue: [start + 1]
			ifFalse: [start].
		newPart := attributes
			ifEmpty:
				[aTextOrContent string copyFrom: partStart to: stop]
			ifNotEmpty:
				[attributes size = 1 ifFalse: [self error: 'message content must not contain overlapping attributes'].
				attributes first semanticAsContentPartFor: (aTextOrContent copyFrom: partStart to: stop)].
		lastPart := newParts addLast: newPart].
	contentParts := newParts asArray.