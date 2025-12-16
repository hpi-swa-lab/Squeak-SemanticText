private
basicContentPartsFrom: aTextOrContent

	| lastPart newParts |
	aTextOrContent ifNil:
		[^ #()].
	
	aTextOrContent isText ifFalse:
		[^ {aTextOrContent semanticAsContentPart}].
	
	lastPart := nil.
	newParts := OrderedCollection new.
	(aTextOrContent copy removeAttributesThat: [:attr | attr semanticIsContentPartAttribute not])
		runs withStartStopAndValueDo: [:start :stop :contentPartAttributes |
		| allAttributes partStart newPart |
		(lastPart isString and: [lastPart endsWith: String cr])
			ifTrue: [newParts removeLast; addLast: lastPart allButLast].
		partStart := (lastPart notNil and: [(aTextOrContent at: start) = Character cr]
			and: [lastPart isText ==> [lastPart semanticAllAttributes anySatisfy: [:attr | attr semanticIsContentPartAttribute not]]])
				ifTrue: [start + 1]
				ifFalse: [start].
		allAttributes := aTextOrContent semanticAllAttributesFrom: start to: stop.
		newPart := contentPartAttributes
			ifEmpty:
				[((allAttributes ifEmpty: [aTextOrContent string] ifNotEmpty: [aTextOrContent]) copyFrom: partStart to: stop) ifEmpty:
					[start = aTextOrContent size
						ifTrue: [''] "special case for preserving {aSound. ''} at before streaming transcription. but in the general case we don't want this because parts are naturally separated by CRs. Can we find a more generic solution?"
						ifFalse: [nil]]]
			ifNotEmpty:
				[contentPartAttributes size = 1 ifFalse: [self error: 'message content must not contain overlapping attributes'].
				contentPartAttributes first semanticAsContentPartFor: (aTextOrContent copyFrom: partStart to: stop)].
		newPart ifNotNil:
			[lastPart := newParts addLast: newPart]].
	
	^ newParts asArray